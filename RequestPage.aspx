<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RequestPage.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">



      <div class="container" style="margin-top:2cm;">
    <div class="row">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-body" style="box-shadow:0 0 10px black;">
                        <div class="text-center">
                        <div class="modal-header">
                            <h3>Request Blood <span class="extra-title muted"></span></h3>
                        </div>
                        <div class="modal-body form-horizontal">

 <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtname" CssClass="col-md-2 control-label">Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtname" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtname"
                    CssClass="text-danger" ErrorMessage="*" />
                 </div>
        </div>
     <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                    CssClass="text-danger" ErrorMessage="*" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="UserName" CssClass="text-danger"
                    ErrorMessage="Incorrect Email-ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
            </div>
        </div>

                 <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">Phone</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="PhoneText" CssClass="form-control" TextMode="Phone"  MaxLength="10" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="PhoneText"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="*" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="PhoneText" CssClass="text-danger"
                    ErrorMessage="10 digit number only" ValidationExpression="^[7-9]{1}\d{9}$" />
            </div>
        </div>     
                        </div>
                        <div class="modal-footer" style="margin-top:1cm">
                            <asp:Button class="btn btn-success" id="sendRequest" CausesValidation="true" runat="server" Text="Send Request" OnClick="sendRequest_Click" />
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

</asp:Content>

