CREATE TABLE IF NOT EXISTS player_houses (
    player_id INT PRIMARY KEY,
    renovated BOOLEAN,
    wall_color_r INT,
    wall_color_g INT,
    wall_color_b INT,
    selected_mlo VARCHAR(50)
);