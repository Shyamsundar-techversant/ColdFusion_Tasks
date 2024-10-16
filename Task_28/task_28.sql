USE coldfusion;
CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(50),
    email VARCHAR(50),
    password VARCHAR(300),
    role VARCHAR(10)
);
SELECT * FROM users;
DROP TABLE users;
CREATE TABLE pages (
    pageid INT PRIMARY KEY AUTO_INCREMENT,
    pagename VARCHAR(255),
    pagedesc varchar(100)
);
SELECT * FROM pages;

INSERT INTO
	pages(pagename,pagedesc)
VALUES(
"amithab",
"history of violence"
);

