using System;

namespace PortfolioWebApp.Models
{
    public class Project
    {
        public int ProjectId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Technologies { get; set; }
        public string GitHubLink { get; set; }
        public string LiveLink { get; set; }
        public string ImagePath { get; set; }
        public DateTime CreatedDate { get; set; }
        public int CreatedBy { get; set; }
    }
}