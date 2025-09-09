<%@ Page Title="About" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="PortfolioWebApp.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Reset and base styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
        }

        /* Hero Section */
        .about-hero {
            background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
            color: white;
            padding: 80px 0;
            min-height: 600px;
            display: flex;
            align-items: center;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .about-content {
            display: grid;
            grid-template-columns: 1.5fr 1fr;
            gap: 50px;
            align-items: center;
        }

        .about-text h1 {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 20px;
            color: #ecf0f1;
        }

        .lead {
            font-size: 1.3rem;
            font-weight: 400;
            margin-bottom: 25px;
            color: #bdc3c7;
            line-height: 1.6;
        }

        .about-text p {
            font-size: 1.1rem;
            line-height: 1.7;
            margin-bottom: 20px;
            color: #ecf0f1;
        }

        /* Contact Info Section */
        .contact-info {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 30px;
            margin-top: 30px;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .contact-info h3 {
            font-size: 1.6rem;
            margin-bottom: 20px;
            color: #3498db;
            text-align: center;
        }

        .contact-details {
            display: grid;
            gap: 12px;
        }

        .contact-item {
            display: flex;
            align-items: center;
            padding: 10px 15px;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 8px;
            transition: background 0.3s ease;
        }

        .contact-item:hover {
            background: rgba(255, 255, 255, 0.15);
        }

        .contact-item strong {
            min-width: 90px;
            color: #3498db;
            font-weight: 600;
        }

        .contact-item a {
            color: #ecf0f1;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .contact-item a:hover {
            color: #3498db;
        }

        /* Profile Image */
        .about-image {
            display: flex;
            justify-content: center;
        }

        .profile-image {
            width: 280px;
            height: 280px;
            border-radius: 20px;
            object-fit: cover;
            border: 4px solid #3498db;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease;
        }

        .profile-image:hover {
            transform: translateY(-5px);
        }

        /* Experience Section */
        .experience {
            padding: 80px 0;
            background: #f8f9fa;
        }

        .experience h2 {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 50px;
            color: #2c3e50;
            font-weight: 700;
        }

        .experience h2::after {
            content: '';
            display: block;
            width: 60px;
            height: 4px;
            background: #3498db;
            margin: 15px auto 0;
            border-radius: 2px;
        }

        .timeline {
            max-width: 900px;
            margin: 0 auto;
        }

        .timeline-item {
            background: white;
            margin-bottom: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-left: 5px solid #3498db;
        }

        .timeline-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
        }

        .timeline-content {
            padding: 30px;
        }

        .timeline-date {
            font-weight: 600;
            color: #3498db;
            font-size: 1rem;
            margin-bottom: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .timeline-content h3 {
            color: #2c3e50;
            font-size: 1.5rem;
            margin-bottom: 8px;
            font-weight: 700;
        }

        .timeline-content h4 {
            color: #7f8c8d;
            font-size: 1.2rem;
            margin-bottom: 15px;
            font-weight: 500;
        }

        .timeline-content p {
            color: #555;
            line-height: 1.7;
            font-size: 1rem;
        }

        /* Education Section */
        .education {
            padding: 80px 0;
            background: white;
        }

        .education h2 {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 50px;
            color: #2c3e50;
            font-weight: 700;
        }

        .education h2::after {
            content: '';
            display: block;
            width: 60px;
            height: 4px;
            background: #3498db;
            margin: 15px auto 0;
            border-radius: 2px;
        }

        .education-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 30px;
            max-width: 1000px;
            margin: 0 auto;
        }

        .education-item {
            background: white;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-top: 4px solid #3498db;
        }

        .education-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
        }

        .education-item h3 {
            font-size: 1.4rem;
            margin-bottom: 10px;
            color: #2c3e50;
            font-weight: 700;
        }

        .education-item h4 {
            font-size: 1.1rem;
            margin-bottom: 15px;
            color: #7f8c8d;
            font-weight: 500;
        }

        .year {
            font-weight: 600;
            color: #3498db !important;
            margin-bottom: 15px !important;
            font-size: 1rem;
        }

        .education-item p:not(.year) {
            line-height: 1.6;
            color: #555;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .about-content {
                grid-template-columns: 1fr;
                gap: 40px;
                text-align: center;
            }

            .about-text h1 {
                font-size: 2.2rem;
            }

            .lead {
                font-size: 1.1rem;
            }

            .profile-image {
                width: 220px;
                height: 220px;
            }

            .education-grid {
                grid-template-columns: 1fr;
            }

            .education h2, .experience h2 {
                font-size: 2rem;
            }

            .container {
                padding: 0 15px;
            }

            .about-hero {
                padding: 50px 0;
                min-height: auto;
            }

            .timeline-content {
                padding: 25px;
            }

            .education-item {
                padding: 25px;
            }
        }

        @media (max-width: 480px) {
            .about-text h1 {
                font-size: 1.8rem;
            }

            .lead {
                font-size: 1rem;
            }

            .profile-image {
                width: 96px;
                height: 96px;
            }

            .contact-info {
                padding: 20px;
            }

            .timeline-content {
                padding: 20px;
            }

            .education-item {
                padding: 20px;
            }

            .education-grid {
                grid-template-columns: 1fr;
                gap: 20px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="about-hero">
        <div class="container">
            <div class="about-content">
                <div class="about-text">
                    <h1>About Me</h1>
                    <p class="lead">Passionate Full-Stack .NET Developer with expertise in creating robust web applications</p>
                    <p>
                       I am a student of computer science and engineering in KUET, Khulna. I studied here from 2023 to present.
                    </p>
                    <p>
                        My passion lies in creating efficient, scalable, and user-friendly applications that solve real-world problems. I enjoy working with both backend and frontend technologies, and I'm always eager to learn new tools and frameworks. I enjoy turning complex problems into delightful experiences.
                    </p>
                    
                    <div class="contact-info">
                        <h3>Get In Touch</h3>
                        <div class="contact-details">
                            <div class="contact-item"><strong>Email:</strong> sayeem192058@gmail.com</div>
                            <div class="contact-item"><strong>Phone:</strong> 01531761618</div>
                            <div class="contact-item"><strong>Location:</strong> Khulna, Bangladesh</div>
                            <div class="contact-item"><strong>Facebook:</strong> <a href="https://www.facebook.com/abujargefaree.sayeem" target="_blank">https://www.facebook.com/abujargefaree.sayeem</a></div>
                            <div class="contact-item"><strong>GitHub:</strong> <a href="https://github.com/Sayeem33" target="_blank">https://github.com/Sayeem33</a></div>
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
                    <div class="timeline-content">
                        <div class="timeline-date">2022 - Present</div>
                        <h3>Senior .NET Developer</h3>
                        <h4>Tech Company Inc.</h4>
                        <p>Leading the development of enterprise web applications using ASP.NET Core, Entity Framework, and SQL Server. Mentoring junior developers and architecting scalable solutions.</p>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-content">
                        <div class="timeline-date">2020 - 2022</div>
                        <h3>.NET Developer</h3>
                        <h4>Software Solutions Ltd.</h4>
                        <p>Developed and maintained multiple client projects using ASP.NET Web Forms and MVC. Implemented RESTful APIs and integrated third-party services.</p>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-content">
                        <div class="timeline-date">2019 - 2020</div>
                        <h3>Junior .NET Developer</h3>
                        <h4>StartUp Solutions</h4>
                        <p>Started my career developing web applications using ASP.NET Web Forms. Gained experience in database design, stored procedures, and front-end development.</p>
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
                    <h4>Khulna University of Engineering and Technology</h4>
                    <p class="year">2023 - Present</p>
                    <p>study with proper leatning. Focused on software engineering, algorithms, and database systems.</p>
                </div>
                <div class="education-item">
                    <h3>Envobyte Certified: Azure Developer Associate</h3>
                    <h4>Envobyte</h4>
                    <p class="year">2023</p>
                    <p>Certified in developing and maintaining applications on Envobyte Azure platform.</p>
                </div>
            </div>
        </div>
    </section>
</asp:Content>