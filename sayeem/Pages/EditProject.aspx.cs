using System;
using System.Data.SqlClient;
using System.IO;
using PortfolioWebApp.Utils;

namespace PortfolioWebApp
{
    public partial class EditProject : System.Web.UI.Page
    {
        private int ProjectId
        {
            get
            {
                if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int id))
                    return id;
                return 0;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            var currentUser = AuthHelper.GetCurrentUser();
            if (currentUser == null || !currentUser.IsAdmin)
            {
                Response.Redirect("Login.aspx");
            }

            if (ProjectId == 0)
            {
                Response.Redirect("Projects.aspx");
            }

            if (!IsPostBack)
            {
                LoadProjectData();
            }
        }

        private void LoadProjectData()
        {
            string query = "SELECT * FROM Projects WHERE ProjectId = @projectId";
            SqlParameter[] parameters = { new SqlParameter("@projectId", ProjectId) };

            using (SqlDataReader reader = DatabaseHelper.ExecuteReader(query, parameters))
            {
                if (reader.Read())
                {
                    TitleTextBox.Text = reader["Title"].ToString();
                    DescriptionTextBox.Text = reader["Description"].ToString();
                    TechnologiesTextBox.Text = reader["Technologies"].ToString();
                    GitHubLinkTextBox.Text = reader["GitHubLink"].ToString();
                    LiveLinkTextBox.Text = reader["LiveLink"].ToString();
                    string imagePath = reader["ImagePath"].ToString();
                    CurrentImage.ImageUrl = "~/" + imagePath;
                }
                else
                {
                    Response.Redirect("Projects.aspx");
                }
            }
        }

        protected void UpdateProjectButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string imagePath = CurrentImage.ImageUrl.Substring(2); // remove "~/" from path

                    // If new file uploaded, save it
                    if (fuImage.HasFile)
                    {
                        string fileName = Path.GetFileName(fuImage.PostedFile.FileName);
                        imagePath = "Images/" + fileName;
                        fuImage.SaveAs(Server.MapPath("~/" + imagePath));
                    }

                    string query = @"UPDATE Projects 
                                     SET Title = @title, Description = @description, Technologies = @technologies,
                                         GitHubLink = @github, LiveLink = @live, ImagePath = @image
                                     WHERE ProjectId = @projectId";

                    SqlParameter[] parameters = {
                        new SqlParameter("@projectId", ProjectId),
                        new SqlParameter("@title", TitleTextBox.Text.Trim()),
                        new SqlParameter("@description", DescriptionTextBox.Text.Trim()),
                        new SqlParameter("@technologies", TechnologiesTextBox.Text.Trim()),
                        new SqlParameter("@github", string.IsNullOrEmpty(GitHubLinkTextBox.Text.Trim()) ? (object)DBNull.Value : GitHubLinkTextBox.Text.Trim()),
                        new SqlParameter("@live", string.IsNullOrEmpty(LiveLinkTextBox.Text.Trim()) ? (object)DBNull.Value : LiveLinkTextBox.Text.Trim()),
                        new SqlParameter("@image", imagePath)
                    };

                    DatabaseHelper.ExecuteNonQuery(query, parameters);
                    Response.Redirect("Projects.aspx");
                }
                catch (Exception ex)
                {
                    ErrorPanel.Visible = true;
                    ErrorLiteral.Text = "An error occurred while updating the project. Please try again.";
                }
            }
        }
    }
}
