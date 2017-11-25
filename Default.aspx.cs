using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Connection con = null;
        SqlCommand com = null;
        SqlDataReader reader = null;
        try
        {
            con = new Connection();
            com = new SqlCommand();
            com.Connection = con.conn;
            com.CommandText = "select date,id,name,email,phone from transactions where uid='" + Session["uid"] + "' and type=0";
            reader = com.ExecuteReader();
            while (reader.Read())
            {
               
                HtmlGenericControl div1 = new HtmlGenericControl("div");
                div1.Attributes.Add("class", "panel panel-primary");
                div1.Attributes.Add("style", "margin-top:20px");
               

                HtmlGenericControl div2 = new HtmlGenericControl("div");
                div2.Attributes.Add("class", "panel-heading");
                div2.InnerHtml = "New Notification!!!!";

                HtmlGenericControl div3 = new HtmlGenericControl("div");
                div3.Attributes.Add("class", "panel-body");
                div3.InnerHtml = "You have new donate request on " + reader["date"].ToString() + " <br/> You may Receive a Call from receiver Soon....<br/><h3>Details</h3><br/> <strong>Name :</strong> "+reader.GetString(2)+ "<br/><strong>Email :</strong> " + reader.GetString(3)+"<br/><strong>Phone :</strong> "+reader.GetString(4)+"<br/><br/>";

                Button btn = new Button();
                btn.Text = "OK";
                btn.CssClass = "btn btn-info";
                btn.ID = reader.GetInt32(1).ToString();
                btn.Click += Btn_Click;

                div3.Controls.Add(btn);

                div1.Controls.Add(div2);
                div1.Controls.Add(div3);
                divdonorrequests.Controls.Add(div1);
            }
        }
        catch (Exception ex)
        {

        }
        finally
        {
            if (reader != null)
                reader.Close();
            if (con != null)
                con.conn.Close();
        }


        if (!Page.IsPostBack)
        {

        try
        {
           
                con = new Connection();
                com = new SqlCommand("select id,blood_group from blood", con.conn);
                reader = com.ExecuteReader();
                while (reader.Read())
                {
                    ListItem item = new ListItem(reader.GetString(1), reader.GetInt32(0) + "");
                    ddblood.Items.Add(item);
                }
                reader.Close();

                com = new SqlCommand("select distinct city from users where blood_group=" + Convert.ToInt16(ddblood.SelectedItem.Value), con.conn);
                reader = com.ExecuteReader();
                while (reader.Read())
                {
                    ListItem item = new ListItem(reader.GetString(0));
                    ddcity.Items.Add(item);
                }
                reader.Close();
            }
        catch (Exception ex)
        {

        }
        finally
        {
            if (reader != null)
                reader.Close();
            if (con != null)
                con.conn.Close();
        }
    }
        if (Session["uid"] != null)
        {
            Master.login_reg.Visible = false;
            Master.logout_btn.Visible = true;
            divuserdetails.Visible = true;
            divrequesthistory.Visible = true;

        }
        else
        {
            Master.logout_btn.Visible = false;
            Master.login_reg.Visible = true;
         }
        

    }

    private void Btn_Click(object sender, EventArgs e)
    {
        Connection con = null;
        SqlCommand com = null;
        SqlDataReader reader = null;
        try
        {
            con = new Connection();
            com = new SqlCommand();
            com.Connection = con.conn;
            com.CommandText = "update transactions set type=1 where id=" + Convert.ToInt32(((Button)sender).ID);
            com.ExecuteNonQuery();
            Response.Redirect("default.aspx");
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('something went wrong!!')</script>");
        }
        finally
        {
            if (reader != null)
                reader.Close();
            if (con != null)
                con.conn.Close();
        }
    }

    protected void ddblood_SelectedIndexChanged(object sender, EventArgs e)
    {
        divdonors.Visible = true;
        Connection con = null;
        SqlCommand com = null;
        SqlDataReader reader = null;
        ddcity.Items.Clear();
        try
        {
            con = new Connection();
            com = new SqlCommand("select distinct city from users where blood_group=" + Convert.ToInt16(ddblood.SelectedItem.Value), con.conn);
            //Response.Write("<script>alert('"+ ddblood.SelectedItem.Value + "')</script>");
            reader = com.ExecuteReader();
            while (reader.Read())
            {
                ListItem item = new ListItem(reader.GetString(0));
                ddcity.Items.Add(item);
            }
            reader.Close();

        }
        catch(Exception ex)
        {

        }finally
        {

            if (reader != null)
                reader.Close();
            if (con != null)
                con.conn.Close();
        }
    }
    void donor_Load()
    {
        divdonors.Visible = true;
        Connection con = null;
        SqlCommand com = null;
        try
        {
            con = new Connection();
            com = new SqlCommand("select name,email,state,city,pin,phone,blood.blood_group from users,blood where users.blood_group=dblood.id and users.blood_group='"+ddblood.SelectedItem.Text+"' and city='"+ddcity.SelectedItem.Text+"'",con.conn);
            SqlDataAdapter adp = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            griddonors.DataSource = ds;
            griddonors.DataBind();

        }
        catch (Exception ex)
        {
            Response.Redirect("<script>alert('error')</script>");
        }
        finally
        {
            
            if (con != null)
                con.conn.Close();
        }
    }

    protected void ddcity_SelectedIndexChanged(object sender, EventArgs e)
    {
        //donor_Load();
        string FilterExpression = string.Concat("city", " LIKE '%{0}%'");
        donorDataSource.FilterParameters.Clear();
        donorDataSource.FilterParameters.Add(new ControlParameter(ddcity.SelectedValue, "ddcity", "SelectedValue"));
        donorDataSource.FilterExpression = FilterExpression;
    }

    protected void btnRequest_Click(object sender, EventArgs e)
    {
        Response.Redirect("RequestPage.aspx?to=" + ((Button)sender).CommandArgument.ToString());
    }
}