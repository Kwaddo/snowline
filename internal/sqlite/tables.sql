CREATE TABLE IF NOT EXISTS USERS (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    image_path VARCHAR(255) DEFAULT "../uploads/DefaultPFP.jpg"
);


CREATE TABLE IF NOT EXISTS SESSIONS (
    session_id INTEGER PRIMARY KEY AUTOINCREMENT,
    cookie_value VARCHAR(55) UNIQUE,
    username VARCHAR(255) NOT NULL, 
    user_id INTEGER NOT NULL,
    expires_at DATETIME NOT NULL UNIQUE,
    isValid Boolean,
    foreign key (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS POSTS (
    post_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(255) NOT NULL,   
    title VARCHAR(255) NOT NULL,   
    image_path VARCHAR(255) DEFAULT NULL,       
    content TEXT NOT NULL,              
    user_id INTEGER NOT NULL,             
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS COMMENTS (
    comment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    post_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    username VARCHAR(255) NOT NULL, 
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES POSTS(post_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS POST_LIKES (
    post_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    isliked BOOLEAN,
    PRIMARY KEY (post_id, user_id),
    FOREIGN KEY (post_id) REFERENCES POSTS(post_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS COMMENT_LIKES (
    comment_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    isliked BOOLEAN,
    PRIMARY KEY (comment_id, user_id),
    FOREIGN KEY (comment_id) REFERENCES COMMENTS(comment_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE
    
);


-- DROP TABLE COMMENTS;
-- DROP TABLE POSTS;
-- DROP TABLE SESSIONs;
-- DROP TABLE users;
-- DROP TABLE POST_LIKES;














