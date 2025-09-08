<%@ Page Title="Register" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PortfolioWebApp.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="auth-container">
        <div class="auth-form">
            <h2>Create Account</h2>
            <asp:Panel ID="ErrorPanel" runat="server" Visible="false" CssClass="error-message">
                <asp:Literal ID="ErrorLiteral" runat="server"></asp:Literal>
            </asp:Panel>
            
            <div class="form-group">
                <label for="<%= FullNameTextBox.ClientID %>">Full Name:</label>
                <asp:TextBox ID="FullNameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="FullNameValidator" runat="server" 
                    ControlToValidate="FullNameTextBox" 
                    ErrorMessage="Full name is required" 
                    CssClass="validator-error"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <label for="<%= UsernameTextBox.ClientID %>">Username:</label>
                <asp:TextBox ID="UsernameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UsernameValidator" runat="server" 
                    ControlToValidate="UsernameTextBox" 
                    ErrorMessage="Username is required" 
                    CssClass="validator-error"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <label for="<%= EmailTextBox.ClientID %>">Email:</label>
                <asp:TextBox ID="EmailTextBox" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailValidator" runat="server" 
                    ControlToValidate="EmailTextBox" 
                    ErrorMessage="Email is required" 
                    CssClass="validator-error"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="EmailFormatValidator" runat="server"
                    ControlToValidate="EmailTextBox"
                    ErrorMessage="Please enter a valid email address"
                    ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w+$"
                    CssClass="validator-error"
                    Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            
            <div class="form-group">
                <label for="<%= PasswordTextBox.ClientID %>">Password:</label>
                <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" 
                    ControlToValidate="PasswordTextBox" 
                    ErrorMessage="Password is required" 
                    CssClass="validator-error"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <label for="<%= ConfirmPasswordTextBox.ClientID %>">Confirm Password:</label>
                <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:CompareValidator ID="PasswordCompareValidator" runat="server"
                    ControlToValidate="ConfirmPasswordTextBox"
                    ControlToCompare="PasswordTextBox"
                    ErrorMessage="Passwords do not match"
                    CssClass="validator-error"
                    Display="Dynamic"></asp:CompareValidator>
            </div>
            
            <div class="form-group">
                <asp:Button ID="RegisterButton" runat="server" Text="Register" OnClick="RegisterButton_Click" CssClass="btn btn-primary btn-full" />
            </div>
            
            <div class="auth-links">
                <p>Already have an account? <a href="Login.aspx">Login here</a></p>
            </div>
        </div>
    </div>
</asp:Content>