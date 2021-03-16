CREATE TRIGGER 'aggiornamento credenziali cliente'
AFTER UPDATE ON 'clienti'
FOR EACH ROW
BEGIN
    IF (new.nome IS NOT NULL) THEN
		UPDATE clienti
        SET nome = new.nome;
	END IF;
END


CREATE TRIGGER 'aggiornamento credenziali trattamento'
AFTER UPDATE ON 'trattamento'
FOR EACH ROW
BEGIN
    IF (new.descrizione IS NOT NULL) THEN
		UPDATE trattamento
        SET descrizione = new.descrizione;
	END IF;
END


CREATE TRIGGER 'aggiornamento prenotazione trattamento'
AFTER UPDATE ON 'trattamento'
FOR EACH ROW
BEGIN
	IF (new.data IS NOT NULL) THEN
		INSERT INTO clienti_has_trattamento(clienti_idCliente, trattamento_idTrattamento, data)
        VALUES(old.clienti_idCliente, old.trattamento_idTrattamento, new.data);
	END IF;
END