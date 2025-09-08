using System;
using System.Data.SqlClient;
using System.Data;
using PortfolioWebApp.Utils;

namespace PortfolioWebApp
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFeaturedProjects();
            }
        }

        private void LoadFeaturedProjects()
        {
            string query = "SELECT TOP 3 * FROM Projects ORDER BY CreatedDate DESC";

            using (SqlDataReader reader = DatabaseHelper.ExecuteReader(query))
            {
                DataTable dt = new DataTable();
                dt.Load(reader);
                FeaturedProjectsRepeater.DataSource = dt;
                FeaturedProjectsRepeater.DataBind();
            }
        }
    }
}