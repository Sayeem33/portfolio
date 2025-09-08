using System;
using System.Data.SqlClient;
using PortfolioWebApp.Utils;

namespace PortfolioWebApp
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (AuthHelper.IsUserLoggedIn())
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    // Check if username or email already exists
                    if (UserExists(UsernameTextBox.Text.Trim(), EmailTextBox.Text.Trim()))
                    {
                        ErrorPanel.Visible = true;
                        ErrorLiteral.Text = "Username or email already exists.";
                        return;
                    }

                    // Create new user
                    string hashedPassword = AuthHelper.HashPassword(PasswordTextBox.Text);

                    string query = @"INSERT INTO Users (Username, Email, Password, FullName) 
                                   VALUES (@username, @email, @password, @fullname)";

                    SqlParameter[] parameters = {
                        new SqlParameter("@username", UsernameTextBox.Text.Trim()),
                        new SqlParameter("@email", EmailTextBox.Text.Trim()),
                        new SqlParameter("@password", hashedPassword),
                        new SqlParameter("@fullname", FullNameTextBox.Text.Trim())
                    };

                    DatabaseHelper.ExecuteNonQuery(query, parameters);

                    // Auto-login the user
                    var user = AuthHelper.AuthenticateUser(UsernameTextBox.Text.Trim(), PasswordTextBox.Text);
                    if (user != null)
                    {
                        Session["UserId"] = user.UserId;
                        Session["Username"] = user.Username;
                        Session["IsAdmin"] = user.IsAdmin;

                        Response.Redirect("Default.aspx");
                    }
                }
                catch (Exception ex)
                {
                    ErrorPanel.Visible = true;
                    ErrorLiteral.Text = "An error occurred during registration. Please try again.";
                }
            }
        }

        private bool UserExists(string username, string email)
        {
            string query = "SELECT COUNT(*) FROM Users WHERE Username = @username OR Email = @email";
            SqlParameter[] parameters = {
                new SqlParameter("@username", username),
                new SqlParameter("@email", email)
            };

            int count = (int)DatabaseHelper.ExecuteScalar(query, parameters);
            return count > 0;
        }
    }
}