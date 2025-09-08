<%@ Page Title="About" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="PortfolioWebApp.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="about-hero">
        <div class="container">
            <div class="about-content">
                <div class="about-text">
                    <h1>About Me</h1>
                    <p class="lead">Passionate Full-Stack .NET Developer with expertise in creating robust web applications</p>
                    <p>
                       I am a student of  computer science and enginerring in KUET , KHULNA . I studied here from 2023 to present.
                    </p>
                    <p>
                        My passion lies in creating efficient, scalable, and user-friendly applications that solve 
                        real-world problems. I enjoy working with both backend and frontend technologies, and I'm 
                        always eager to learn new tools and frameworks. I enjoy turning complex problems into delightful experiences.
                    </p>
                    
                    <div class="contact-info">
                        <h3>Get In Touch</h3>
                        <div class="contact-details">
                            <div class="contact-item">
                                <strong>Email:</strong> sayeem192058@gmail.com
                            </div>
                            <div class="contact-item">
                                <strong>Phone:</strong> 01531761618
                            </div>
                            <div class="contact-item">
                                <strong>Location:</strong> khulna, Bangladesh
                            </div>
                            <div class="contact-item">
                                <strong>Facebook:</strong> <a href="https://www.facebook.com/abujargefaree.sayeem" target="_blank">https://www.facebook.com/abujargefaree.sayeem</a>
                            </div>
                            <div class="contact-item">
                                <strong>GitHub:</strong> <a href="https://github.com/Sayeem33" target="_blank">https://github.com/Sayeem33</a>
                            </div>
                        </div>
                    </div>
                </div>
               <div class="about-image">
    <asp:Image ID="ProfileImage" runat="server" 
        ImageUrl="~/Images/sayeemprofile.jpg" 
        AlternateText="Abu Jar Gefaree Sayeem" 
        CssClass="profile-image" />
</div>

            </div>
        </div>
    </section>

    <section class="experience">
        <div class="container">
            <h2>Professional Experience</h2>
            <div class="timeline">
                <div class="timeline-item">
                    <div class="timeline-date">2022 - Present</div>
                    <div class="timeline-content">
                        <h3>Senior .NET Developer</h3>
                        <h4>Tech Company Inc.</h4>
                        <p>
                            Leading the development of enterprise web applications using ASP.NET Core, Entity Framework, 
                            and SQL Server. Mentoring junior developers and architecting scalable solutions.
                        </p>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-date">2020 - 2022</div>
                    <div class="timeline-content">
                        <h3>.NET Developer</h3>
                        <h4>Software Solutions Ltd.</h4>
                        <p>
                            Developed and maintained multiple client projects using ASP.NET Web Forms and MVC. 
                            Implemented RESTful APIs and integrated third-party services.
                        </p>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-date">2019 - 2020</div>
                    <div class="timeline-content">
                        <h3>Junior .NET Developer</h3>
                        <h4>StartUp Solutions</h4>
                        <p>
                            Started my career developing web applications using ASP.NET Web Forms. 
                            Gained experience in database design, stored procedures, and front-end development.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="education">
        <div class="container">
            <h2>Education & Certifications</h2>
            <div class="education-grid">
                <div class="education-item">
                    <h3>Bachelor of Science in Computer Science</h3>
                    <h4>University Name</h4>
                    <p class="year">2015 - 2019</p>
                    <p>Graduated with honors. Focused on software engineering, algorithms, and database systems.</p>
                </div>
                <div class="education-item">
                    <h3>Microsoft Certified: Azure Developer Associate</h3>
                    <h4>Microsoft</h4>
                    <p class="year">2023</p>
                    <p>Certified in developing and maintaining applications on Microsoft Azure platform.</p>
                </div>
            </div>
        </div>
    </section>
</asp:Content>