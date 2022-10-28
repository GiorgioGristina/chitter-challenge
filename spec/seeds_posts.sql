
TRUNCATE TABLE posts RESTART IDENTITY; -- replace with your own table name.

INSERT INTO posts (content, creat_at, user_id) VALUES ('traveling', '2019-12-20 22:03:33', 2);

INSERT INTO posts (content, creat_at, user_id) VALUES ('cooking', '2021-02-11 08:03:33', 1);
INSERT INTO posts (content, creat_at, user_id) VALUES ('cleaning', '2021-04-02 02:43:33', 1);
