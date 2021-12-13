/*query varie per i test*/

SELECT * FROM docenti;
SELECT * FROM materie;


SELECT * FROM materie
 JOIN docenti ON materie.docente_id = docenti.id;

SELECT materie.nome, materie.ore, docenti.cognome, docenti.nome
 FROM materie
 JOIN docenti ON materie.docente_id = docenti.id;


SELECT cognome
 FROM materie
 JOIN docenti ON materie.docente_id = docenti.id;

SELECT * FROM frequenze
 JOIN alunni ON frequenze.alunno_id = alunni.id;



------------------------------------------------------------------------


 /*query che unisca le frequenze (alunni)*/

 SELECT alunni.nome, alunni.cognome, frequenze.*
 FROM frequenze
 JOIN alunni ON frequenze.alunno_id = alunni.id;


SELECT alunni.nome, alunni.cognome, materie.nome, frequenze.media, frequenze.ore_assenza, docenti.cognome
 FROM frequenze
 JOIN alunni ON frequenze.alunno_id = alunni.id
 JOIN materie ON frequenze.materia_id = materie.id
 JOIN docenti ON materie.docente_id = docenti.id;

/*LEFT o RIGHT OUTER JOIN*/
SELECT *
 FROM frequenze /*INNER*/ JOIN alunni ON frequenze.alunno_id = alunni.id;

SELECT *
FROM frequenze RIGHT OUTER JOIN alunni ON frequenze.alunno_id = alunni.id;

SELECT *
 FROM frequenze LEFT OUTER JOIN alunni ON frequenze.alunno_id = alunni.id;

---------------------------------------------------------------

/*nome e cognome dei docenti di fascia A in qualche materia*/

SELECT docenti.nome, docenti.cognome, materie.nome, materie.docente_fascia
 FROM docenti
 JOIN docenti ON materie.docente_id = docenti.id
 WHERE materie.docente_fascia = 'A';


/*tutte le materie ordinate per anno, numero ore DESC e nome*/


SELECT * FROM materie
 ORDER BY anno, materie.ore DESC, materie.nome;


/*tutti i docenti che insegnano materie del primo e secondo anno*/

SELECT DISTINCT docenti.id, docenti.nome, docenti.cognome
 FROM docenti
 RIGHT OUTER JOIN materie ON materie.docenti_id = docenti.id
 /*WHERE materie.anno = 1 OR materie.anno = 2;*/
 WHERE anno IN(1,2);

/*tutti i docenti che insegnano materie con più di 30 ore*/

SELECT DISTINCT docenti.id, docenti.nome, docenti.cognome
 FROM docenti
 JOIN materie ON materie.docenti_id = docenti.id
 WHERE materie.ore > 30;


/*tutti gli alunni che frequentano materie con più di 30 ore*/

SELECT DISTINCT alunni.nome, alunni.cognome
 FROM alunni
 JOIN frequenze ON alunno_id = frequenze.alunno_id
 JOIN materie ON frequenze.materia_id = materie.id
 WHERE materie.ore > 30;


/*tutti gli alunni che frequentano almeno una materia di arosti*/

SELECT DISTINCT alunni.id, alunni.nome, alunni.cognome
 FROM alunni
 JOIN frequenze ON frequenze.alunno_id = alunni.id
 JOIN materie ON frequenze.materia_id = materie.id
 JOIN docenti ON frequenze.materia_id = docenti.id
 WHERE docenti.cognome = 'Arosti';


---------------------------------------

/*ESEMPIO GROUP BY*/

SELECT * 
 FROM materie JOIN docenti ON materie.docente_id = docenti.id;


SELECT docenti.id, docenti.cognome, docenti.nome,
        COUNT(*), SUM(materie.ore), AVG(materie.ore)
 FROM materie JOIN docenti ON materie.docente_id = docenti.id
 GROUP BY docenti.id, docenti.cognome, docenti.nome;


SELECT alunni.id, alunni.nome, alunni.cognome 
 FROM alunni 
 JOIN frequenze ON frequenze.alunno_id = alunni.id
 GROUP BY alunni.id, alunni.nome, alunni.cognome;


SELECT alunni.id, alunni.nome, alunni.cognome,
    COUNT(*) AS materie_frequentate, 
    AVG(frequenze.media) AS media, 
    SUM(ore_assenza) AS tot_ore_assenza,
    MAX(ore_assenza) AS ore_assenza_max_per_materia,
    MIN(ore_assenza) AS ore_assenza_min_per_materia
 FROM alunni 
 JOIN frequenze ON frequenze.alunno_id = alunni.id
 WHERE frequenze.ore_assenza > 0
 GROUP BY alunni.id, alunni.nome, alunni.cognome
 HAVING COUNT(*) > 1
 ORDER BY AVG(frequenze.media) DESC;
