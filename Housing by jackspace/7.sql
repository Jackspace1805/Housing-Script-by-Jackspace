CREATE TABLE IF NOT EXISTS house_owners_notifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    house_id INT NOT NULL,
    message TEXT NOT NULL,
    FOREIGN KEY (house_id) REFERENCES houses (id) ON DELETE CASCADE
);
