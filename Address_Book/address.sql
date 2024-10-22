use coldfusion;
CREATE TABLE contacts(
						contactId INT PRIMARY KEY,
						title VARCHAR(10),
						firstName VARCHAR(30),
						lastName VARCHAR(30),
                        gender VARCHAR(10),
                        dob DATE,
                        imagePath VARCHAR(200),
                        address VARCHAR(200),
                        street VARCHAR(100),
						pincode INT,
                        email VARCHAR(100),
						phone INT,
                        FOREIGN KEY (contactId) REFERENCES registeredUsers(userId)
					);
SELECT * FROM contacts;
drop table contacts;

CREATE TABLE registeredUsers(
	userId INT PRIMARY KEY AUTO_INCREMENT,
    fullName VARCHAR(100),
    email VARCHAR(50),
    userName VARCHAR(100),
    password VARCHAR(250)

);
drop table registeredUsers;
select * from registeredUsers;