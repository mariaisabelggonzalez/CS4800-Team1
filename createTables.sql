CREATE DATABASE IF NOT EXIST campusConnect.db;

CREATE TABLE IF NOT EXIST user (
    user_id INT AUTO_INCREMENT PRIMARY KEY;
    user_name VARCHAR(20) NOT NULL;
    email VARCHAR(50) NOT NULL;
    password_hash VARCHAR(100) NOT NULL;
    date_joined DATETIME NOT NULL;
    message_count INT default=0;
    active_lost INT default=0;
    active_found INT default=0;
    is_admin BOOLEAN default=0;
    is_moderator BOOLEAN default=0;
    is_tempban BOOLEAN default=0;
    ban_lift DATETIME;
    is_permban BOOLEAN default=0;
)

CREATE TABLE IF NOT EXIST item (
    item_id INT AUTO_INCREMENT PRIMARY KEY;
    title VARCHAR(100) NOT NULL;
    item_description VARCHAR(1000) NOT NULL;
    category INT FOREIGN KEY;
    item_status INT FOREIGN KEY default=0;
    date_posted DATETIME NOT NULL;
    image_path VARCHAR(100);
    user_id INT FOREIGN KEY;
    FOREIGN KEY (user_id) REFERENCES user(user_id);
    FOREIGN KEY (category) REFERENCES category(category_id);
    FOREIGN KEY (item_status) REFERENCES status(status_id;) 
)

CREATE TABLE IF NOT EXIST message (
    message_id INT AUTO_INCREMENT PRIMARY KEY;
    sender_id INT FOREIGN KEY;
    receiver_id INT FOREIGN KEY;
    content VARCHAR(1000);
    time_stamp DATETIME NOT NULL;
    FOREIGN KEY (sender_id) REFERENCES user(user_id);
    FOREIGN KEY (receiver_id) REFERENCES user(user_id);
)

CREATE TABLE IF NOT EXIST status (
    status_id INT AUTO_INCREMENT PRIMARY KEY;
    status_type VARCHAR(20);
)

CREATE TABLE IF NOT EXIST category (
    category_id INT AUTO_INCREMENT PRIMARY KEY;
    category VARCHAR(20) NOT NULL;
)
    
INSERT INTO status (status_type) VALUES (lost, found);
INSERT INTO category (category) 
    VALUES (electronics, books, keys, clothing, other);
