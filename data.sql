SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';
SET @old_autocommit=@@autocommit;

USE mydb;

SET AUTOCOMMIT=0;
INSERT INTO clienti VALUES(1, Giuseppe, Pietro),
(2, 'Fillippo', 'Di Dio'),
(3, 'Alessio', 'Cicciani'),
(4, 'Jessica', 'Stigliani'),
(5, 'Alessio', 'Cosacco'),
(6, 'Angelo', 'Wray'),
(7, 'John', 'Wick'),
(8, 'Alessio', 'Wick'),
(9, 'Gigi', 'dag'),
(10, 'Marshall', 'Mathers'),
(11, 'Alessio', 'Siracusa'),
(12, 'Giuseppe', 'Fasciana'),
(12, 'Alessio', 'Johansson'),
(13, 'Andrea', 'Bellomo'),
(14, 'Giuseppe', 'Bellomo'),
(15, 'Salvatore', 'Bellomo'),
(16, 'Alessio', 'Bellomo'),
COMMIT;

SET AUTOCOMMIT=0;
INSERT INTO trattamento VALUES(1, 15, 15, 'taglio', ),
(2, 10, 'colore', 2),
(3, 5, 'barba', 5)
(4, 5, 'Shampoo', 10),
(5, 20, 'Mesh', 4),
(6, 50, 'trattamento maschera', 7),
(7, 120, 'degradè', 1),
(8, 40, 'Depilazione', 3),
COMMIT;

SET AUTOCOMMIT=0;
INSERT INTO personale VALUES(1, 'colore'),
(2, 'taglio', 1),
(3, 'depilazione', 2),
(4, 'taglio',1),
(5, 'mesh',2),
(6, 'barba',1),
(7, 'shampoo',2),
(8, 'shampoo',1),
(9, 'trattamento maschera',2),
(10, 'colore',1),
COMMIT;

SET AUTOCOMMIT=0;
INSERT INTO clienti_has_trattamento VALUES(2,6,'05/02/2020'),
(5,1,'03/02/2020'),
(10,10,'03/02/2020'),
(4,10,'25/02/2020'),
(16,8,'09/01/2020'),
(2,9,'01/03/2020'),
(6,7,'29/01/2020'),
(13,4,'08/02/2020'),
(15,3,'07/01/2020'),
(4,7,'23/02/2020'),
(4,1,'23/02/2020'),
(3,7,'08/02/2020'),
(1,1,'07/01/2020'),
(16,8,'07/01/2020'),
(12,1,'02/02/2020'),
(13,6,'25/03/2020'),
COMMIT;

SET AUTOCOMMIT=0;
INSERT INTO clienti_has_prodotti VALUES(1,7),
(16,5),
(7,7),
(5,1),
(16,6),
(10,5),
(12,5),
(5,5),
(14,3),
(15,5),
COMMIT;

SET AUTOCOMMIT=0;
INSERT INTO prodotti_has_negozio VALUES(1,2),
(1,3),
(2,1);
(2,5),
(1,5),
(2,7),
(1,4),
(2,1),
COMMIT;

SET AUTOCOMMIT=0;
INSERT INTO prodotti VALUES(0),
(1),
(2),
(3),
(4),
(5),
(6),
(7),
COMMIT;

SET AUTOCOMMIT=0;
INSERT INTO negozio VALUES(1, '08-13', 93100),
(2, '08-13', 93100),
COMMIT;

SET AUTOCOMMIT=0;
INSERT INTO negozio_has_trattamento VALUES(1,2),
(1,3),
(2,7),
(2,3),
(1,7),
(2, 4),
(1, 5),
COMMIT;

SET AUTOCOMMIT=0;
INSERT INTO corsi_has_negozio VALUES(1,2),
(2,2),
COMMIT;

SET AUTOCOMMIT=0;
INSERT INTO corsi VALUES(1,'Tagliare al meglio', 1),
(2, 'Miglior colore', 1),
COMMIT;

SET AUTOCOMMIT=0;
INSERT INTO lezione_has_corsi VALUES('08-10', '23/02/2020', 'via andrea doria', 1),
('08-13', '06/03/2020', 'via andrea doria', 1),
('08-13', '06/03/2020', 'via andrea doria', 2),
('10-13', '03/01/2020', 'via andrea doria', 2),
COMMIT;

SET AUTOCOMMIT=0;
INSERT INTO lezione VALUES('08-10', '23/02/2020', 'via andrea doria'),
('08-13', '06/03/2020', 'via andrea doria'),
('10-13', '03/01/2020', 'via andrea doria'),
COMMIT;