/*Questo file va messo nella directory principale di XAMPP, per esempio: C:\xampp

TESTING: aprire XAMPP e attivare Apache e MySql. Aprire la shell di XAMPP e digitare:
mysql -u root < gestione_corsi.sql
se vi sono errori verificare eventuali errori di sintassi nel codice.

per entrare nel database selezionando gestione_corsi direttamente:
mysql -u root -D gestione_corsi

per vedere le tabelle presenti in gestione_corsi:
show tables;
*/

DROP DATABASE IF EXISTS gestione_corsi;
CREATE DATABASE gestione_corsi;
USE gestione_corsi;

CREATE TABLE docenti (
    id INT AUTO_INCREMENT /*PRIMARY KEY*/,
    nome VARCHAR(20) NOT NULL,
    cognome VARCHAR(30) NOT NULL,
    codice_fiscale VARCHAR(16),

    PRIMARY KEY(id)
);

CREATE TABLE materie (
    id INT AUTO_INCREMENT /*PRIMARY KEY*/,
    nome VARCHAR(30) NOT NULL,
    anno INT(4),
    ore INT(3) NOT NULL,
    /*LEGAME CON DOCENTE*/
    docente_id INT /*specifiche foreign key*/,
    docente_fascia VARCHAR(1),
    PRIMARY KEY(id)
);

CREATE TABLE alunni (
    id INT AUTO_INCREMENT /*PRIMARY KEY*/,
    nome VARCHAR(20) NOT NULL,
    cognome VARCHAR(30) NOT NULL,
    anno_nascita INT(4),

    PRIMARY KEY(id)
);

CREATE TABLE frequenze (
    id INT AUTO_INCREMENT /*PRIMARY KEY*/,
    alunno_id INT NOT NULL,
    materia_id INT NOT NULL,
    media DECIMAL(2,2),
    ore_assenza INT(3),

    PRIMARY KEY(id)
);



/* Inserimento dati di esempio */

INSERT INTO docenti(nome, cognome)
VALUES('Matteo', 'Arosti'), ('Andrea', 'Ribuoli'), ('Gabriella', 'Acerbi');

INSERT INTO materie(nome, ore, docente_id, docente_fascia)
VALUES('Sistemistica', 16, 1, 'B'), ('Database', 40, 1, 'A'), ('Fond. prog.', 40, 2, 'A'), ('Tec. Relazioni', 20, 3, 'A');

INSERT INTO alunni(nome, cognome)
VALUES('Pinco', 'Pallino'), ('Tizio', 'Caio'), ('Sempronio', 'Palletto');

INSERT INTO frequenze(alunno_id, materia_id, media, ore_assenza)
VALUES(1, 1, 7.2, 3), (1, 2, 8, 0), (2, 1, 8, 20);
