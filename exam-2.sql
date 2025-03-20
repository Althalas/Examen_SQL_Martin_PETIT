/*1*/
CREATE DATABASE bibliotheque;

USE bibliotheque;

CREATE TABLE adhérents (id_adhérent INT PRIMARY KEY AUTO_INCREMENT NOT NULL, nom VARCHAR(100), adresse VARCHAR(100), date_inscription DATE, a_surveiller VARCHAR(100));

CREATE TABLE livres (isbn INT PRIMARY KEY AUTO_INCREMENT NOT NULL, titre VARCHAR(100), auteur VARCHAR(100), année_publication DATE, disponible VARCHAR(100));

CREATE TABLE emprunts (id_adhérent INT, isbn INT, date_emprunt DATE, date_retour DATE, PRIMARY KEY (id_adhérent, isbn), FOREIGN KEY (id_adhérent) REFERENCES adhérents (id_adhérent), FOREIGN KEY (isbn) REFERENCES livres (isbn));

/*2*/
CREATE USER 'bibliothecaire'@'localhost' IDENTIFIED BY 'secret';

GRANT SELECT, INSERT, UPDATE, DELETE ON bibliotheque.* TO 'bibliothecaire'@'localhost';

/*3*/
INSERT INTO adhérents (id_adhérent, nom, adresse, date_inscription) VALUES (1, 'Jane Austen', '12 rue de grenoble', '2024-01-15'), (2, 'Charles Dickens', '7 rue de vichy', '2024-03-25'), (3, 'Jules Verne', '4 rue de cusset', '2024-09-13'), (4, 'Mary Shelley', '9 rue de riom', '2024-05-05');

INSERT INTO livres (isbn, titre, auteur, année_publication, disponible) VALUES (1,'Orgueil et Préjugés','lucien Snoop','1990-02-15','non'),(2,'David Copperfield','david Vincent','1997-10-25','oui'),(3,'Vingt mille lieues sous les mers','mathieu david','2000-02-05','non'),(4,'Frankenstein','Franck Enstein','2002-12-05','oui');

INSERT INTO emprunts (id_adhérent, isbn, date_emprunt, date_retour) VALUES (1,1,'2024-12-02','2024-12-20'),(2,2,'2024-06-05','2024-07-10'),(3,3,'2024-08-12','2024-10-09'),(4,4,'2024-12-20','2024-12-31');

/*4*/
UPDATE adhérents
SET adresse = '15 rue de beaumont'
WHERE id_adhérent = 2;

/*8*/
DELETE FROM adhérents
WHERE id_adhérent = 4;

/*9/

/*sur la table emprunts car c'est une table de jointure(éviter les doublons etc.)*/

/*10*/

/**/
DROP DATABASE bibliotheque;