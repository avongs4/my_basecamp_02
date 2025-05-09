# Welcome to My Basecamp 2***
A modern project collaboration platform built with Ruby on Rails, featuring secure authentication, project-based file attachments, threaded discussions, and role-based access control — all hosted in the cloud.

## Task
- Managing team-based collaboration in web applications is complex:
This involves:
  How do we handle user authentication securely?
  How can we allow file uploads without compromising performance or security?
  How do we structure discussions inside projects and control who can post?
  How do we create a clean, intuitive user experience with role-based permissions?

 - Our Challenge:
   We aimed to solve:
     Secure authentication and session handling
     Fine-grained role management (Admin vs Regular users)
     Clean dashboard navigation
     Safe file uploading and management
     Structured project discussions via threads and messages
     Easy admin controls over users

## Description
We extended the original MyBasecamp1 by adding full collaboration support using:
Which is how we solve it:
- Authentication & Role Management
   . Integrated Devise for login, registration, and password recovery
   . Defined two user roles:
       Admin – Full control (user management, deletions, admin panel access)
       Regular User – Project-level access only
   . Implemented before_action filters to enforce role-based restrictions

- Project Features
   Projects – Users can create and manage their own projects
   Attachments – All project members can upload .jpg, .png, .pdf, .txt, etc., via Active Storage
   Threads – Only project admins can create threads for structured discussions
   Messages – All project members can post inside threads

- UI & UX Enhancements
   Used Bootstrap for clean styling and responsiveness
   Added flash messages for feedback
   Streamlined dashboard and navigation experience

## Installation
- Ensure the following are installed:
   Ruby (≥ 3.0), Rails (≥ 7.0), PostgreSQL, Node.js, Yarn

- Install Yarn if needed:
  . On the your terminal - Run:
     npm install -g yarn

Setup Instructions
# Clone the repository
git clone https://github.com/yourusername/mybasecamp2.git
cd mybasecamp2

# Install backend and frontend dependencies
bundle install
yarn install

# Setup the database
rails db:create
rails db:migrate
rails db:seed  # Creates the first admin user
# NOTE
 If running locally, update config/database.yml with your local PostgreSQL settings.

▶️ Run the Application
rails server
Visit http://localhost:3000 in your browser.



## Usage
Authentication
Built with Devise

Supports registration, login, logout, and password reset
Use --------------- as the default admin: 
Default admin created during seeding:
email: nnooaahh24@gmail.com
password: 123456

# Role-Based Permissions
- Admin Users:
   Full access to user management (delete, promote/demote)
   View the admin panel
- Regular Users:
   Can create, edit, and delete their own projects
   Can upload files, participate in threads

- Project Admins:
   Are the creators/owners of a project
   Can manage threads

 Navigation Overview
   Home Page: Public landing page with login/signup options
   User Dashboard: Personalized for each user; manage projects and profile
   Admin Panel: Only accessible by admins; manage users

- Project View:
   Upload attachments
   Start/join discussions (thread/message)

- Logout: Ends session and redirects to homepage

- Deployment
This project is deployed on Render.
- Live App: https://my-basecamp-02.onrender.com

- Built With
   Ruby on Rails – Web application framework
   PostgreSQL – Relational database
   Devise – Authentication
   Active Storage – File uploads
   Bootstrap – Styling
   Render – Hosting platform



### The Core Team
AVONG HARUNA


<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px' /></span>
