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
public partial class Account_Register : Page
{
    
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        Connection con=null;
        SqlCommand com = null;
        SqlDataReader reader = null;
        String uid = "";
        try
        {
            con = new Connection();
            if(String.IsNullOrEmpty(UserName.Text)||string.IsNullOrEmpty(Password.Text) || string.IsNullOrEmpty(ConfirmPassword.Text) || string.IsNullOrEmpty(WeightText.Text) || string.IsNullOrEmpty(DOBText.Text) || string.IsNullOrEmpty(StateText.Text) || string.IsNullOrEmpty(CityText.Text) || string.IsNullOrEmpty(PhoneText.Text) ||!Password.Text.ToString().Trim().Equals(ConfirmPassword.Text.ToString().Trim()))
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
            if (reader.Read()&& reader.GetInt32(1)>0)
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
            com.CommandText = "insert into users (uid,name,email,pass,weight,dob,state,city,pin,phone,blood_group) values(@uid,@name,@email,@pass,@weight,@dob,@state,@city,@pin,@phone,@blood_group)";
            com.Parameters.Clear();
            com.Parameters.Add("@uid", SqlDbType.NVarChar).Value =uid;
            com.Parameters.Add("@name", SqlDbType.NVarChar).Value = txtname.Text;
            com.Parameters.Add("@email", SqlDbType.NVarChar).Value = UserName.Text;
            com.Parameters.Add("@pass", SqlDbType.NVarChar).Value =Password.Text;
            com.Parameters.Add("@weight", SqlDbType.Real).Value = WeightText.Text;
            com.Parameters.Add("@dob", SqlDbType.DateTime).Value =DOBText.Text;
            com.Parameters.Add("@state", SqlDbType.NVarChar).Value = StateText.Text;
            com.Parameters.Add("@city", SqlDbType.NVarChar).Value = CityText.Text;

            com.Parameters.Add("@pin", SqlDbType.Int).Value = PINText.Text;
            com.Parameters.Add("@phone", SqlDbType.NVarChar).Value = PhoneText.Text;
            com.Parameters.Add("@blood_group", SqlDbType.Int).Value = BloodList.SelectedItem.Value;

            if (com.ExecuteNonQuery() > 0)
            {
                
                Response.Redirect("Login.aspx");
            }
            else
                ErrorMessage.Text = "Unable to register please try later...";

        }
        catch (Exception ex)
        {
            if(ex.Message.ToString().Contains("Violation of UNIQUE KEY"))
            {
                ErrorMessage.Text = "Email already exists..";
            }else
            ErrorMessage.Text = ex.Message;

        }finally
        {
            if (reader != null)
                reader.Close();
            if (con != null)
                con.conn.Close();
        }
    }

    protected void Page_Load(object sender, EventArgs e)
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
        }
        catch(Exception ex)
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