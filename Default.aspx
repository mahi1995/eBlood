<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ MasterType VirtualPath="~/Site.master" %> 
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div runat="server" id="divdonorrequests" class="Pending_trans">
       <h1> Doante Requests</h1>


      </div>
    <div class="Search_doner"> 
        <h1>Search Blood</h1>
        <p>Blood Group :<asp:DropDownList CssClass="form-control" ID="ddblood" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddblood_SelectedIndexChanged">
            <asp:ListItem Value="-1">Select Blood Group</asp:ListItem>
                        </asp:DropDownList></p>
        <p>City Group :<asp:DropDownList CssClass="form-control" ID="ddcity"  AutoPostBack="true"  runat="server" OnSelectedIndexChanged="ddcity_SelectedIndexChanged">
                        <asp:ListItem Value="-1">Select City</asp:ListItem>

                       </asp:DropDownList></p>
    </div>
       <div id="divdonors" visible="false" runat="server" class="UserDetails">
        <h1>Donors</h1>
           <asp:GridView ID="griddonors" runat="server"  AutoGenerateColumns="False" AllowSorting="True" DataSourceID="donorDataSource" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" DataKeyNames="uid" >
               <Columns>
                   <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                   <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                   <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                   <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                   <asp:BoundField DataField="pin" HeaderText="pin" SortExpression="pin" />
                   <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                   <asp:BoundField Visible="false" DataField="uid" HeaderText="uid" SortExpression="uid" ReadOnly="True" />
                    <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:Button ID="Request" runat="server" CausesValidation="false" CommandName="Request"
                   OnClick="btnRequest_Click"   CssClass="btn btn-primary" Text="Request" CommandArgument='<%# Eval("uid") %>' />
            </ItemTemplate>
        </asp:TemplateField>
               </Columns>

               <FooterStyle BackColor="#CCCCCC" />
               <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
               <RowStyle BackColor="White" />
               <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
               <SortedAscendingCellStyle BackColor="#F1F1F1" />
               <SortedAscendingHeaderStyle BackColor="#808080" />
               <SortedDescendingCellStyle BackColor="#CAC9C9" />
               <SortedDescendingHeaderStyle BackColor="#383838" />

           </asp:GridView>
           <asp:SqlDataSource ID="donorDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT name, email, state, city, pin, phone, uid FROM users WHERE (blood_group = @blood_group) and status=1">
               <SelectParameters>
                   <asp:ControlParameter ControlID="ddblood" Name="blood_group" PropertyName="SelectedValue" Type="Int32" />
               </SelectParameters>
           </asp:SqlDataSource>
    </div>
    <div runat="server" id="divuserdetails" visible="false" class="UserDetails">
        <h1>User Details</h1>
        <asp:DetailsView   ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="selfdatasource" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="pass" HeaderText="pass" SortExpression="pass" />
                <asp:BoundField DataField="weight" HeaderText="weight" SortExpression="weight" />
                <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
                <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="pin" HeaderText="pin" SortExpression="pin" />
                <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                <asp:BoundField DataField="blood_group" HeaderText="blood_group" SortExpression="blood_group" />
            </Fields>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="selfdatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [users] WHERE [uid] = @uid" InsertCommand="INSERT INTO [users] ([name], [email], [weight], [dob], [state], [city], [pin], [phone], [blood_group], [uid]) VALUES (@name, @email, @weight, @dob, @state, @city, @pin, @phone, @blood_group, @uid)" 
            SelectCommand="SELECT users.name, users.email, users.pass, users.weight, users.dob, users.state, users.city, users.pin, users.phone, blood.blood_group FROM blood INNER JOIN users ON blood.Id = users.blood_group  where uid=@SessionVar" 
            UpdateCommand="UPDATE users SET name = @name, email = @email, weight = @weight, dob = @dob, state = @state, city = @city, pin = @pin, phone = @phone WHERE (uid = @uid)">
           <SelectParameters>
             <asp:SessionParameter Name="SessionVar" SessionField="uid" ConvertEmptyStringToNull="true" />
          </SelectParameters>
             <DeleteParameters>
                <asp:Parameter Name="uid" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="weight" Type="Decimal" />
                <asp:Parameter Name="dob" Type="DateTime" />
                <asp:Parameter Name="state" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="pin" Type="Int32" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="blood_group" Type="Int32" />
                <asp:Parameter Name="uid" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="weight" Type="Decimal" />
                <asp:Parameter Name="dob" Type="DateTime" />
                <asp:Parameter Name="state" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="pin" Type="Int32" />
                <asp:Parameter Name="phone" Type="String" />
               
                <asp:Parameter Name="uid" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

     <div runat="server"  id="panelreaquest" visible="false"  class="panel panel-primary" style="margin-top:30px">
      <div class="panel-heading">Your Request has been sent.</div>
      <div runat="server" id="divdetails" class="panel-body">Please contact the Person personally.<br />

         

      </div>
    </div>


    
    <div runat="server" id="divrequesthistory" visible="false" class="Pending_trans">
       <h1> Request  History</h1>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="HistoryDataSource" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>

        <asp:SqlDataSource ID="HistoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name], [email], [phone], [date] FROM [transactions] WHERE ([uid] = @uid)">
            <SelectParameters>
                <asp:SessionParameter Name="uid" SessionField="uid" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

      </div>




</asp:Content>
