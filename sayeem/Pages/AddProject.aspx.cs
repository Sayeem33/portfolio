using System;
using System.Data.SqlClient;
using PortfolioWebApp.Utils;

namespace PortfolioWebApp
{
    public partial class AddProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in and is admin
            var currentUser = AuthHelper.GetCurrentUser();
            if (currentUser == null || !currentUser.IsAdmin)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void AddProjectButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    var currentUser = AuthHelper.GetCurrentUser();

                    string query = @"INSERT INTO Projects (Title, Description, Technologies, GitHubLink, LiveLink, ImagePath, CreatedBy) 
                                   VALUES (@title, @description, @technologies, @github, @live, @image, @createdBy)";

                    SqlParameter[] parameters = {
                        new SqlParameter("@title", TitleTextBox.Text.Trim()),
                        new SqlParameter("@description", DescriptionTextBox.Text.Trim()),
                        new SqlParameter("@technologies", TechnologiesTextBox.Text.Trim()),
                        new SqlParameter("@github", string.IsNullOrEmpty(GitHubLinkTextBox.Text.Trim()) ? (object)DBNull.Value : GitHubLinkTextBox.Text.Trim()),
                        new SqlParameter("@live", string.IsNullOrEmpty(LiveLinkTextBox.Text.Trim()) ? (object)DBNull.Value : LiveLinkTextBox.Text.Trim()),
                        new SqlParameter("@image", string.IsNullOrEmpty(ImagePathTextBox.Text.Trim()) ? (object)DBNull.Value : ImagePathTextBox.Text.Trim()),
                        new SqlParameter("@createdBy", currentUser.UserId)
                    };

                    DatabaseHelper.ExecuteNonQuery(query, parameters);

                    Response.Redirect("Projects.aspx");
                }
                catch (Exception ex)
                {
                    ErrorPanel.Visible = true;
                    ErrorLiteral.Text = "An error occurred while adding the project. Please try again.";
                }
            }
        }
    }
}