<%@ Page Title="change Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ChnPassword.aspx.cs" Inherits="ChnPassword" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin-top:2cm;">
    <div class="row">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-body" style="box-shadow:0 0 10px black;">
                        <div class="text-center">
                        <div class="modal-header">
                            <h3>Change Password <span class="extra-title muted"></span></h3>
                        </div>
                        <div class="modal-body form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Current Password</label>
                                <div class="controls">
                                    <asp:TextBox ID="curr_pass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="curr_pass"
                    CssClass="text-danger" ErrorMessage="Please Enter Current password" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="new_password" class="control-label">New Password</label>
                                <div class="controls">
                                    <asp:TextBox ID="new_pass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="new_pass"
                    CssClass="text-danger" ErrorMessage="Please Enter New password"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Confirm Password</label>
                                <div class="controls">
                                    <asp:TextBox ID="conf_pass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="conf_pass"
                    CssClass="text-danger" ErrorMessage="Please Enter Confirm password" />
                                    <asp:CompareValidator runat="server" ControlToCompare="new_pass" ControlToValidate="conf_pass"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Passwords doesn't Match" />
                                </div>
                            </div>      
                        </div>
                        <div class="modal-footer" style="margin-top:1cm">
                            <button class="btn" data-dismiss="modal" causesvalidation="false" aria-hidden="true" type="reset">Clear</button>
                            <button class="btn btn-success" id="password_modal_save" causesvalidation="true" type="submit" runat="server" onserverclick="btnSaveClick">Save changes</button>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>
