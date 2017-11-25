using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class _HomeAdmin : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {
            Response.Redirect("Account/login.aspx");
        }
      

    }
    protected void btnDisable_Click(object sender, EventArgs e)
    {
        Connection con = null;
        SqlCommand com = null;
        Button b = (Button)sender;
     
        if (b.Text.Equals("Active"))
        {
            try
            {
                con = new Connection();
                com = new SqlCommand("Update users set status=0 where uid like'" +b.CommandArgument+"'", con.conn);
               if( com.ExecuteNonQuery()>0)
                {
                    Response.Write("<script>alert('Doner Disabled')</script>");
                    b.Text = "Disable";
                }

            }
            catch (Exception ex)
            {
               
            }
            finally
            {
                if (con != null)
                    con.conn.Close();
            }
        }
        else
        {
                try
                {
                    con = new Connection();
                    com = new SqlCommand("Update users set status=1 where uid like'" + b.CommandArgument + "'", con.conn);
                    if (com.ExecuteNonQuery() > 0)
                    {
                        Response.Write("<script>alert('Doner Enabled)</script>");
                    b.Text = "Enable";
                }

                }
                catch (Exception ex)
                {

                }
                finally
                {
                    if (con != null)
                        con.conn.Close();
                }
            }
        GridView2.DataBind();
        
      }
   
}