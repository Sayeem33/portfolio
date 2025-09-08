<%@ Page Title="Home" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PortfolioWebApp.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <h1>Welcome to My Portfolio</h1>
            <p class="hero-subtitle">Full-Stack .NET Developer</p>
            <p class="hero-description">
                I create innovative web applications using modern technologies like ASP.NET, C#, SQL Server, and JavaScript.
                Passionate about clean code and user experience.
            </p>
            <div class="hero-buttons">
                <a href="Projects.aspx" class="btn btn-primary">View My Work</a>
                <a href="About.aspx" class="btn btn-secondary">About Me</a>
            </div>
        </div>
    </section>

    <!-- Featured Projects Section -->
    <section class="featured-projects">
        <div class="container">
            <h2>Featured Projects</h2>
            <div class="projects-grid">
                <asp:Repeater ID="FeaturedProjectsRepeater" runat="server">
                    <ItemTemplate>
                        <div class="project-card">
                           
                            <div class="project-info">
                                <h3><%# Eval("Title") %></h3>
                                <p><%# Eval("Description") %></p>
                                <div class="technologies">
                                    <span class="tech-label">Technologies:</span>
                                    <span class="tech-list"><%# Eval("Technologies") %></span>
                                </div>
                                <div class="project-links">
                                    <a href='<%# Eval("GitHubLink") %>' target="_blank" class="btn btn-outline">GitHub</a>
                                    <a href='<%# Eval("LiveLink") %>' target="_blank" class="btn btn-outline">Live Demo</a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="view-all">
                <a href="Projects.aspx" class="btn btn-primary">View All Projects</a>
            </div>
        </div>
    </section>

    <!-- Skills Section -->
    <section class="skills">
        <div class="container">
            <h2>Technical Skills</h2>
            <div class="skills-grid">
                <div class="skill-category">
                    <h3>Backend</h3>
                    <ul>
                        <li>ASP.NET Web Forms</li>
                        <li>ASP.NET MVC</li>
                        <li>C#</li>
                        <li>SQL Server</li>
                        <li>Entity Framework</li>
                    </ul>
                </div>
                <div class="skill-category">
                    <h3>Frontend</h3>
                    <ul>
                        <li>HTML5</li>
                        <li>CSS3</li>
                        <li>JavaScript</li>
                        <li>jQuery</li>
                        <li>Bootstrap</li>
                    </ul>
                </div>
                <div class="skill-category">
                    <h3>Tools & Others</h3>
                    <ul>
                        <li>Visual Studio</li>
                        <li>Git</li>
                        <li>SSMS</li>
                        <li>IIS</li>
                        <li>Azure</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
</asp:Content>