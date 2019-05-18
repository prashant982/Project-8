CREATE TABLE photos(
    id INT AUTO_INCREMENT PRIMARY KEY, 
    image_url VARCHAR(255) NOT NULL, 
    user_id INT NOT NULL, 
    created_at TIMESTAMP DEFAULT NOW(), 
    FOREIGN KEY(user_id) REFERENCES users(id)
);
