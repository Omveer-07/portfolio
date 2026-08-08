import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../models/contact_model.dart';
import '../models/experience_model.dart';

class PortfolioData {
  // About Section

  static const String aboutTitle = "About Me";

  static const String about =
      "Hi, I'm Omveer Singh, a Computer Science and Engineering student at ICFAI University, Jaipur with a strong interest in software development and problem-solving.\n\n"
      "I enjoy transforming ideas into practical applications through hands-on projects. My experience includes building mobile and web applications using Flutter, Dart, Firebase, ASP.NET Core MVC, C#, MySQL, Java, Python, and GitHub. I've also explored machine learning by developing a project using the Random Forest algorithm, where I gained experience in predictive modeling and data analysis.\n\n"
      "I believe the best way to learn is by building real-world projects. Every project helps me improve my technical skills, write better code, and understand software development from both the frontend and backend perspectives.\n\n"
      "I'm currently focused on strengthening my development skills and problem-solving ability while working toward becoming a software engineer who builds reliable, scalable, and user-friendly applications.";

  // Skills section

  static const String skillsTitle = "Skills";

  static const String skillsSubtitle =
      "Technologies and tools I use to build responsive mobile and web applications.";

  static const Map<String, List<String>> skills = {
    "Languages": ["Java", "C#", "Python", "Dart"],

    "Frameworks": ["Flutter", "ASP.NET Core"],

    "Databases": ["MySQL", "Firebase"],

    "Tools": ["Git", "GitHub", "VS Code", "Visual Studio"],
  };

  // Education section
  static const String educationTitle = "Education";

  static const String educationSubtitle =
      "My academic background and current studies.";

  static const String degree = "Bachelor of Technology (B.Tech)";

  static const String branch = "Computer Science & Engineering";

  static const String university = "ICFAI University, Jaipur";

  static const String duration = "2023 - 2027";

  static const String status = "Currently Pursuing";

  // Projects section

  static const String projectsTitle = "Projects";

  static const List<Map<String, dynamic>> projects = [
    {
      "title": "Timetable Scheduler",
      "description":
          "A timetable scheduling application for managing academic schedules, faculty, subjects, rooms, and timetable configurations.",
      "technologies": ["Flutter", "Dart", "Firebase", "Firestore"],
      "image": "",
    },
    {
      "title": "Task Management System",
      "description":
          "A web-based task management system for organizing projects, tasks, departments, and users.",
      "technologies": ["ASP.NET Core MVC", "C#", "MySQL", "EF Core"],
      "image": "",
    },
    {
      "title": "Stock Trend Prediction",
      "description":
          "An interactive Streamlit application that visualizes stock trends and predicts future movements using an LSTM model.",
      "technologies": ["Python", "Streamlit", "TensorFlow", "LSTM"],
      "image": "",
    },
  ];

  // Contact section

  static const String contactTitle = "Get In Touch";

  static const String contactSubtitle =
      "I'm always open to discussing opportunities, collaborations, or interesting projects.";

  static const List<ContactModel> contacts = [
    ContactModel(
      title: "GitHub",
      value: "github.com/omveer-07",
      icon: Icons.code,
      url: "https://github.com/omveer-07",
    ),

    ContactModel(
      title: "LinkedIn",
      value: "linkedin.com/in/your-link",
      icon: Icons.work,
      url: "https://linkedin.com/in/your-link",
    ),

    ContactModel(
      title: "Email",
      value: "yourmail@gmail.com",
      icon: Icons.email_outlined,
      url: "mailto:yourmail@gmail.com",
    ),

    ContactModel(
      title: "WhatsApp",
      value: "+91XXXXXXXXXX",
      icon: Icons.phone,
      url: "https://wa.me/91XXXXXXXXXX",
    ),
  ];

  // Experience section

  static const String experienceTitle = "Experience";

  static const String experienceSubtitle = "My internship experience";

  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      date: "May 2025 – July 2025",
      role: "Web Developer Intern",
      company: "CLR Infotech",
      description:
          "Worked on web application development using ASP.NET Core, contributing to backend functionality and application features. Gained hands-on experience in .NET Core development, understanding application structure, implementing functionality, debugging issues, and working with real-world development requirements.",
    ),
    ExperienceModel(
      date: "May 2025 – Nov 2025",
      role: "Web Development Trainee",
      company: "Simtrak Solutions",
      description:
          "Worked with HTML, CSS, and JavaScript to develop and improve web interfaces. Collaborated with team members on assigned tasks, participated in discussions and reviews, and gained practical experience in frontend development, problem-solving, and working in a team-based development environment.",
    ),
  ];
}
