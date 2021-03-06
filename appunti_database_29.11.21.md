DATABASE

Database: memorizzare e fornirci informazioni sui dati

Database relazionale [un altro è database documentale]<br>
Il primo aspetto si chiama Entità.

**Entità**: parte della realtà con le informazioni che mi interessano di più. In genere finiscono come tabelle e ogni colonna avrà un'informazione.
Record o Tupla: insieme di dati.

Secondo aspetto: relazioni.
**Relazione**: ciò che permette di mettere appunto in relazione due entità o più.
*Esempio*: persona[entità1] che fa[relazione] un ordine[entità2].
*sempio 2*: un ordine[entità2] fatto di[relazione] articoli[entità3].

Questo è uno schema **E/R** (entity relationship).

<hr>

PHPMYADMIN

Attivare Apache fino a segnale verde, attivare Mysql fino a segnale verde. Aprire browser, andare su localhost (o 127.0.0.1) e poi PhPMyAdmin dalla pagina localhost.

Solo il database di test o creati da noi si possono toccare, gli altri no!!!

Creare nuovo database: nuovo, inserire nome - lasciamo la codifica com'è, nuovo - lo abbiamo chiamato "clienti". Creare tabelle: scegliere numero di campi (esempio: tre campi con nome, cognome e anno di nascita), inserire quantità ed eseguire.<br>

Tipi:
**INT**: intero
**VARCHAR**: campi delimitati di test
**TEXT**: testo illimitato
**DATE**: campo tipo data

Per inserire dati, cliccare su Inserisci. Nel campo Valori, riempire i campi e cliccare su Esegui. La pagina mostrerà l'esecuzione eseguita in codice. Tornare su mostra per vedere i dati salvati.

*NOTA*: nelle query, i decimali vanno scritti col punto (esempio: 3.5 e NON 3,5 perché la virgola divide i singoli campi).
<hr>

4 operazioni fondamentali di SLQ. Operazioni base di manipolazione dati, dette anche CRUD (create, read, update, delete)

**SELECT** - dammi

Esempi:<br>
SELECT * FROM clienti <br>
dammi TUTTI i record e campi dalla tabella chiamata clienti<br>

SELECT nome, cognome FROM clienti
dammi SOLO le colonne nome e cognome dalla tabella chiamata clienti

SELECT * FROM clienti WHERE anno_nascita > 1990 AND stato ='OPEN'
dammi TUTTI i record e campi dalla tabella chiamata clienti, DOVE l'anno di nascita è maggiore di 1990 (>= sarebbe "maggiore o uguale di") E lo stato dell'ordine è aperto

SELECT * FROM clienti WHERE anno_nascita > 1990 OR stato ='OPEN'
dammi TUTTI i record e campi dalla tabella chiamata clienti, DOVE l'anno di nascita è maggiore di 1990 OPPURE lo stato dell'ordine è aperto

SELECT nome, cognome FROM clienti WHERE stato ='OPEN' ORDER BY anno_nascita DESC, cognome, nome
dammi le colonne nome e cognome dalla tabella chiamata clienti, DOVE lo stato dell'ordine è aperto ORDINANDOLI PER anno di nascita, cognome e nome in ordine DISCENDENTE
<br><br>
**INSERT** - inserisci

Esempi:<br>
INSERT INTO clienti VALUES('Pinco','Pallino',1992)
inserisci nella tabella clienti i valori Pinco(Nome), Pallino(Cognome) e 1992(anno di nascita) (NOTA: 1992 è un valore numerico, non ha bisogno di virgolette)

INSERT INTO clienti(nome,cognome) VALUES('Enrico','Giorgi')
inserisci nel database clienti, solo nelle colonne nome e cognome, i valori Pinco e Pallino

**UPDATE** - modifica

Esempi:<br>
UPDATE clienti
aggiorna la tabella clienti

UPDATE clienti SET anno_nascita = 1997
aggiorna la tabella clienti impostando il campo anno di nascita a 1997

UPDATE clienti SET anno_nascita = 1997 WHERE cognome='Arosti' AND nome='Matteo'
aggiorna la tabella clienti impostando il campo anno di nascita a 1997 DOVE il cognome è Arosti e il nome è Matteo

*REGOLONE: quando si fanno update e delete, **sempre sempre sempre** leggere la query che si fa!!!! se si fa senza where si fanno danni*

**DELETE** - cancella

Esempi:<br>
DELETE FROM clienti 
cancella TUTTO da clienti (manca il where)

DELETE FROM clienti WHERE codice_fiscale='ABCDEF01G23H45I67J'
cancella dalla tabella clienti dove il codice fiscale è ABCDEF01G23H45I67J
