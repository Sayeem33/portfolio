using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;
using PortfolioWebApp.Utils;

namespace PortfolioWebApp
{
    public partial class Projects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProjects();
                CheckAdminAccess();
            }
        }

        private void LoadProjects()
        {
            string query = "SELECT * FROM Projects ORDER BY CreatedDate DESC";

            using (SqlDataReader reader = DatabaseHelper.ExecuteReader(query))
            {
                DataTable dt = new DataTable();
                dt.Load(reader);

                if (dt.Rows.Count > 0)
                {
                    rptProjects.DataSource = dt;
                    rptProjects.DataBind();
                    NoProjectsPanel.Visible = false;
                }
                else
                {
                    NoProjectsPanel.Visible = true;
                }
            }
        }

        private void CheckAdminAccess()
        {
            var currentUser = AuthHelper.GetCurrentUser();
            AdminTopPanel.Visible = currentUser != null && currentUser.IsAdmin;
        }

        protected bool IsUserAdmin()
        {
            var currentUser = AuthHelper.GetCurrentUser();
            return currentUser != null && currentUser.IsAdmin;
        }

        protected void rptProjects_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int projectId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Edit")
            {
                Response.Redirect($"EditProject.aspx?id={projectId}");
            }
            else if (e.CommandName == "Delete")
            {
                DeleteProject(projectId);
                LoadProjects(); // Refresh after delete
            }
        }

        private void DeleteProject(int projectId)
        {
            // 1. Get the image path (create new parameter array)
            string imgQuery = "SELECT ImagePath FROM Projects WHERE ProjectId = @projectId";
            string imagePath = null;

            using (SqlDataReader reader = DatabaseHelper.ExecuteReader(imgQuery,
                new SqlParameter[] { new SqlParameter("@projectId", projectId) }))
            {
                if (reader.Read())
                {
                    imagePath = reader["ImagePath"]?.ToString();
                }
            }

            // 2. Delete the project from DB (use new parameters)
            string deleteQuery = "DELETE FROM Projects WHERE ProjectId = @projectId";
            DatabaseHelper.ExecuteNonQuery(deleteQuery,
                new SqlParameter[] { new SqlParameter("@projectId", projectId) });

            // 3. Delete the image file from server
            if (!string.IsNullOrEmpty(imagePath))
            {
                string fullPath = Server.MapPath("~/" + imagePath);
                if (File.Exists(fullPath))
                {
                    File.Delete(fullPath);
                }
            }
        }
    }
}
