use coldfusion;
CREATE TABLE registeredUsers(
	userId INT PRIMARY KEY AUTO_INCREMENT,
    fullName VARCHAR(100),
    email VARCHAR(50),
    userName VARCHAR(100),
    password VARCHAR(250)

);
drop table registeredUsers;
select * from registeredUsers;

CREATE TABLE gender(
	id INT PRIMARY KEY,
    gender_values VARCHAR(15)
);
INSERT INTO gender(
	id,gender_values
)
VALUES(
		1,"MALE"
    ),
    (
		2,"FEMALE"
    ),
    (
		3,"OTHERS"
    );
    
SELECT * FROM gender;

CREATE TABLE title(
	id INT PRIMARY KEY,
	titles VARCHAR(10)
);
INSERT INTO title(
	id,titles
)
VALUES(
	1,"Mr."
),
(
	2,"Mrs."
),
(
	3,"Miss."
);

select * from title;

CREATE TABLE contacts(
						contactId INT PRIMARY KEY,
						titleId INT,
						firstName VARCHAR(30),
						lastName VARCHAR(30),
                        genderId INT,
                        dob VARCHAR(20),
                        imagePath VARCHAR(200),
                        address VARCHAR(200),
                        street VARCHAR(100),
						pincode INT,
                        email VARCHAR(100),
						phone BIGINT,
                        FOREIGN KEY (contactId) REFERENCES registeredUsers(userId),
						FOREIGN KEY(titleId) REFERENCES title(id),
                        FOREIGN KEY(genderId) REFERENCES gender(id)
					);
SELECT * FROM contacts;
drop table contacts;