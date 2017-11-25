using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ChnPasswordAdmin : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {
            Response.Redirect("Account/login.aspx");
        }
    }
    public void btnSaveClick(object sender, EventArgs e)
    {
        Connection con = null;
        SqlCommand com = null;
        SqlDataReader reader = null;
        var User = Session["uid"];
        if (String.IsNullOrEmpty(curr_pass.Text) || String.IsNullOrEmpty(new_pass.Text) || String.IsNullOrEmpty(conf_pass.Text))
        {

           
            return;
        }
        try
        {
            con = new Connection();
            com = new SqlCommand();
            com.Connection = con.conn;
            com.CommandText = "select pass from admin where email=@email";
            com.Parameters.Clear();
            com.Parameters.Add("@email", SqlDbType.NVarChar).Value = User;
            reader = com.ExecuteReader();
            if (reader.Read())
            {

                var curr_pass = reader.GetString(0);
                if (curr_pass == new_pass.Text)
                {
                    Response.Write("<script>alert('Current password and New password cannot be same')</script>");
                    return;
                }
                else
                {
                    if (reader != null)
                        reader.Close();
                    com.CommandText = "update admin set pass=@conf_pass where email=@email";
                    com.Parameters.Clear();
                    com.Parameters.Add("@conf_pass", SqlDbType.NVarChar).Value = conf_pass.Text;
                    com.Parameters.Add("@email", SqlDbType.NVarChar).Value = User;
                    if (com.ExecuteNonQuery()>0)
                    {
                        Response.Write("<script>alert('Password has been changed Successfully')</script>");
                        Response.Redirect("~/HomeAdmin.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Ooops something went wrong')</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid userId')</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");

        }
        finally
        {
            if (reader != null)
                reader.Close();
            if (con != null)
                con.conn.Close();
        }
        //Response.Write("<script>alert('"+conf_pass.Text+"');</script>");
    }
}