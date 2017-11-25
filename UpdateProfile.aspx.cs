using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSite1;
using System.Collections.Generic;
using System.Collections;
using System.Data.SqlClient;
using System.Data;

public partial class UpdateProfile : Page
{
    Button btn = new Button();
    TextBox txt = new TextBox();

    static List<TextBox> texts = new List<TextBox>();
    protected void CreateUser_Click(object sender, EventArgs e)
    {


        Connection con = null;
        SqlCommand com = null;
        SqlDataReader reader = null;
        String uid = "";
        try
        {
            con = new Connection();
            if (String.IsNullOrEmpty(UserName.Text) || string.IsNullOrEmpty(WeightText.Text) || string.IsNullOrEmpty(StateText.Text) || string.IsNullOrEmpty(CityText.Text) || string.IsNullOrEmpty(PhoneText.Text))
            {
                ErrorMessage.Text = "please fill everything...";
                return;
            }
            con = new Connection();
            com = new SqlCommand();
            com.Connection = con.conn;
            com.CommandText = "select max(uid),count(*) from users";
            reader = com.ExecuteReader();
            uid = DateTime.Now.Year.ToString() + "" + DateTime.Now.Month.ToString() + "_";
            if (reader.Read() && reader.GetInt32(1) > 0)
            {

                String temp = reader.GetString(0).ToString();
                if (!temp.Substring(4, 2).Equals(DateTime.Now.Month.ToString()))
                    uid += "1";
                else
                {
                    temp = temp.Substring(temp.IndexOf("_"));
                    temp = temp.Substring(1);
                    int tmp = Convert.ToInt32(temp);
                    tmp++;
                    uid += "" + tmp;
                }
            }
            else
            {
                uid += "1";
            }
            if (reader != null)
                reader.Close();

            com.CommandText = "update users set   name=@name,email=@email,weight=@weight,state=@state,city=@city,pin=@pin,phone=@phone,blood_group=@blood_group where uid='" + Session["uid"] + "'";
            com.Parameters.Add("@name", SqlDbType.NVarChar).Value = txtname.Text;
            com.Parameters.Add("@email", SqlDbType.NVarChar).Value = UserName.Text;
            com.Parameters.Add("@weight", SqlDbType.Real).Value = WeightText.Text;
            com.Parameters.Add("@state", SqlDbType.NVarChar).Value = StateText.Text;
            com.Parameters.Add("@city", SqlDbType.NVarChar).Value = CityText.Text;
            com.Parameters.Add("@pin", SqlDbType.Int).Value = PINText.Text;
            com.Parameters.Add("@phone", SqlDbType.NVarChar).Value = PhoneText.Text;
            com.Parameters.Add("@blood_group", SqlDbType.Int).Value = BloodList.SelectedItem.Value;


            if (com.ExecuteNonQuery() > 0)
            {
                Response.Write("<script>alert('Updated Successfully')</script>");
                Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='1; url=Default.aspx'/>"));
                 
                

                //Response.AddHeader("REFRESH", "10;URL=Default.aspx");
                //Response.Redirect("Default.aspx");
              
            }
            else
                ErrorMessage.Text = "Unable to register please try later...";
        }



        catch (Exception ex)
        {
            ErrorMessage.Text = ex.ToString();
            Response.Write("<script>alert('s')</script>");
        }
        finally
        {
            if (reader != null)
                reader.Close();
            if (con != null)
                con.conn.Close();
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Connection con = null;
            SqlCommand com = null;
            SqlDataReader reader = null;
            try
            {
                con = new Connection();
                com = new SqlCommand("select id,blood_group from blood", con.conn);
                reader = com.ExecuteReader();
                while (reader.Read())
                {
                    ListItem item = new ListItem(reader.GetString(1), reader.GetInt32(0) + "");
                    BloodList.Items.Add(item);
                }
                reader.Close();

                com = new SqlCommand("select uid, name, email, pass, weight, dob, state, city, pin, phone, blood_group from users where uid='" + Session["uid"] + "'", con.conn);
                reader = com.ExecuteReader();

                while (reader.Read())
                {
                    txtname.Text = (reader["name"].ToString());
                    UserName.Text = (reader["email"].ToString());
                    WeightText.Text = (reader["weight"].ToString());
                    StateText.Text = (reader["state"].ToString());
                    CityText.Text = (reader["city"].ToString());
                    PINText.Text = (reader["pin"].ToString());
                    PhoneText.Text = (reader["phone"].ToString());
                    BloodList.SelectedValue = (reader["blood_group"].ToString());
                }
                reader.Close();
            }

            catch (Exception ex)
            {
                ErrorMessage.Text = ex.Message;
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

}