using PortfolioWebApp.Utils;
using System;
using System.Web;

namespace PortfolioWebApp
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (AuthHelper.IsUserLoggedIn())
            {
                var currentUser = AuthHelper.GetCurrentUser();
                if (currentUser != null)
                {
                    LoginLink.Visible = false;
                    RegisterLink.Visible = false;
                    LogoutLink.Visible = true;
                    WelcomeMessage.Visible = true;
                    UsernameLiteral.Text = currentUser.FullName ?? currentUser.Username;

                    if (currentUser.IsAdmin)
                    {
                        AdminLink.Visible = true;
                    }
                }
            }
            else
            {
                // Check for Remember Me cookie
                HttpCookie rememberMeCookie = Request.Cookies["RememberMe"];
                if (rememberMeCookie != null && !string.IsNullOrEmpty(rememberMeCookie.Value))
                {
                    // Auto-login logic could be implemented here
                }
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            AuthHelper.LogOut();
            Response.Redirect("Default.aspx");
        }
    }
}