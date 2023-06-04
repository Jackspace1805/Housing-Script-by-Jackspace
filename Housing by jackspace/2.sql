CREATE TABLE IF NOT EXISTS player_inventory (
    player_id INT,
    item_name VARCHAR(50),
    PRIMARY KEY (player_id, item_name)
);