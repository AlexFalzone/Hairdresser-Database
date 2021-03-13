USE `mydb` ;

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`operazione_01`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`operazione_01` (`idPersonale` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`operazione_02`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`operazione_02` (`COUNT(*)` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`operazione_03`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`operazione_03` (`idPersonale` INT, `guadagni` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`operazione_04`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`operazione_04` (`COUNT(*)` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`operazione_05`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`operazione_05` (`COUNT(*)` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`operazione_06`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`operazione_06` (`COUNT(*)` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`operazione_07`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`operazione_07` (`data` INT, `guadagno` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`operazione_08`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`operazione_08` (`COUNT(n.personale_idPersonale)` INT);

-- -----------------------------------------------------
-- View `mydb`.`operazione_01`
-- Trovare i lavoratori che hanno ‘colore’ come specialità
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`operazione_01`;
USE `mydb`;
CREATE  OR REPLACE VIEW operazione_01 AS
    SELECT DISTINCT
        p.idPersonale
    FROM
        personale p
    WHERE
        p.specialità = 'colore';

-- -----------------------------------------------------
-- View `mydb`.`operazione_02`
-- Trovare quante volte è stato ordinato il prodotto ‘05’ da parte delle filiali
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`operazione_02`;
USE `mydb`;
CREATE  OR REPLACE VIEW operazione_02 AS
    SELECT 
        COUNT(*)
    FROM
        prodotti_has_negozio pn
    WHERE
        pn.prodotti_idProdotto = 05;

-- -----------------------------------------------------
-- View `mydb`.`operazione_03`
-- Trovare il personale che ha guadagnato più di 70 
-- nel mese di febbraio 2021
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`operazione_03`;
USE `mydb`;
CREATE  OR REPLACE VIEW operazione_03 AS
    SELECT 
        p.idPersonale, SUM(t.prezzo) AS guadagni
    FROM
        trattamento t
            JOIN
        clienti_has_trattamento pt ON t.idTrattamento = pt.trattamento_idTrattamento
            JOIN
        personale p ON p.idPersonale = t.personale_idPersonale
    WHERE
        (pt.data >= '01/02/2021')
            AND (pt.data <= '28/02/2021')
    GROUP BY p.idPersonale
    HAVING guadagni >= 100
    ORDER BY guadagni ASC;

    -- -----------------------------------------------------
-- View `mydb`.`operazione_04`
-- Contare quanti clienti, che si chiamano ‘Alessio’, 
-- hanno prenotato un trattamento per il 20/02/2021
-- -----------------------------------------------------

DROP TABLE IF EXISTS `mydb`.`operazione_04`;
USE `mydb`;
CREATE  OR REPLACE VIEW operazione_03 AS
SELECT 
    count(*)
FROM 
    clienti c 
        JOIN 
    clienti_has_trattamento pt ON c.idCliente = pt.clienti_idCliente
WHERE 
    c.nome like 'Alessio%' 
        AND 
    pt.data = '20/02/2021'

-- -----------------------------------------------------
-- View `mydb`.`operazione_05`
-- Trovare quante lezioni si sono svolte nel 2020
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`operazione_05`;
USE `mydb`;
CREATE  OR REPLACE VIEW operazione_05
AS
SELECT COUNT(*)
FROM lezione l
WHERE ( (l.giorno >= '01/01/2020') AND (l.giorno <= '31/12/2020') );

-- -----------------------------------------------------
-- View `mydb`.`operazione_06`
-- Contare quanti clienti nel 2019 hanno avuto un 
-- trattamento da tutto il personale
-- -----------------------------------------------------

CREATE VIEW trattamento_all_personale
AS
SELECT COUNT(*)
FROM clienti c
WHERE NOT EXISTS (  SELECT *
                    FROM personale p
                    WHERE NOT EXISTS (  SELECT *
                                        FROM clienti_has_trattamento pt JOIN trattamento t ON t.idTrattamento = pt.trattamento_idTrattamento
                                        WHERE ( (pt.data >= '01/01/2019') AND (pt.data <= '31/12/2019') 
                                                AND
                                               (pt.clienti_idCliente = c.idCliente)
                                                AND
                                               (P.idPersonale = t.personale_idPersonale)
                                            )   
                                    )
                );

-- -----------------------------------------------------
-- View `mydb`.`operazione_07`
-- Trovare la giornata in cui si è guadagnato di più, nel 2020
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`operazione_07`;
USE `mydb`;
CREATE  OR REPLACE VIEW operazione_07
AS
SELECT pt.data, sum(t.prezzo) as guadagno
FROM clienti_has_trattamento pt JOIN trattamento t ON t.idTrattamento = pt.trattamento_idTrattamento
WHERE ( (pt.data >= '01/01/2020') AND (pt.data <= '31/12/2020') )
GROUP BY pt.data
HAVING guadagno >= all( SELECT sum(t.prezzo) as guadagno
                        FROM clienti_has_trattamento pt JOIN trattamento t ON t.idTrattamento = pt.trattamento_idTrattamento
                        WHERE ( (pt.data >= '01/01/2020') AND (pt.data <= '31/12/2020') )
                        GROUP BY pt.data 
                    );

-- -----------------------------------------------------
-- View `mydb`.`operazione_08`
-- Trovare il lavoratore che è presente nella filiale padre
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`operazione_08`;
USE `mydb`;
CREATE  OR REPLACE VIEW operazione_08
AS
SELECT COUNT(n.personale_idPersonale)
FROM negozio n
WHERE n.idNegozio = 00 ;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;