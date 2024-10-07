USE coldfusion;
CREATE TABLE userAuth(
	username VARCHAR(30),
    userPassWord VARCHAR(20)
);
INSERT INTO userAuth(username,userPassWord)
VALUES("admin","admin123");

select * from userAuth;