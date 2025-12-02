# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SoftwarePortfolioGenerator.Repo.insert!(%SoftwarePortfolioGenerator.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias SoftwarePortfolioGenerator.Repo
alias SoftwarePortfolioGenerator.Language
alias SoftwarePortfolioGenerator.Technology
alias SoftwarePortfolioGenerator.TechnologyCategory
alias SoftwarePortfolioGenerator.Profile
alias SoftwarePortfolioGenerator.ProfileJob
alias SoftwarePortfolioGenerator.ProfileLanguage
alias SoftwarePortfolioGenerator.ProfileTechnology
alias SoftwarePortfolioGenerator.Project
alias SoftwarePortfolioGenerator.ProjectTechnology
alias SoftwarePortfolioGenerator.SocialNetwork
alias SoftwarePortfolioGenerator.Certification

# Profiles
Repo.insert!(%Profile{firstname: "Karol Liseth", lastname: "Rojas Bermudez", title: "Software Engineer - Senior Backend Developer", birthdate: ~D[2000-01-20] , email: "karol.rojasb@gmail.com", city: "Manizales", state: "Caldas", country: "Colombia", zipcode: "17002", phone_number: "+57 3155860681"})

# Languages
Repo.insert!(%Language{name: "English"})
Repo.insert!(%Language{name: "Spanish"})

# Profile Languages
Repo.insert!(%ProfileLanguage{profile_id: 1, language_id: 1})
Repo.insert!(%ProfileLanguage{profile_id: 1, language_id: 2})

# Certifications
Repo.insert!(%Certification{issuer: "Universidad Autonoma de Manizales", name: "Graduate Electronic Engineering", description: "", link: "", end_date: ~D[2022-12-12]})
Repo.insert!(%Certification{issuer: "Universidad Autonoma de Manizales", name: "Graduate System Engineering", description: "", link: "", end_date: ~D[2022-12-12]})
Repo.insert!(%Certification{issuer: "Udemy", name: "Angular & NodeJS - The MEAN Stack Guide ", description: "", link: "https://www.udemy.com/certificate/UC-9e2bba4c-35ac-4eb5-a0e5-10a426b9c6c1/", end_date: ~D[2021-12-14]})
Repo.insert!(%Certification{issuer: "Udemy", name: "PostgreSQL complete course. Learn from zero", description: "", link: "https://www.udemy.com/certificate/UC-50510695-74df-44c7-b4e8-effed63dca6c/", end_date: ~D[2025-01-01]})
Repo.insert!(%Certification{issuer: "Udemy", name: "JavaScript: Understanding the Weird Parts ", description: "", link: "https://www.udemy.com/certificate/UC-2bba988a-c799-4e29-9124-2b880ea6c2c2/", end_date: ~D[2024-01-19]})
Repo.insert!(%Certification{issuer: "Udemy", name: "Build ASP.NET Core Web API - Scratch To Finish", description: "", link: "https://www.udemy.com/certificate/UC-1504d9c5-6f02-4109-924f-1c7b722f1cae/", end_date: ~D[2024-01-13]})
Repo.insert!(%Certification{issuer: "Udemy", name: "API and Web Service Introduction", description: "", link: "https://www.udemy.com/certificate/UC-feba173e-7bec-4777-94cb-b44a60d030f4/", end_date: ~D[2024-01-04]})
Repo.insert!(%Certification{issuer: "Udemy", name: "REST API vs GraphQL vs gRPC - The Complete Guide", description: "", link: "https://www.udemy.com/certificate/UC-31c3b34b-1244-4157-af55-860c209c0a81/?utm_campaign=email&utm_medium=email&utm_source=sendgrid.com", end_date: ~D[2025-11-30]})
Repo.insert!(%Certification{issuer: "Udemy", name: "C# Intermediate: Classes, Interfaces and OOP", description: "", link: "", end_date: ~D[2025-01-01]})
Repo.insert!(%Certification{issuer: "Udemy", name: "Stellar Blockchain Tutorial - Complete Beginner Training", description: "", link: "https://www.udemy.com/certificate/UC-8d523be0-7fec-489f-8a25-d0ccfcb05197/", end_date: ~D[2023-02-12]})
Repo.insert!(%Certification{issuer: "DeepLearningAI", name: "Multi AI Agent systems with CrewAI", description: "", link: "", end_date: ~D[2025-07-10]})
Repo.insert!(%Certification{issuer: "DeepLearningAI", name: "Practical Multi AI agents and advanced use cases with CrewAI", description: "", link: "", end_date: ~D[2025-08-04]})

# Technology Categories
Repo.insert!(%TechnologyCategory{name: "Databases"}) # 1
Repo.insert!(%TechnologyCategory{name: "Backend"}) # 2
Repo.insert!(%TechnologyCategory{name: "Frontend"}) # 3
Repo.insert!(%TechnologyCategory{name: "DevOps"}) # 4
Repo.insert!(%TechnologyCategory{name: "AI"}) # 5
Repo.insert!(%TechnologyCategory{name: "Development Tools"}) # 6
Repo.insert!(%TechnologyCategory{name: "Integrations"}) # 7

# Technologies
# Get the Technologies Icons from Devicon
Repo.insert!(%Technology{name: "PostgreSQL", category_id: 1, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/postgresql/postgresql-plain-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 1, mastery: 5.0})
Repo.insert!(%Technology{name: "MySQL", category_id: 1, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/mysql/mysql-plain-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 2, mastery: 4.5})
Repo.insert!(%Technology{name: "SQLite", category_id: 1, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/sqlite/sqlite-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 3, mastery: 4.0})
Repo.insert!(%Technology{name: "MongoDB", category_id: 1, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/mongodb/mongodb-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 4, mastery: 4.5})
Repo.insert!(%Technology{name: "Redis", category_id: 1, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/redis/redis-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 5, mastery: 5.0})
Repo.insert!(%Technology{name: "Firebase", category_id: 1, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/firebase/firebase-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 6, mastery: 4.0})
Repo.insert!(%Technology{name: "Javascript", category_id: 2, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/javascript/javascript-original.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 7, mastery: 4.5})
Repo.insert!(%Technology{name: "Typescript", category_id: 2, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/typescript/typescript-original.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 8, mastery: 4.5})
Repo.insert!(%Technology{name: "Python", category_id: 2, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/python/python-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 9, mastery: 4.0})
Repo.insert!(%Technology{name: "Ruby", category_id: 2, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/ruby/ruby-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 10, mastery: 4.5})
Repo.insert!(%Technology{name: "Ruby On Rails", category_id: 2, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/rails/rails-plain-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 11, mastery: 4.0})
Repo.insert!(%Technology{name: "C#", category_id: 2, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/csharp/csharp-original.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 12, mastery: 4.5})
Repo.insert!(%Technology{name: ".NET", category_id: 2, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/dotnetcore/dotnetcore-original.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 13, mastery: 4.0})
Repo.insert!(%Technology{name: "Express.js", category_id: 2, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/express/express-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 14, mastery: 4.5})
Repo.insert!(%Technology{name: "Rust", category_id: 2, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/rust/rust-original.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 15, mastery: 1.5})
Repo.insert!(%Technology{name: "Elixir", category_id: 2, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/elixir/elixir-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 16, mastery: 4.5})
Repo.insert!(%Technology{name: "Phoenix", category_id: 2, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/phoenix/phoenix-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 17, mastery: 4.5})
Repo.insert!(%Technology{name: "React", category_id: 3, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/react/react-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 18, mastery: 4.0})
Repo.insert!(%Technology{name: "Next.js", category_id: 3, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/nextjs/nextjs-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 19, mastery: 4.5})
Repo.insert!(%Technology{name: "Three JS", category_id: 3, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/threejs/threejs-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 20, mastery: 3.5})
Repo.insert!(%Technology{name: "Figma", category_id: 3, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/figma/figma-original.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 21, mastery: 5.0})
Repo.insert!(%Technology{name: "Tailwind CSS", category_id: 3, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/tailwindcss/tailwindcss-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 22, mastery: 5.0})
Repo.insert!(%Technology{name: "Bootstrap", category_id: 3, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/bootstrap/bootstrap-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 23, mastery: 5.0})
Repo.insert!(%Technology{name: "AWS", category_id: 4, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 24, mastery: 4.0})
Repo.insert!(%Technology{name: "Azure", category_id: 4, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/azure/azure-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 25, mastery: 4.0})
Repo.insert!(%Technology{name: "GCP", category_id: 4, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/googlecloud/googlecloud-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 26, mastery: 4.0})
Repo.insert!(%Technology{name: "Docker", category_id: 4, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/docker/docker-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 27, mastery: 3.5})
Repo.insert!(%Technology{name: "Heroku", category_id: 4, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/heroku/heroku-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 28, mastery: 4.0})
Repo.insert!(%Technology{name: "Vercel", category_id: 4, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/vercel/vercel-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 29, mastery: 5.0})
Repo.insert!(%Technology{name: "IPFS", category_id: 4, icon_link: "https://upload.wikimedia.org/wikipedia/commons/9/9f/IPFS_logo.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 30, mastery: 4.0})
Repo.insert!(%Technology{name: "CrewAI", category_id: 5, icon_link: "https://www.cloudera.com/content/dam/www/marketing/images/logos/partner-solutions/crewai.png"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 31, mastery: 4.5})
Repo.insert!(%Technology{name: "Git", category_id: 6, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/git/git-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 32, mastery: 5.0})
Repo.insert!(%Technology{name: "GitHub", category_id: 6, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/github/github-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 33, mastery: 5.0})
Repo.insert!(%Technology{name: "GitLab", category_id: 6, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/gitlab/gitlab-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 34, mastery: 5.0})
Repo.insert!(%Technology{name: "Postman", category_id: 6, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/postman/postman-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 35, mastery: 5.0})
Repo.insert!(%Technology{name: "Visual Studio Code", category_id: 6, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/vscode/vscode-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 36, mastery: 5.0})
Repo.insert!(%Technology{name: "Cursor", category_id: 6, icon_link: "https://images.seeklogo.com/logo-png/61/1/cursor-logo-png_seeklogo-611587.png"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 37, mastery: 5.0})
Repo.insert!(%Technology{name: "Linux", category_id: 6, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/linux/linux-original.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 38, mastery: 4.0})
Repo.insert!(%Technology{name: "Windows", category_id: 6, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/windows11/windows11-original.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 39, mastery: 4.0})
Repo.insert!(%Technology{name: "macOS", category_id: 6, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/apple/apple-original.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 40, mastery: 4.0})
Repo.insert!(%Technology{name: "Windows Subsystem for Linux", category_id: 6, icon_link: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Logo_WSL_Square44x44Logo.altform-lightunplated_targetsize-256.svg/1544px-Logo_WSL_Square44x44Logo.altform-lightunplated_targetsize-256.svg.png"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 41, mastery: 4.0})
Repo.insert!(%Technology{name: "Stripe", category_id: 7, icon_link: "https://www.svgrepo.com/show/331592/stripe-v2.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 42, mastery: 4.5})
Repo.insert!(%Technology{name: "NodeJS", category_id: 2, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/nodejs/nodejs-original-wordmark.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 43, mastery: 4.5})
Repo.insert!(%Technology{name: "Angular", category_id: 3, icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/angularjs/angularjs-original.svg"})
Repo.insert!(%ProfileTechnology{profile_id: 1, technology_id: 44, mastery: 4.0})


# Social Networks
Repo.insert!(%SocialNetwork{label: "LinkedIn", link: "https://www.linkedin.com/in/karolrojas07/", icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/linkedin/linkedin-original.svg"})
Repo.insert!(%SocialNetwork{label: "GitHub", link: "https://github.com/karolrojas07/", icon_link: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/github/github-original.svg"})

# Profile Jobs

Repo.insert!(%ProfileJob{company_name: "Asplabel", link: "https://www.asplabel.com", description: "Banana peeling plant that supports independent women and heads of household", start_date: ~D[2021-08-01], end_date: ~D[2021-12-20]})
Repo.insert!(%Project{profile_job_id: 1, name: "DEVELOPMENT OF AN ACCESS CONTROL SYSTEM", link: "https://www.linkedin.com/posts/karolrojas07_electronica-desarrolloweb-sistemas-activity-6885365056779894784-8a24?utm_source=share&utm_medium=member_desktop&rcm=ACoAACynTXwBVAzoEBFHqgqQJ7NG9oXYzyW8c2A", description: "<ul><li>Assembled an access monitoring device using a micro-controller connected to WiFi and with RFID reader.</li><li>Built a web application for access control management using the MEAN stack (MongoDB, Express.js,Angular & NodeJS).</li></ul>"})
Repo.insert!(%ProjectTechnology{project_id: 1, technology_id: 43})
Repo.insert!(%ProjectTechnology{project_id: 1, technology_id: 44})
Repo.insert!(%ProjectTechnology{project_id: 1, technology_id: 14})
Repo.insert!(%ProjectTechnology{project_id: 1, technology_id: 4})
Repo.insert!(%ProjectTechnology{project_id: 1, technology_id: 28})
Repo.insert!(%ProjectTechnology{project_id: 1, technology_id: 36})
Repo.insert!(%ProjectTechnology{project_id: 1, technology_id: 39})
Repo.insert!(%ProjectTechnology{project_id: 1, technology_id: 32})
Repo.insert!(%ProjectTechnology{project_id: 1, technology_id: 33})

Repo.insert!(%ProfileJob{company_name: "kommit", link: "https://www.kommit.co", description: "Incubator for Latin American talent for outsourcing", start_date: ~D[2022-02-01], end_date: ~D[2023-11-01]})
Repo.insert!(%Project{profile_job_id: 2, name: "REAL ESTATE PLATFORM", link: "https://www.engelvoelkers.com/co/en", description: "<ul><li>Maintained a 9-year-old Ruby on Rails app.</li><li>Enhanced reliability with Rspec tests.</li><li>Verified improvements via Quality Assurance.</li></ul>"})
Repo.insert!(%ProjectTechnology{project_id: 2, technology_id: 32})
Repo.insert!(%ProjectTechnology{project_id: 2, technology_id: 33})
Repo.insert!(%ProjectTechnology{project_id: 2, technology_id: 36})
Repo.insert!(%ProjectTechnology{project_id: 2, technology_id: 38})
Repo.insert!(%ProjectTechnology{project_id: 2, technology_id: 10})
Repo.insert!(%ProjectTechnology{project_id: 2, technology_id: 11})
Repo.insert!(%ProjectTechnology{project_id: 2, technology_id: 1})
Repo.insert!(%ProjectTechnology{project_id: 2, technology_id: 5})
Repo.insert!(%ProjectTechnology{project_id: 2, technology_id: 23})
Repo.insert!(%ProjectTechnology{project_id: 2, technology_id: 28})

Repo.insert!(%Project{profile_job_id: 2, name: "STELLAR BLOKCHAIN", link: "https://chaincerts.co", description: "<ul><li>Developed a portal for the management of the platform using the MEAN stack (MongoDB, Express.js,Angular & NodeJS).</li></ul>"})
Repo.insert!(%ProjectTechnology{project_id: 3, technology_id: 32})
Repo.insert!(%ProjectTechnology{project_id: 3, technology_id: 33})
Repo.insert!(%ProjectTechnology{project_id: 3, technology_id: 7})
Repo.insert!(%ProjectTechnology{project_id: 3, technology_id: 8})
Repo.insert!(%ProjectTechnology{project_id: 3, technology_id: 18})
Repo.insert!(%ProjectTechnology{project_id: 3, technology_id: 20})
Repo.insert!(%ProjectTechnology{project_id: 3, technology_id: 22})
Repo.insert!(%ProjectTechnology{project_id: 3, technology_id: 24})
Repo.insert!(%ProjectTechnology{project_id: 3, technology_id: 36})
Repo.insert!(%ProjectTechnology{project_id: 3, technology_id: 30})
Repo.insert!(%ProjectTechnology{project_id: 3, technology_id: 38})


Repo.insert!(%Project{profile_job_id: 2, name: "BIO-ANALYTICAL PLATFORM", link: "", description: "<ul><li>Customized a Dockerized application.</li><li>Performed new features and tests for a Javascript project.</li></ul>"})
Repo.insert!(%ProjectTechnology{project_id: 4, technology_id: 32})
Repo.insert!(%ProjectTechnology{project_id: 4, technology_id: 34})
Repo.insert!(%ProjectTechnology{project_id: 4, technology_id: 2})
Repo.insert!(%ProjectTechnology{project_id: 4, technology_id: 27})
Repo.insert!(%ProjectTechnology{project_id: 4, technology_id: 36})


Repo.insert!(%Project{profile_job_id: 2, name: "PHOENIX APPLICATION", link: "", description: "<ul><li>Optimized Elixir/Phoenix web app's database schema, contexts, and controllers.</li><li>Remodeled the app’s design using Tailwind.</li><li>Defined tests to strengthen the application’s reliability.</li><li>Increased my functional programming paradigm skills.</li></ul>"})
Repo.insert!(%ProjectTechnology{project_id: 5, technology_id: 32})
Repo.insert!(%ProjectTechnology{project_id: 5, technology_id: 33})
Repo.insert!(%ProjectTechnology{project_id: 5, technology_id: 16})
Repo.insert!(%ProjectTechnology{project_id: 5, technology_id: 17})
Repo.insert!(%ProjectTechnology{project_id: 5, technology_id: 36})
Repo.insert!(%ProjectTechnology{project_id: 5, technology_id: 22})


Repo.insert!(%Project{profile_job_id: 2, name: "OPEN SOURCE PROJECTS CONTRIBUTIONS", link: "", description: ""})
Repo.insert!(%ProjectTechnology{project_id: 6, technology_id: 32})
Repo.insert!(%ProjectTechnology{project_id: 6, technology_id: 33})
Repo.insert!(%ProjectTechnology{project_id: 6, technology_id: 3})
Repo.insert!(%ProjectTechnology{project_id: 6, technology_id: 7})
Repo.insert!(%ProjectTechnology{project_id: 6, technology_id: 8})

Repo.insert!(%ProfileJob{company_name: "Salient Process", link: "https://www.businesscompass.com", description: "Global leader in customer experience management", start_date: ~D[2023-12-13], end_date: ~D[2025-12-31]})
Repo.insert!(%Project{profile_job_id: 3, name: "BUSINESS COMPASS", link: "https://www.businesscompass.com", description: "<ul><li>Implemented the First-Code Approach for handling Database schema changes and seeding.</li><li>Supported the design and implementation of a complex database schema that allows saving versions of different objects and relationships.</li><li>Developed several API Restful with ASP.NET 7</li><li>Developed responsive user interfaces that implemented design specifications and integrated seamlessly with backend API services</li><li>Developed stored functions, procedures, trigger functions, view tables and CTEs in PostgreSQL</li><li>Solved issues related with user sessions management based on OpenID Connect using Keycloak as Identity Provider.</li><li>Developed an automated programming solution for user’s access permission validation with ASP.NET.</li><li>Integrated and setup Stripe Payment Gateway.</li></ul>"})
Repo.insert!(%ProjectTechnology{project_id: 7, technology_id: 1})
Repo.insert!(%ProjectTechnology{project_id: 7, technology_id: 7})
Repo.insert!(%ProjectTechnology{project_id: 7, technology_id: 12})
Repo.insert!(%ProjectTechnology{project_id: 7, technology_id: 13})
Repo.insert!(%ProjectTechnology{project_id: 7, technology_id: 25})
Repo.insert!(%ProjectTechnology{project_id: 7, technology_id: 21})
Repo.insert!(%ProjectTechnology{project_id: 7, technology_id: 35})
Repo.insert!(%ProjectTechnology{project_id: 7, technology_id: 39})
Repo.insert!(%ProjectTechnology{project_id: 7, technology_id: 42})

Repo.insert!(%Project{profile_job_id: 3, name: "SPADE", link: "https://spade.businesscompass.com", description: "<ul><li>Developed an AI agent’s crew to generate executive summary based on domain data using CrewAI.</li><li>Developed a complex flow and crews to generate a future state of a process business model.</li></ul>"})
Repo.insert!(%ProjectTechnology{project_id: 1, technology_id: 1})
Repo.insert!(%ProjectTechnology{project_id: 1, technology_id: 8})
Repo.insert!(%ProjectTechnology{project_id: 1, technology_id: 9})
Repo.insert!(%ProjectTechnology{project_id: 1, technology_id: 21})
Repo.insert!(%ProjectTechnology{project_id: 1, technology_id: 18})
Repo.insert!(%ProjectTechnology{project_id: 1, technology_id: 22})
Repo.insert!(%ProjectTechnology{project_id: 1, technology_id: 25})
Repo.insert!(%ProjectTechnology{project_id: 1, technology_id: 27})
Repo.insert!(%ProjectTechnology{project_id: 1, technology_id: 31})
Repo.insert!(%ProjectTechnology{project_id: 1, technology_id: 35})
Repo.insert!(%ProjectTechnology{project_id: 1, technology_id: 41})


Repo.insert!(%ProfileJob{company_name: "Freelance", link: "", description: "Independent software projects built by myself", start_date: ~D[2025-01-01], end_date: nil})
Repo.insert!(%Project{profile_job_id: 4, name: "LANDING PAGE BUILT WITH NEXT.JS", link: "https://orquesta-m-de-la-buena.vercel.app", description: "<ul><li>Developed a whole website for a business using next.js and tailwind. With features like internationalization, emails delivery and contact through social networks.</li<li>CD using GitHub and Vercel.</li><li>Integrated Google Business reviews</li></ul>"})
Repo.insert!(%ProjectTechnology{project_id: 9, technology_id: 32})
Repo.insert!(%ProjectTechnology{project_id: 9, technology_id: 8})
Repo.insert!(%ProjectTechnology{project_id: 9, technology_id: 33})
Repo.insert!(%ProjectTechnology{project_id: 9, technology_id: 19})
Repo.insert!(%ProjectTechnology{project_id: 9, technology_id: 21})
Repo.insert!(%ProjectTechnology{project_id: 9, technology_id: 22})
Repo.insert!(%ProjectTechnology{project_id: 9, technology_id: 29})
Repo.insert!(%ProjectTechnology{project_id: 9, technology_id: 36})
Repo.insert!(%ProjectTechnology{project_id: 9, technology_id: 39})

Repo.insert!(%Project{profile_job_id: 4, name: "ANGULAR APP", link: "", description: "<ul><li>Refactored project to split backend and frontend responsabilities building a Node.js with Express.js server</li><li>Migrated from Firebase to Postgrest using Prisma ORM</li><li>Enhanced Authentication process</li></ul>"})
Repo.insert!(%ProjectTechnology{project_id: 10, technology_id: 32})
Repo.insert!(%ProjectTechnology{project_id: 10, technology_id: 33})
Repo.insert!(%ProjectTechnology{project_id: 10, technology_id: 43})
Repo.insert!(%ProjectTechnology{project_id: 10, technology_id: 44})
Repo.insert!(%ProjectTechnology{project_id: 10, technology_id: 40})
Repo.insert!(%ProjectTechnology{project_id: 10, technology_id: 37})
Repo.insert!(%ProjectTechnology{project_id: 10, technology_id: 21})
Repo.insert!(%ProjectTechnology{project_id: 10, technology_id: 22})
Repo.insert!(%ProjectTechnology{project_id: 10, technology_id: 14})
Repo.insert!(%ProjectTechnology{project_id: 10, technology_id: 8})
Repo.insert!(%ProjectTechnology{project_id: 10, technology_id: 1})
