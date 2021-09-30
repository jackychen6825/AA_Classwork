PRAGMA foreign_keys = ON; 

DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

INSERT INTO 
  users (fname, lname)
VALUES
  ('Jacky', 'Chen'), 
  ('Nick', 'Raff'); 

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO 
  questions (title, body, author_id)
VALUES
  ('bfs big o runtime', 'should be something about vertices and edges', 1),
  ('dfs big o runtime', 'should be something about vertices and edges', 2); 

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  question_follows(user_id, question_id)
VALUES
  (1,1),
  (2,1),
  (2,2),
  (1,2); 

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  parent_id INTEGER,
  user_id INTEGER,
  body TEXT,

  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
  replies (question_id, parent_id, user_id, body)
VALUES
  (1, NULL ,2, 'WHAT THE HECK!'),
  (1, 1, 1, 'YO SAME');


CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id  INTEGER,
  question_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (1,1),
  (2,1),
  (2,2),
  (1,2);



