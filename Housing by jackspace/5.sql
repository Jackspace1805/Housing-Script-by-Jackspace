CREATE TABLE IF NOT EXISTS houses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    owner_id INT NOT NULL,
    furniture VARCHAR(255) NOT NULL,
    position_x FLOAT NOT NULL,
    position_y FLOAT NOT NULL,
    position_z FLOAT NOT NULL,
    renovated TINYINT(1) DEFAULT 0,
    wall_color VARCHAR(255) NOT NULL,
    UNIQUE KEY unique_owner (owner_id),
    FOREIGN KEY (owner_id) REFERENCES players (id) ON DELETE CASCADE
);
