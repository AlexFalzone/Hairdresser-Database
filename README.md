# **Hairdresser Database**

by Alex Falzone

**Indice:**

1. **Progettazione Concettuale**
  1. **Descrizione**
  2. **Glossario dei termini**
  3. **Tavola delle operazioni e dei volumi**
  4. **Metodo Inside-Out**
2. **Progettazione Logica**
  1. **Ristrutturazione**
  2. **Modello Logico**
3. **Progettazione Fisica**
  1. **Creazione TABLE**
  2. **Creazione VIEW**
  3. **CREAZIONE TRIGGER**

**1.1 Descrizione:**

Si vuole implementare un database di controllo per un parrucchiere. Il cliente è registrato nel database tramite un ID, fornito dal database stesso. Ci possono essere varie filiali, contrassegnate da un id\_filiale, che confluiscono tutte in un negozio padre. Ogni filiale ha un 'capo' che è un lavoratore anch'esso. I clienti vengono identificati da nome, cognome e id\_cliente. Inoltre, è possibile per i clienti la prenotazione sia di un appuntamento per vari trattamenti sia di determinati prodotti. Sono presenti, dei corsi specializzanti (con relativo titolo e id\_corso) esclusivi per il personale delle filiali, svolti dal personale della filiale padre.

**1.1 Glossario dei termini:**

| **Termine** | **Descrizione** | **Attributi** | **Collegamenti** |
| --- | --- | --- | --- |
| Cliente | Colui che necessita di un trattamento | Id, nome, cognome | Trattamento, Prodotti |
| Trattamento | Operazione cutanea e non sul cliente | Id, durata, prezzo, descrizione | Personale, Cliente, Negozio |
| Personale | Colui che è addetto ai trattamenti | Id, specialità | Trattamento, Negozio |
| Prodotti | Prodotti utili per i vari trattamenti | Id | Cliente, Negozio |
| Negozio | Esso ha un negozio padre e n-negozi figli | Id, orari, località | Trattamento, Personale, Prodotti |
| Corsi |
 | Id, titolo | Lezione, Negozio, Personale |
| Lezione |
 | Orario, luogo, giorno | Corsi, Negozio |

**1.3 Tavola delle operazioni e dei volumi:**

| **Operazione** | **Descrizione** | **Frequenza (volte/giorno)** | **Tipo** |
| --- | --- | --- | --- |
| 01 | Trovare i lavoratori che hanno 'colore' come specialità | 2 | I |
| 02 | Trovare quante volte è stato ordinato il prodotto '05' da parte delle filiali | 10 | I |
| 03 | Trovare il personale che ha guadagnato più di 70 nel mese di febbraio 2021 | 50 | I |
| 04 | Contare quanti clienti, che si chiamano 'Alessio', hanno prenotato un trattamento per il 20/02/2021 | 10 | I |
| 05 | Trovare quante lezioni si sono svolte nel 2020 | 30 | I |
| 06 | Contare quanti clienti nel 2019 hanno avuto un trattamento da tutto il personale | 25 | I |
| 07 | Trovare la giornata in cui si è guadagnato di più, nel 2020 | 50 | I |
| 08 | Trovare quanto personale è presente nella filiale padre | 5 | I |

| **Concetto** | **Tipo** | **Volume** |
| --- | --- | --- |
| Cliente | E | 150 |
| Trattamento | E | 500 |
| Personale | E | 100 |
| Negozio | E | 250 |
| Prodotti | E | 250 |
| Corsi | E | 50 |
| Lezione | E | 100 |
| Prenotazione Trattamento | R | 650 |
| Ordinazione prodotti cliente | R | 400 |
| Ordinazione prodotti negozio | R | 500 |
| Svolgimento Trattamento | R | 750 |
| Svolgimento trattamento personale | R | 600 |
| Negozio-Personale | R | 350 |
| Docenza | R | 300 |
| Partecipazione | R | 300 |
| Composizione | R | 150 |

**1.4 Metodo Inside-Out**

Nella strategia Inside-Out si procede a "macchia d'olio". Si rappresentano prima i concetti in relazione con i concetti iniziali, per poi muoversi verso quelli piu' lontani.

- Un cliente può prenotare diversi trattamenti.

![Immagine 5](RackMultipart20230312-1-ytvtbp_html_f976c8eb9b812667.gif)

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

Le filiali si dividono in 'filiale padre' e 'filiali figlie'. Infatti, si viene a creare una gerarchia totale, perché non ci saranno altri negozi al di fuori del padre e dei figli.

![Immagine 16](RackMultipart20230312-1-ytvtbp_html_34c84d8a239eff59.gif) \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

- Un cliente può ordinare dei prodotti.
- Un negozio può ordinare dei prodotti.

![Immagine 17](RackMultipart20230312-1-ytvtbp_html_e0579203f95387a0.gif)

È possibile creare dei corsi svolti esclusivamente dal personale della filiale padre e rivolti esclusivamente al personale delle filiali figlie.

![Immagine 18](RackMultipart20230312-1-ytvtbp_html_f1cd450f2b89142d.gif)

- I vari trattamenti possono essere svolti da personale diverso.
- Vario personale padre può tenere i corsi

![](RackMultipart20230312-1-ytvtbp_html_e150265cfe4ba2e4.png)

**2.1 Ristrutturazione:**

Nella ristrutturazione eliminiamo la gerarchia e aggiungiamo come attributi di 'personale' la voce 'specialità'. E infine aggiungiamo le varie cardinalità.

![Immagine 22](RackMultipart20230312-1-ytvtbp_html_ce73824825ac497c.gif)

**2.2 Modello Logico:**

CLIENTI (idClienti, nome, cognome)

Trattamento (idTrattamento, durata, prezzo, descrizione, idPersonale)

Prenotazione Trattamento (idCliente, idTrattamento, data)

Prodotti (idProdotto)

Ordinazione prodotti clienti (idProdotto, idCliente)

Negozio (idNegozio, orari, località, idPersonale, qtaDisp\_prodotti)

Ordinazione prodotti negozio (idNegozio, idProdotto)

Svolgimento trattamento (idTrattamento, idNegozio)

Corsi (idNegozio, idCorso, titolo)

Partecipazione corsi (idNegozio, idCorso)

Lezione (orario, luogo, giorno)

Composizione (idCorso, orario, luogo, giorno)

Personale (idPersonale, specialità)

Leggenda:

………… chiavi esterne

\_\_\_\_\_ chiavi primarie
