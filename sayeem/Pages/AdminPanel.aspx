<%@ Page Title="Admin Panel" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="PortfolioWebApp.AdminPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="page-header">
            <h1>Admin Panel</h1>
        </div>
        
        <div class="admin-dashboard">
            <div class="dashboard-stats">
                <div class="stat-card">
                    <h3>Total Projects</h3>
                    <div class="stat-number">
                        <asp:Literal ID="TotalProjectsLiteral" runat="server"></asp:Literal>
                    </div>
                </div>
                <div class="stat-card">
                    <h3>Total Users</h3>
                    <div class="stat-number">
                        <asp:Literal ID="TotalUsersLiteral" runat="server"></asp:Literal>
                    </div>
                </div>
                <div class="stat-card">
                    <h3>Recent Projects</h3>
                    <div class="stat-number">
                        <asp:Literal ID="RecentProjectsLiteral" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
            
            <div class="admin-actions">
                <h2>Quick Actions</h2>
                <div class="action-buttons">
                    <a href="AddProject.aspx" class="btn btn-primary">Add New Project</a>
                    <a href="Projects.aspx" class="btn btn-secondary">Manage Projects</a>
                </div>
            </div>
            
            <div class="recent-activity">
                <h2>Recent Projects</h2>
                <div class="activity-list">
                    <asp:Repeater ID="RecentProjectsRepeater" runat="server">
                        <ItemTemplate>
                            <div class="activity-item">
                                <div class="activity-content">
                                    <h4><%# Eval("Title") %></h4>
                                    <p>Created on <%# Eval("CreatedDate", "{0:MMM dd, yyyy}") %></p>
                                </div>
                                <div class="activity-actions">
                                    <a href='EditProject.aspx?id=<%# Eval("ProjectId") %>' class="btn btn-sm btn-secondary">Edit</a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>