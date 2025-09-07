# Blog Database Project (Blog Veritabanı Projesi)

## About the Project


This project models the fundamental database structure of a blog system. It is written in **PostgreSQL** and includes essential entities such as users, posts, comments, and categories.

## Objective

The goal is to design a reliable and scalable database structure for blog systems, applying relational database principles effectively.

## Technologies Used


- **Database:** PostgreSQL
- **Query Language:** SQL
- **Design Pattern:** Relational data modeling (ER model)


## 📄 Database Contents

The database includes the following tables:

- `users` – Stores user information
- `posts` – Blog posts written by users
- `comments` – Comments written by users on posts
- `categories` – Post categories
- `tags` – Tags used for posts
- `post_tags` – Manages the many-to-many relationship between posts and tags

## 🧪 How to Use


1. Make sure PostgreSQL is installed on your system.
2. Open your terminal or pgAdmin and run the SQL script:

```bash
psql -U your_username -d your_database_name -f blog_project.sql
```

> Replace `your_username` and `your_database_name` with your actual PostgreSQL username and database name.

## 📝 Contributing

If you'd like to contribute to this project, feel free to fork the repository, make your changes, and submit a Pull Request.



## 👤 Author

This project was developed by **Sahir Zakaria**.

## 📬 Contact


Feel free to connect with me:

- [![GitHub](https://img.shields.io/badge/GitHub-100000?style=flat&logo=github&logoColor=white)](https://github.com/sahiralzakaria) **GitHub:** [sahiralzakaria](https://github.com/sahiralzakaria)  
- [![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/sahir-zakaria-39873531b) **LinkedIn:** [sahir-zakaria](https://www.linkedin.com/in/sahir-zakaria-39873531b)  
- [![Email](https://img.shields.io/badge/Email-D14836?style=flat&logo=gmail&logoColor=white)](mailto:sahir.alzakaria@gmail.com) **Email:** sahir.alzakaria@gmail.com

## 📃 License

This project is open-source and free to use for learning or development purposes.

---

> If you find this project useful, don't forget to ⭐ star the repository!
