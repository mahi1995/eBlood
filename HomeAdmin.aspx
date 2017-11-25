<%@ Page Title="Admin Home" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeFile="HomeAdmin.aspx.cs" Inherits="_HomeAdmin" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
    <style type="text/css">
  .hiddencol
  {
    display: none;
  }
</style>
    <div class="UserDetails">
        <h1>User Details<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [uid], [email], [name], [weight], [dob], [state], [city], [blood_group], [phone], [pin], [status] FROM [users]"></asp:SqlDataSource>
        </h1>
       <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="uid" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
           <AlternatingRowStyle BackColor="#CCCCCC" />
           <Columns>
               <asp:BoundField DataField="uid" HeaderText="uid" ReadOnly="True" SortExpression="uid" />
               <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
               <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
               <asp:BoundField DataField="weight" HeaderText="weight" SortExpression="weight" />
               <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" DataFormatString="{0:d}"/>
               <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
               <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
               <asp:BoundField DataField="blood_group" HeaderText="blood_group" SortExpression="blood_group" />
               <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
               <asp:BoundField DataField="pin" HeaderText="pin" SortExpression="pin" />
               <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
               <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="disable" runat="server" CausesValidation="false" CommandName="Disable"
                       OnClick="btnDisable_Click"   CssClass='<%# ((int)Eval("status")==0) ? "btn btn-danger" : "btn btn-info" %>' Text='<%# ((int)Eval("status")==1) ? "Active" : "Deactive" %>'  CommandArgument='<%# Eval("uid") %>' />
                </ItemTemplate>
        </asp:TemplateField>
               
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
    </div>
    </div>
</asp:Content>
