CREATE table utilisateurs (
    id_utilisateur int AUTO_INCREMENT PRIMARY KEY,
    nom varchar(50) NOT NULL,
    email varchar(200) NOT NULL,
    motdepasse varchar(300) NOT NULL,
    role ENUM('enseignant','etudiant') NOT NUll
    );


    --@block

     CREATE TABLE Categories(
    id_categorie INT AUTO_INCREMENT PRIMARY KEY,
    nom_categorie varchar(200) NOT NULL
    );


    --@block


    CREATE TABLE Quiz(
    id_quiz INT AUTO_INCREMENT PRIMARY KEY,
    titre_quiz varchar(200) NOT NULL,
    description text,
    duree_minutes INT NOT NULL,
    id_categorie INT,
    id_enseignant INT,
    FOREIGN KEY (id_categorie) REFERENCES Categories(id_categorie),
    FOREIGN KEY (id_enseignant) REFERENCES Utilisateurs(id_utilisateur)
    );


    --@block

    CREATE TABLE Questions (
    id_question INT AUTO_INCREMENT PRIMARY KEY,
    texte_question TEXT NOT NULL ,
    reponse_correcte TEXT NOT NULL,
    points INT NOT NULL,
    id_quiz INT,
    FOREIGN KEY (id_quiz) REFERENCES Quiz(id_quiz)
    );

    --@block

    CREATE TABLE Resultats(
    id_resultat INT AUTO_INCREMENT PRIMARY KEY,
    score INT NOT NULL,
    date_passage INT ,
    id_etudiant INT,
    id_quiz INT,
    FOREIGN KEY (id_etudiant) REFERENCES Utilisateurs(id_utilisateur),
    FOREIGN KEY (id_quiz) REFERENCES Quiz(id_quiz)
    );

    --@block

INSERT INTO Utilisateurs (nom, email, motdepasse, role) VALUES 
('Hassan Alami', 'hassan@qodex.com', 'pass123', 'enseignant'), 
('Salma Benani', 'salma@qodex.com', 'pass456', 'enseignant'), 
('Karim Tazi', 'karim@student.com', 'stud1', 'etudiant'),
('Mouna Fassi', 'mouna@student.com', 'stud2', 'etudiant'),    
('Omar Idrissi', 'omar@student.com', 'stud3', 'etudiant'); 

--@block

INSERT INTO Categories (nom_categorie) VALUES 
('Mathématiques'), 
('Informatique'),  
('Histoire'),     
('Physique');     

--@block

INSERT INTO Quiz (titre_quiz, description, duree_minutes, id_categorie, id_enseignant) VALUES 
('Algèbre Linéaire', 'Test sur les matrices', 45, 1, 1),      
('Base de Données', 'SQL et Modélisation', 60, 2, 1),        
('Guerre Mondiale', 'Histoire du 20ème siècle', 25, 3, 2),   
('Programmation C', 'Les pointeurs en C', 40, 2, 2);  

--@block

INSERT INTO Questions (texte_question, reponse_correcte, points, id_quiz) VALUES 
('Quelle est la commande pour créer une table ?', 'CREATE TABLE', 5, 2),
('Quelle est la clé primaire ?', 'PK', 10, 2), 
('2 + 2 = ?', '4', 2, 1),
('Qui a gagné la guerre ?', 'Alliés', 15, 3), 
('C est un langage compilé ?', 'Oui', 5, 4);

--@block

INSERT INTO Resultats (score, date_passage, id_etudiant, id_quiz) VALUES 
(85, '2023-10-01', 3, 2),  
(40, '2023-10-02', 3, 1),  
(90, '2023-10-03', 4, 2),  
(65, '2023-10-04', 5, 3);  

--@block

INSERT INTO Quiz (titre_quiz, description, duree_minutes, id_categorie, id_enseignant) 
VALUES ('Javascript Basics', 'Introduction au JS', 30, 2, 1);

--@block

SELECT * FROM Quiz

--@block

UPDATE Quiz 
SET duree_minutes = 120 
WHERE id_quiz = 1;

--@block

SELECT * FROM Utilisateurs;

--@block

SELECT nom, email FROM Utilisateurs;

--@block

SELECT * FROM Quiz;

--@block

SELECT titre_quiz FROM Quiz;

--@block

SELECT * FROM Categories;

--@block

SELECT * FROM Utilisateurs 
WHERE role = 'enseignant';

--@block

SELECT * FROM Utilisateurs 
WHERE role = 'etudiant';

--@block

SELECT * FROM Quiz 
WHERE duree_minutes > 30;

--@block

SELECT * FROM Quiz 
WHERE duree_minutes <= 45;

--@block

SELECT * FROM Questions 
WHERE points > 5;

--@block

SELECT * FROM Quiz 
WHERE duree_minutes BETWEEN 20 AND 40;

--@block

SELECT * FROM Resultats 
WHERE score >= 60;

--@block

SELECT * FROM Resultats 
WHERE score < 50;


--@block

SELECT * FROM Questions 
WHERE points BETWEEN 5 AND 15;

--@block

SELECT * FROM Quiz 
WHERE id_enseignant = 1;

--@block


SELECT * FROM Quiz 
ORDER BY duree_minutes ASC;

--@block

SELECT * FROM Resultats 
ORDER BY score DESC;

--@block

SELECT * FROM Resultats 
ORDER BY score DESC 
LIMIT 5;

--@block

SELECT * FROM Questions 
ORDER BY points ASC;


--@block


SELECT * FROM Resultats 
ORDER BY date_passage DESC 
LIMIT 3;

--@block


SELECT Quiz.titre_quiz, Categories.nom_categorie
FROM Quiz
INNER JOIN Categories 
ON Quiz.id_categorie = Categories.id_categorie;


--@block

SELECT Quiz.titre_quiz, COUNT(Resultats.id_etudiant) AS nombre_etudiants
FROM Quiz
JOIN Resultats ON Quiz.id_quiz = Resultats.id_quiz
GROUP BY Quiz.id_quiz, Quiz.titre_quiz;

--@block

SELECT Quiz.titre_quiz, MAX(Resultats.score) AS meilleur_score
FROM Quiz
JOIN Resultats ON Quiz.id_quiz = Resultats.id_quiz
GROUP BY Quiz.id_quiz, Quiz.titre_quiz;


--@block


ALTER TABLE Quiz
ADD date_creation DATE;

--@block

SELECT * FROM quiz



