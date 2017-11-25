<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OpenAuthProviders.ascx.cs" Inherits="OpenAuthProviders" %>

<div id="socialLoginList">
    <h4>Do NOT donate blood</h4>
    <hr />
    <asp:ListView runat="server" ID="providerDetails" ItemType="System.String"
        SelectMethod="GetProviderNames" ViewStateMode="Disabled">
        <ItemTemplate>
            <p>
                <button type="submit" class="btn btn-default" name="provider" value="<%#: Item %>"
                    title="Log in using your <%#: Item %> account.">
                    <%#: Item %>
                </button>
            </p>
        </ItemTemplate>
        <EmptyDataTemplate>
            <div>
                <p>-You are 17 or above years of age.<br />
- 	Your weight is 50 kgs or more.<br />
- 	Your hemoglobin is 12.5 gm% minimum.<br />
- 	Your last blood donation must be 3 or more months earlier.<br />
- 	You are healthy and have not suffered from malaria, typhoid or other transmissible disease in the recent past.<br />
</p>
            </div>
        </EmptyDataTemplate>
    </asp:ListView>
</div>