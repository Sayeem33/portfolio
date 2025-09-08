using System;
using System.Data;
using System.Data.SqlClient;
using PortfolioWebApp.Utils;

namespace PortfolioWebApp
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var currentUser = AuthHelper.GetCurrentUser();
            if (currentUser == null || !currentUser.IsAdmin)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            // Load total projects count
            string projectQuery = "SELECT COUNT(*) FROM Projects";
            int totalProjects = (int)DatabaseHelper.ExecuteScalar(projectQuery);
            TotalProjectsLiteral.Text = totalProjects.ToString();

            // Load total users count
            string userQuery = "SELECT COUNT(*) FROM Users";
            int totalUsers = (int)DatabaseHelper.ExecuteScalar(userQuery);
            TotalUsersLiteral.Text = totalUsers.ToString();

            // Load recent projects count (last 30 days)
            string recentQuery = "SELECT COUNT(*) FROM Projects WHERE CreatedDate >= DATEADD(day, -30, GETDATE())";
            int recentProjects = (int)DatabaseHelper.ExecuteScalar(recentQuery);
            RecentProjectsLiteral.Text = recentProjects.ToString();

            // Load recent projects for the list
            LoadRecentProjects();
        }

        private void LoadRecentProjects()
        {
            string query = "SELECT TOP 5 * FROM Projects ORDER BY CreatedDate DESC";

            using (SqlDataReader reader = DatabaseHelper.ExecuteReader(query))
            {
                DataTable dt = new DataTable();
                dt.Load(reader);
                RecentProjectsRepeater.DataSource = dt;
                RecentProjectsRepeater.DataBind();
            }
        }
    }
}