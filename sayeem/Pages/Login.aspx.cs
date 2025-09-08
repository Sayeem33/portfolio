using System;
using PortfolioWebApp.Utils;

namespace PortfolioWebApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (AuthHelper.IsUserLoggedIn())
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                var user = AuthHelper.AuthenticateUser(UsernameTextBox.Text.Trim(), PasswordTextBox.Text);

                if (user != null)
                {
                    Session["UserId"] = user.UserId;
                    Session["Username"] = user.Username;
                    Session["IsAdmin"] = user.IsAdmin;

                    if (RememberMeCheckBox.Checked)
                    {
                        AuthHelper.SetRememberMeCookie(user.Username);
                    }

                    Response.Redirect("Default.aspx");
                }
                else
                {
                    ErrorPanel.Visible = true;
                    ErrorLiteral.Text = "Invalid username or password.";
                }
            }
        }
    }
}