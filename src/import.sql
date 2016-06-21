
INSERT INTO Category (name, version) VALUES ('Sport', 0);
INSERT INTO Category (name, version) VALUES ('Games', 0);

INSERT INTO Subcategory (name, version, category_id) VALUES ('Soccer', 0, 1);
INSERT INTO Subcategory (name, version, category_id) VALUES ('Basketball', 0, 1);
INSERT INTO Subcategory (name, version, category_id) VALUES ('Tennis', 0, 1);
INSERT INTO Subcategory (name, version, category_id) VALUES ('Volleyball', 0, 1);
INSERT INTO Subcategory (name, version, category_id) VALUES ('Swimming', 0, 1);
INSERT INTO Subcategory (name, version, category_id) VALUES ('Table Tennis', 0, 1);

INSERT INTO Subcategory (name, version, category_id) VALUES ('Call of Duty 4"', 0, 2);
INSERT INTO Subcategory (name, version, category_id) VALUES ('Battlefield 2', 0, 2);
INSERT INTO Subcategory (name, version, category_id) VALUES ('World of Warcraft', 0, 2);
INSERT INTO Subcategory (name, version, category_id) VALUES ('Counter Strike', 0, 2);

-- Test Aktivitäten
INSERT INTO Activity (closed, deprecated, location, restriction, state, text, title, version, subcategory_id) VALUES (0, 0, 'Graz', 4, 'Steiermark', 'Suche 4 Leute für ein Fußballspiel in Gösting', 'Fußball', 0, 1);
INSERT INTO Activity (closed, deprecated, location, restriction, state, text, title, version, subcategory_id) VALUES (0, 0, 'Linz', 2, 'Oberösterreich', 'Suche Tenniskollegen :)', 'Lust auf ne Partie Tennis?', 0, 3);
INSERT INTO Activity (closed, deprecated, location, restriction, text, title, version, subcategory_id) VALUES (0, 0, 'Skype', 7, 'Bock auf raiden?', 'WoW', 0, 9);
INSERT INTO Activity (closed, deprecated, location, restriction, text, title, version, subcategory_id) VALUES (0, 0, 'Ts3', 2, '1v1 auf Crossfire', 'Cod!', 0, 7);

/*
INSERT INTO users(username,password,enabled) VALUES ('admin','$2a$10$2BZh7qw/FSh23ZCbojA.OOoo7vzg7KaqHUp34l8/i9.ktxzcr3vJm', TRUE);
INSERT INTO user_roles (username, ROLE) VALUES ('admin', 'ROLE_USER');
INSERT INTO user_roles (username, ROLE) VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO users(username,password,enabled) VALUES ('user','$2a$10$2BZh7qw/FSh23ZCbojA.OOoo7vzg7KaqHUp34l8/i9.ktxzcr3vJm', TRUE);
INSERT INTO user_roles (username, ROLE) VALUES ('user', 'ROLE_USER');
INSERT INTO users(username,password,enabled) VALUES ('john','$2a$10$2BZh7qw/FSh23ZCbojA.OOoo7vzg7KaqHUp34l8/i9.ktxzcr3vJm', TRUE);
INSERT INTO user_roles (username, ROLE) VALUES ('john', 'ROLE_JOHNNY');*/