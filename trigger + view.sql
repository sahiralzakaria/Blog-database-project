-- Drop public database

DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

-- Create tables

CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    u_password VARCHAR(255) NOT NULL,
    about TEXT DEFAULT 'No information provided' -- max: 65,535 characters - 64 KB
);


INSERT INTO Users (first_name, last_name, username, email, u_password, about) VALUES
('John', 'Doe', 'johndoe', 'johndoe@example.com', 'password1', 'About John'),
('Jane', 'Smith', 'janesmith', 'janesmith@example.com', 'password2', 'About Jane'),
('Alice', 'Johnson', 'alicejohnson', 'alicejohnson@example.com', 'password3','About Alice'),
('Bob', 'Brown', 'bobbrown', 'bobbrown@example.com', 'password4','About Bob'),
('Charlie', 'Davis', 'charliedavis', 'charliedavis@example.com', 'password5','About Charlie'),
('David', 'Evans', 'davidevans', 'davidevans@example.com', 'password6','About David'),
('Eve', 'Frank', 'evefrank', 'evefrank@example.com', 'password7','About Eve'),
('Frank', 'Green', 'frankgreen', 'frankgreen@example.com', 'password8','About Frank'),
('Grace', 'Hill', 'gracehill', 'gracehill@example.com', 'password9','About Grace'),
('Hank', 'Ivy', 'hankivy', 'hankivy@example.com', 'password10','About Hank'),
('Ivy', 'Jones', 'ivyjones', 'ivyjones@example.com', 'password11','About Ivy'),
('Jack', 'King', 'jackking', 'jackking@example.com', 'password12','About Jack');

CREATE TABLE Notification (
    notification_id SERIAL PRIMARY KEY NOT NULL,
    n_type VARCHAR(50) NOT NULL,
    n_content TEXT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


INSERT INTO Notification (n_type, n_content, user_id) VALUES
('New Message', 'You have a new message', 1),
('Friend Request', 'Jane sent you a friend request', 2),
('Mention', 'Alice mentioned you in a post', 3),
('Comment', 'Bob commented on your post', 4),
('Like', 'Charlie liked your post', 5),
('New Follower', 'David started following you', 6),
('Friend Request', 'Eve sent you a friend request', 7),
('New Message', 'Frank sent you a message', 8),
('Comment', 'Grace commented on your post', 9),
('Mention', 'Hank mentioned you in a post', 10),
('New Follower', 'Ivy started following you', 11),
('Like', 'Jack liked your post', 12);




CREATE TABLE Role (
    role_id SERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(50) NOT NULL,
    description TEXT DEFAULT 'No description available'
);


INSERT INTO Role (title, description) VALUES
('Admin', 'Administrator role with full permissions'),
('User', 'Regular user with limited permissions'),
('Moderator', 'Moderator role with some permissions'),
('Editor', 'Editor role with publishing permissions'),
('Author', 'Author role with writing permissions'),
('Contributor', 'Contributor with limited access'),
('Subscriber', 'Subscriber with viewing permissions'),
('Guest', 'Guest role with temporary permissions'),
('Support', 'Support team role'),
('Developer', 'Developer role with code access'),
('Manager', 'Manager with oversight permissions'),
('Analyst', 'Analyst role for data analysis');






CREATE TABLE Post (
    post_id SERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(100) NOT NULL,
    p_content TEXT NOT NULL,
    total_likes INT DEFAULT 0 NOT NULL,
    publish_date DATE NOT NULL,
    total_comments INT DEFAULT 0 NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Post (title, p_content, total_likes, publish_date, total_comments, user_id) VALUES
('My First Post', 'This is my first post content', 10, '2024-01-01', 5, 1),
('Learning SQL', 'SQL is a powerful language', 8, '2024-01-02', 3, 2),
('My Journey', 'This is about my journey', 12, '2024-01-03', 4, 3),
('Vacation Highlights', 'Sharing my vacation experiences', 9, '2024-01-04', 2, 4),
('Book Review', 'Review of a great book', 7, '2024-01-05', 1, 5),
('Tech Trends', 'Discussing latest tech trends', 5, '2024-01-06', 6, 6),
('Fitness Tips', 'Some tips for staying fit', 4, '2024-01-07', 2, 7),
('Recipe Ideas', 'Sharing delicious recipes', 6, '2024-01-08', 3, 8),
('Photography Tips', 'Tips for better photos', 11, '2024-01-09', 5, 9),
('Travel Guide', 'Guide to best travel spots', 9, '2024-01-10', 4, 10),
('Programming Tips', 'Tips for new programmers', 10, '2024-01-11', 2, 11),
('Movie Review', 'Review of a popular movie', 8, '2024-01-12', 6, 12);



CREATE TABLE Comment (
    comment_id SERIAL PRIMARY KEY NOT NULL,
    date DATE NOT NULL,
    c_content TEXT NOT NULL,
    total_likes INT DEFAULT 0 NOT NULL,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (post_id) REFERENCES Post(post_id)
);


INSERT INTO Comment (date, c_content, total_likes, user_id, post_id) VALUES
('2024-01-13', 'Great post!', 3, 1, 2),
('2024-01-14', 'Thanks for sharing!', 2, 2, 3),
('2024-01-15', 'Very informative.', 4, 3, 4),
('2024-01-16', 'Loved it!', 5, 4, 5),
('2024-01-17', 'Interesting thoughts', 2, 5, 6),
('2024-01-18', 'Nice tips!', 6, 6, 7),
('2024-01-19', 'Well written', 1, 7, 8),
('2024-01-20', 'Awesome post', 2, 8, 9),
('2024-01-21', 'Helpful guide', 4, 9, 10),
('2024-01-22', 'Great content', 3, 10, 11),
('2024-01-23', 'Loved the review', 5, 11, 12),
('2024-01-24', 'Good insights', 6, 12, 1);



CREATE TABLE Reaction (
    reaction_id SERIAL PRIMARY KEY NOT NULL,
    r_type VARCHAR(50) NOT NULL,
    date DATE NOT NULL,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (post_id) REFERENCES Post(post_id)
);


INSERT INTO Reaction (r_type, date, user_id, post_id) VALUES
('Like', '2024-01-13', 2, 1),
('Love', '2024-01-14', 3, 2),
('Like', '2024-01-15', 4, 3),
('Haha', '2024-01-16', 5, 4),
('Wow', '2024-01-17', 6, 5),
('Sad', '2024-01-18', 7, 6),
('Angry', '2024-01-19', 8, 7),
('Like', '2024-01-20', 9, 8),
('Love', '2024-01-21', 10, 9),
('Wow', '2024-01-22', 11, 10),
('Haha', '2024-01-23', 12, 11),
('Sad', '2024-01-24', 1, 12);


CREATE TABLE Share (
    share_id SERIAL PRIMARY KEY NOT NULL,
    date DATE NOT NULL,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (post_id) REFERENCES Post(post_id)
);


INSERT INTO Share (date, user_id, post_id) VALUES
('2024-01-25', 1, 2),
('2024-01-26', 2, 3),
('2024-01-27', 3, 4),
('2024-01-28', 4, 5),
('2024-01-29', 5, 6),
('2024-01-30', 6, 7),
('2024-01-31', 7, 8),
('2024-02-01', 8, 9),
('2024-02-02', 9, 10),
('2024-02-03', 10, 11),
('2024-02-04', 11, 12),
('2024-02-05', 12, 1);




CREATE TABLE Tag (
    tag_id SERIAL PRIMARY KEY NOT NULL,
    t_name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO Tag (t_name) VALUES
('Tech'), ('Lifestyle'), ('Health'), ('Food'), ('Travel'), ('Photography'), 
('Programming'), ('Movies'), ('Books'), ('Sports'), ('Finance'), ('Education');



CREATE TABLE Category (
    category_id SERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(50) NOT NULL UNIQUE,
    description TEXT DEFAULT 'No description available'
);

INSERT INTO Category (title, description) VALUES
('Technology', 'Posts about technology'),
('Lifestyle', 'Posts about lifestyle'),
('Health', 'Health-related posts'),
('Food', 'Food recipes and reviews'),
('Travel', 'Travel tips and guides'),
('Photography', 'Photography tips and tricks'),
('Programming', 'Programming tutorials'),
('Movies', 'Movie reviews and insights'),
('Books', 'Book recommendations and reviews'),
('Sports', 'Sports news and analysis'),
('Finance', 'Finance and investment tips'),
('Education', 'Educational content');



CREATE TABLE Advertisement (
    ad_id SERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(100) NOT NULL,
    a_content TEXT NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Category(category_id) ON DELETE CASCADE
);


INSERT INTO Advertisement (title, a_content, category_id) VALUES
('Tech Sale', 'Discount on tech products!', 1),
('Lifestyle Guide', 'Your guide to a better life', 2),
('Health Supplements', 'Best supplements for health', 3),
('Food Festival', 'Enjoy delicious food', 4),
('Travel Deals', 'Cheap travel deals', 5),
('Photo Gear', 'Discount on cameras', 6),
('Coding Bootcamp', 'Learn programming fast', 7),
('Movie Premiere', 'Upcoming movies', 8),
('Book Fair', 'Discounted books', 9),
('Sports Gear', 'Sale on sports equipment', 10),
('Investment Tips', 'Finance advice', 11),
('Education Courses', 'Special discount on courses', 12);


CREATE TABLE PostCategory (
    post_id INT NOT NULL,
    category_id INT NOT NULL ,
    FOREIGN KEY (post_id) REFERENCES Post(post_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id) ON DELETE CASCADE
);


INSERT INTO PostCategory (post_id, category_id) VALUES
(1, 1), (1, 2), (1, 3),(2, 1), (2, 3),
(2, 5), (3, 3), (3, 5),(4, 6), (5, 6);


--DELETE FROM Category WHERE category_id = 2 OR category_id = 6;

--SELECT * FROM Advertisement;

--SELECT * FROM PostCategory;


CREATE TABLE UserRole (
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

INSERT INTO UserRole (user_id, role_id) VALUES
(1, 1), (1, 2), (2, 3), (3, 3), (4, 5), (5, 5),
(6, 7), (7, 8), (7, 9), (9, 9), (10, 11), (10, 12);


CREATE TABLE PostTag (
    post_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (post_id) REFERENCES Post(post_id),
    FOREIGN KEY (tag_id) REFERENCES Tag(tag_id)
);

INSERT INTO PostTag (post_id, tag_id) VALUES
(1, 1), (1, 2), (1, 3),(2, 1), (2, 4),
(3, 2), (3, 3), (3, 5),(4, 5), (4, 6);

--Belirli bir tarihler arasında, minimum yorum sayısını aşan gönderilerin sayısını döndürür.

CREATE FUNCTION get_popular_posts_count(
    min_comments INT,
    date_from DATE,
    date_to DATE
) RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
    posts_count INT;
BEGIN
    SELECT COUNT(*)
    INTO posts_count
    FROM Post
    WHERE total_comments > min_comments
      AND publish_date BETWEEN date_from AND date_to;

    RETURN posts_count;
END;
$$;

--SELECT get_popular_posts_count(3, '2024-01-01', '2024-01-15');


-- Bu trigger, Comment tablosundan silinen yorumları CommentDeletionLog tablosuna kaydeder

CREATE TABLE CommentDeletionLog (
    log_id SERIAL PRIMARY KEY NOT NULL,
    comment_id INT NOT NULL,
    log_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE OR REPLACE FUNCTION log_comment_deletions()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO CommentDeletionLog (comment_id)
    VALUES (OLD.comment_id);

    RETURN OLD;
END;
$$;
CREATE TRIGGER trigger_comment_delete
AFTER DELETE ON Comment
FOR EACH ROW
EXECUTE FUNCTION log_comment_deletions();

--DELETE FROM Comment WHERE comment_id = 2 or comment_id = 5;

--SELECT * FROM CommentDeletionLog;

-- Bu VIEW, 2023 sonrası en çok beğenilen 5 paylaşımı ve yazar bilgilerini listeler.

CREATE VIEW TopPosts AS
SELECT 
    p.post_id,
    p.title,
    p.p_content AS content,
    p.total_likes,
    u.first_name,
    u.last_name
FROM 
    Post p
JOIN 
    Users u ON p.user_id = u.user_id
WHERE 
    p.publish_date > '2023-01-01'
ORDER BY 
    p.total_likes DESC
LIMIT 5;

--SELECT * FROM TopPosts;

