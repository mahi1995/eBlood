

<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2 class="text-primary"><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
   <div class="row" style="background-image: url('../images/blood_donation_1(ii).jpg')">
       <br /> 
       <h4>&nbsp;&nbsp;&nbsp;&nbsp;Create a new account.</h4>
        <hr />
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
                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                    CssClass="text-danger" ErrorMessage="*" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="UserName" CssClass="text-danger"
                    ErrorMessage="Incorrect Email-ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="*" />
                
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="*" />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Passwords doesn't Match" />
                <br />
            </div>
        </div>
       <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">Weight</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="WeightText" CssClass="form-control"  />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="WeightText"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="*" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="WeightText" CssClass="text-danger"
                    ErrorMessage="Weight>=50kg" ValidationExpression="^([5-9]\d|[1-9]\d{2,})$" />
            </div>
        </div>
       <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">Date Of Birth</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="DOBText" CssClass="form-control" TextMode="Date" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="DOBText"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="*" />
                <asp:RangeValidator runat="server" CssClass="text-danger" 
                   ControlToValidate="DOBText" ErrorMessage="Age>=17" 
                    MaximumValue="1/1/2001" MinimumValue="01/01/1960" SetFocusOnError="False" Type="Date" />
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
       <div class="col-xs-4 pull-bottom">
       <div class="form-group">
           <p class="text-danger">
                <asp:Literal runat="server" ID="dsserror" />
            </p>
       </div>

        
       </div>
       <div class="col-xs-7 pull-bottom">
       <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-success" />
                
            </div>
        </div>
           <br />
           <br />
           </div>
       <br />
        <br />
    </div>
</asp:Content>

