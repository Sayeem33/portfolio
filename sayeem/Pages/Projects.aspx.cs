using System;
using System.Data;
using System.Data.SqlClient;
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
            if (currentUser != null && currentUser.IsAdmin)
            {
                AdminTopPanel.Visible = true;
            }
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
                LoadProjects(); // Refresh list
            }
        }

        private void DeleteProject(int projectId)
        {
            string query = "DELETE FROM Projects WHERE ProjectId = @projectId";
            SqlParameter[] parameters = { new SqlParameter("@projectId", projectId) };

            DatabaseHelper.ExecuteNonQuery(query, parameters);
        }
    }
}
