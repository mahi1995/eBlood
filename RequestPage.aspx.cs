using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] != null)
        {
            Connection con = null;
            SqlCommand com = null;
            SqlDataReader reader = null;
            try
            {
                con = new Connection();
                com = new SqlCommand();
                com.Connection = con.conn;
                com.CommandText = "select name,email,phone from users where uid='" + Session["uid"] + "'";
                reader = com.ExecuteReader();
                if (reader.Read())
                {
                    txtname.Text = reader.GetString(0);
                    UserName.Text = reader.GetString(1);
                    PhoneText.Text = reader.GetString(2);
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
            finally
            {

                if (con != null)
                    con.conn.Close();
                if (reader != null)
                    reader.Close();
            }
        }
    }

    protected void sendRequest_Click(object sender, EventArgs e)
    {
       Connection con = null;
        SqlCommand com = null;
        try
        {

            con = new Connection();
            com = new SqlCommand();
            com.Connection = con.conn;
            com.CommandText = "insert into transactions(uid,date,name,email,phone) values(@uid,@date,@name,@email,@phone)";
            com.Parameters.Clear();
            com.Parameters.Add("@uid", SqlDbType.NVarChar).Value = Request.QueryString["to"].ToString();
            com.Parameters.Add("@date", SqlDbType.DateTime).Value = DateTime.Now;
            com.Parameters.Add("@name", SqlDbType.NVarChar).Value = txtname.Text;
            com.Parameters.Add("@email", SqlDbType.NVarChar).Value = UserName.Text;
            com.Parameters.Add("@phone", SqlDbType.NVarChar).Value = PhoneText.Text;
            if (com.ExecuteNonQuery() > 0)
            {
                Response.Write("<script>alert('Request has been sent...')</script>");
                Response.AddHeader("REFRESH", "1;URL=default.aspx");
            }

        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('"+ex.Message+"')</script>");
        }
        finally
        {

            if (con != null)
                con.conn.Close();
        }
    }
}