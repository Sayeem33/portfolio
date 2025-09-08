<%@ Page Title="Login" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PortfolioWebApp.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="auth-container">
        <div class="auth-form">
            <h2>Login</h2>
            <asp:Panel ID="ErrorPanel" runat="server" Visible="false" CssClass="error-message">
                <asp:Literal ID="ErrorLiteral" runat="server"></asp:Literal>
            </asp:Panel>
            
            <div class="form-group">
                <label for="<%= UsernameTextBox.ClientID %>">Username:</label>
                <asp:TextBox ID="UsernameTextBox" runat="server" CssClass="form-control" Required="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UsernameValidator" runat="server" 
                    ControlToValidate="UsernameTextBox" 
                    ErrorMessage="Username is required" 
                    CssClass="validator-error"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <label for="<%= PasswordTextBox.ClientID %>">Password:</label>
                <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" CssClass="form-control" Required="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" 
                    ControlToValidate="PasswordTextBox" 
                    ErrorMessage="Password is required" 
                    CssClass="validator-error"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group checkbox-group">
                <asp:CheckBox ID="RememberMeCheckBox" runat="server" />
                <label for="<%= RememberMeCheckBox.ClientID %>">Remember Me</label>
            </div>
            
            <div class="form-group">
                <asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" CssClass="btn btn-primary btn-full" />
            </div>
            
            <div class="auth-links">
                <p>Don't have an account? <a href="Register.aspx">Register here</a></p>
            </div>
        </div>
    </div>
</asp:Content>