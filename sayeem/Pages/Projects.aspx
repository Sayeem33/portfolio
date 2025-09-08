<%@ Page Title="Projects" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="PortfolioWebApp.Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="mb-4">My Projects</h2>

    <!-- Admin-only top panel -->
    <asp:Panel ID="AdminTopPanel" runat="server" Visible="false" CssClass="mb-3">
        <a href="AddProject.aspx" class="btn btn-primary">Add New Project</a>
    </asp:Panel>

    <!-- Projects Repeater -->
    <asp:Repeater ID="rptProjects" runat="server" OnItemCommand="rptProjects_ItemCommand">
        <ItemTemplate>
            <div class="card mb-4" style="width: 22rem; display: inline-block; margin-right: 20px;">
                <img src='<%# Eval("ImagePath") %>' class="card-img-top" alt='<%# Eval("Title") %>' />
                <div class="card-body">
                    <h5 class="card-title"><%# Eval("Title") %></h5>
                    <p class="card-text"><%# Eval("Description") %></p>
                    <p><strong>Technologies:</strong> <%# Eval("Technologies") %></p>

                    <asp:HyperLink ID="GitHubLink" runat="server"
                        NavigateUrl='<%# Eval("GitHubLink") %>'
                        CssClass="btn btn-outline-primary"
                        Text="GitHub" Target="_blank"
                        Visible='<%# Eval("GitHubLink") != DBNull.Value && !string.IsNullOrEmpty(Eval("GitHubLink").ToString()) %>'></asp:HyperLink>

                    <asp:HyperLink ID="LiveLink" runat="server"
                        NavigateUrl='<%# Eval("LiveLink") %>'
                        CssClass="btn btn-outline-primary"
                        Text="Live Demo" Target="_blank"
                        Visible='<%# Eval("LiveLink") != DBNull.Value && !string.IsNullOrEmpty(Eval("LiveLink").ToString()) %>'></asp:HyperLink>

                    <!-- Admin-only actions -->
                    <asp:Panel ID="AdminRepeaterPanel" runat="server" Visible='<%# IsUserAdmin() %>' CssClass="mt-2">
                        <asp:LinkButton ID="EditButton" runat="server"
                            CommandName="Edit"
                            CommandArgument='<%# Eval("ProjectId") %>'
                            CssClass="btn btn-sm btn-secondary">Edit</asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server"
                            CommandName="Delete"
                            CommandArgument='<%# Eval("ProjectId") %>'
                            CssClass="btn btn-sm btn-danger"
                            OnClientClick="return confirm('Are you sure you want to delete this project?');">Delete</asp:LinkButton>
                    </asp:Panel>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <!-- No projects message -->
    <asp:Panel ID="NoProjectsPanel" runat="server" Visible="false" CssClass="alert alert-info mt-3">
        No projects found.
    </asp:Panel>
</asp:Content>
