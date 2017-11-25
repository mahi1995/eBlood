using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using WebSite1;
using System.Data;
using System.Data.SqlClient;

public partial class Account_Login : Page
{
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
             
            Connection con = null;
            SqlCommand com = null;
            SqlDataReader reader = null;
        if (String.IsNullOrEmpty(UserName.Text) || String.IsNullOrEmpty(Password.Text))
            {
            
            FailureText.Text = "Please fill everything..";
                 return;
            }

        try
        {
            con = new Connection();
            com = new SqlCommand();
            com.Connection = con.conn;
            com.CommandText = "select uid from users where email=@email and pass=@pass";
            com.Parameters.Clear();
            com.Parameters.Add("@email", SqlDbType.NVarChar).Value = UserName.Text;
            com.Parameters.Add("@pass", SqlDbType.NVarChar).Value = Password.Text;
            reader = com.ExecuteReader();
            if (reader.Read())
            {
               
                Session["uid"] = reader.GetString(0);
                Response.Redirect("~/Default.aspx");

                if (reader != null)
                    reader.Close();
                if (con != null)
                    con.conn.Close();

            }
            else
            {
                con = new Connection();
                com = new SqlCommand();
                com.Connection = con.conn;
                com.CommandText = "select email from admin where email=@email and pass=@pass";
                com.Parameters.Clear();
                com.Parameters.Add("@email", SqlDbType.NVarChar).Value = UserName.Text;
                com.Parameters.Add("@pass", SqlDbType.NVarChar).Value = Password.Text;
                reader = com.ExecuteReader();
                if (reader.Read())
                {

                    Session["uid"] = reader.GetString(0);
                    Response.Redirect("~/HomeAdmin.aspx");

                }
                else
                {

                    FailureText.Text = "Invalid Username or password";
                    FailureText.Visible = true;
                    Response.Write("<script>alert('Invalid Username or password')</script>");
                }
            }
        }
        catch(Exception ex)
        {
            FailureText.Text= ex.Message;
            Response.Write("<script>alert('"+ex.Message+"')</script>");

        }
        finally
        {
            if (reader != null)
                reader.Close();
            if (con != null)
                con.conn.Close();
        }
        }
}