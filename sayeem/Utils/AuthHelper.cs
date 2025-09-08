using System;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using PortfolioWebApp.Models;

namespace PortfolioWebApp.Utils
{
    public static class AuthHelper
    {
        public static string HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(bytes);
            }
        }

        public static User AuthenticateUser(string username, string password)
        {
            // Hash the entered password
            string hashedPassword = HashPassword(password);

            // FIXED: Changed PasswordHash -> Password (match your DB column)
            string query = "SELECT * FROM Users WHERE Username = @username AND Password = @password";

            SqlParameter[] parameters = {
                new SqlParameter("@username", username),
                new SqlParameter("@password", hashedPassword)  // still using hash for safety
            };

            using (SqlDataReader reader = DatabaseHelper.ExecuteReader(query, parameters))
            {
                if (reader.Read())
                {
                    return new User
                    {
                        UserId = (int)reader["UserId"],
                        Username = reader["Username"].ToString(),
                        Email = reader["Email"].ToString(),
                        FullName = reader["FullName"].ToString(),
                        IsAdmin = (bool)reader["IsAdmin"],
                        CreatedDate = (DateTime)reader["CreatedDate"]
                    };
                }
            }
            return null;
        }

        public static bool IsUserLoggedIn()
        {
            return HttpContext.Current.Session["UserId"] != null;
        }

        public static User GetCurrentUser()
        {
            if (!IsUserLoggedIn()) return null;

            int userId = (int)HttpContext.Current.Session["UserId"];
            string query = "SELECT * FROM Users WHERE UserId = @userId";
            SqlParameter[] parameters = { new SqlParameter("@userId", userId) };

            using (SqlDataReader reader = DatabaseHelper.ExecuteReader(query, parameters))
            {
                if (reader.Read())
                {
                    return new User
                    {
                        UserId = (int)reader["UserId"],
                        Username = reader["Username"].ToString(),
                        Email = reader["Email"].ToString(),
                        FullName = reader["FullName"].ToString(),
                        IsAdmin = (bool)reader["IsAdmin"],
                        CreatedDate = (DateTime)reader["CreatedDate"]
                    };
                }
            }
            return null;
        }

        public static void SetRememberMeCookie(string username)
        {
            HttpCookie cookie = new HttpCookie("RememberMe", username);
            cookie.Expires = DateTime.Now.AddDays(30);
            HttpContext.Current.Response.Cookies.Add(cookie);
        }

        public static void RemoveRememberMeCookie()
        {
            HttpCookie cookie = new HttpCookie("RememberMe");
            cookie.Expires = DateTime.Now.AddDays(-1);
            HttpContext.Current.Response.Cookies.Add(cookie);
        }

        public static void LogOut()
        {
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
            RemoveRememberMeCookie();
        }
    }
}
