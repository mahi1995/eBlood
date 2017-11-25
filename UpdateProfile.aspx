
<%@ Page Title="Update Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="UpdateProfile.aspx.cs" Inherits="UpdateProfile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <h1  class="text-primary" >Edit Profile</h1>
    <div Class="row"  style="box-shadow:0 0 10px black;background-image: url('../images/blood_donation_1(ii).jpg')"">
        <asp:Panel runat="server" ID="Panel2" CssClass="panel-body">         
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>        
         <div class="col-xs-7 pull-bottom">
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtname" CssClass="col-md-2 control-label">Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtname" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtname"
                    CssClass="text-danger" ErrorMessage="*" />
             </div>
        </div>
                 <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">Email-ID</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="UserName" CssClass="form-control"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                    CssClass="text-danger" ErrorMessage="*" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="UserName" CssClass="text-danger"
                    ErrorMessage="Incorrect Email-ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
            </div>
        </div>
       
       <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">Weight</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="WeightText" CssClass="form-control"  />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="WeightText"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="*" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="WeightText" CssClass="text-danger"
                        ErrorMessage="Weight>=50kg" ValidationExpression="^([0-9]*[1-9][0-9]*(\.[0-9]+)?|[0]+\.[0-9]*[1-9][0-9]*)$" />
                
            </div>
        </div>
      
       <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">State</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="StateText" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="StateText"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="*" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="StateText" CssClass="text-danger"
                    ErrorMessage="Alphabets only" ValidationExpression="^([A-Za-z])*$" />
            </div>
        </div>
       <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">City</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="CityText" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="CityText"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="*" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="CityText" CssClass="text-danger"
                    ErrorMessage="Alphabets only" ValidationExpression="^([A-Za-z])*$" />
            </div>
        </div>
       <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">PIN Code</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="PINText" CssClass="form-control" MaxLength="6" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="PINText"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="*" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="PINText" CssClass="text-danger"
                    ErrorMessage="6 digit number only" ValidationExpression="^[1-9][0-9]{5}$" />
            </div>
        </div>
       <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">Phone Number</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="PhoneText" CssClass="form-control" TextMode="Phone"  MaxLength="10" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="PhoneText"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="*" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="PhoneText" CssClass="text-danger"
                    ErrorMessage="10 digit number only" ValidationExpression="^[7-9]{1}\d{9}$" />
            </div>
        </div>
       <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">Blood Group</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList CssClass="form-control" ID="BloodList" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="BloodList"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="*" />
            </div>
        </div>
           
                 </div>
            

        </asp:Panel>
             
               
       <div class="col-xs-7 pull-bottom">
       <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Update" CssClass="btn btn-primary" />
                   <br /> 
                   <br /> 
            </div>
        </div>
        </div> 
        </div> 
</asp:Content>
