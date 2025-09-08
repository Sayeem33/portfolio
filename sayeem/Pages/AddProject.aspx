<%@ Page Title="Add Project" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="AddProject.aspx.cs" Inherits="PortfolioWebApp.AddProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="page-header">
            <h1>Add New Project</h1>
            <a href="Projects.aspx" class="btn btn-secondary">Back to Projects</a>
        </div>
        
        <div class="auth-form" style="max-width: 600px;">
            <asp:Panel ID="ErrorPanel" runat="server" Visible="false" CssClass="error-message">
                <asp:Literal ID="ErrorLiteral" runat="server"></asp:Literal>
            </asp:Panel>
            
            <div class="form-group">
                <label for="<%= TitleTextBox.ClientID %>">Project Title:</label>
                <asp:TextBox ID="TitleTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="TitleValidator" runat="server" 
                    ControlToValidate="TitleTextBox" 
                    ErrorMessage="Project title is required" 
                    CssClass="validator-error"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <label for="<%= DescriptionTextBox.ClientID %>">Description:</label>
                <asp:TextBox ID="DescriptionTextBox" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="DescriptionValidator" runat="server" 
                    ControlToValidate="DescriptionTextBox" 
                    ErrorMessage="Description is required" 
                    CssClass="validator-error"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <label for="<%= TechnologiesTextBox.ClientID %>">Technologies Used:</label>
                <asp:TextBox ID="TechnologiesTextBox" runat="server" CssClass="form-control" placeholder="e.g., ASP.NET, C#, SQL Server"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="<%= GitHubLinkTextBox.ClientID %>">GitHub Link:</label>
                <asp:TextBox ID="GitHubLinkTextBox" runat="server" CssClass="form-control" placeholder="https://github.com/username/repository"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="<%= LiveLinkTextBox.ClientID %>">Live Demo Link:</label>
                <asp:TextBox ID="LiveLinkTextBox" runat="server" CssClass="form-control" placeholder="https://yourproject.com"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="<%= ImagePathTextBox.ClientID %>">Image Path:</label>
                <asp:TextBox ID="ImagePathTextBox" runat="server" CssClass="form-control" placeholder="~/Images/project.jpg"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <asp:Button ID="AddProjectButton" runat="server" Text="Add Project" OnClick="AddProjectButton_Click" CssClass="btn btn-primary btn-full" />
            </div>
        </div>
    </div>
</asp:Content>