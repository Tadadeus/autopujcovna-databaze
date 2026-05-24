-- Insert dat 

INSERT INTO znacka (nazev, zeme_puvodu, rok_zalozeni) VALUES
('Skoda', 'Cesko', 1895),
('Volkswagen', 'Nemecko', 1937),
('Toyota', 'Japonsko', 1937),
('BMW', 'Nemecko', 1916),
('Ford', 'USA', 1903),
('Renault', 'Francie', 1899),
('Hyundai', 'Korea', 1967),
('Audi', 'Nemecko', 1909);

INSERT INTO model (id_znacka, nazev, karoserie, pocet_mist, palivo) VALUES
(1, 'Octavia', 'kombi', 5, 'benzin'),
(1, 'Fabia', 'hatchback', 5, 'benzin'),
(2, 'Golf', 'hatchback', 5, 'nafta'),
(3, 'Corolla', 'sedan', 5, 'hybrid'),
(4, 'Rada 3', 'sedan', 5, 'nafta'),
(5, 'Focus', 'kombi', 5, 'benzin'),
(6, 'Clio', 'hatchback', 5, 'benzin'),
(7, 'Tucson', 'SUV', 5, 'hybrid');

INSERT INTO pobocka (nazev, mesto, adresa, telefon) VALUES
('Pobocka Centrum', 'Praha', 'Vaclavske namesti 12', '+420211111111'),
('Pobocka Sever', 'Praha', 'Kobyliske namesti 5', '+420222222222'),
('Pobocka Brno', 'Brno', 'Ceska 8', '+420533333333'),
('Pobocka Ostrava', 'Ostrava', 'Nadrazni 22', '+420555444444'),
('Pobocka Plzen', 'Plzen', 'Americka 17', '+420377555555'),
('Pobocka Liberec', 'Liberec', 'Prazska 3', '+420485666666'),
('Pobocka Olomouc', 'Olomouc', 'Horni namesti 9', '+420585777777'),
('Pobocka Usti', 'Usti nad Labem', 'Mirove namesti 1', '+420475888888');

INSERT INTO zamestnanec (id_pobocka, jmeno, prijmeni, pozice, plat) VALUES
(1, 'Petr', 'Novak', 'Vedouci', 52000.00),
(1, 'Jana', 'Svobodova', 'Operator', 34000.00),
(2, 'Martin', 'Dvorak', 'Vedouci', 50000.00),
(3, 'Lucie', 'Cerna', 'Operator', 33000.00),
(3, 'Tomas', 'Prochazka', 'Mechanik', 38000.00),
(4, 'Eva', 'Kralova', 'Operator', 32000.00),
(5, 'Jan', 'Vesely', 'Vedouci', 49000.00),
(6, 'Marie', 'Horakova', 'Operator', 31000.00);

INSERT INTO vozidlo (id_model, id_pobocka, spz, rok_vyroby, najezd_km, cena_za_den) VALUES
(1, 1, '1AB2345', 2021, 45000, 1200.00),
(2, 1, '2CD3456', 2022, 30000, 900.00),
(3, 2, '3EF4567', 2020, 60000, 1100.00),
(4, 3, '4GH5678', 2023, 15000, 1500.00),
(5, 3, '5IJ6789', 2019, 90000, 1800.00),
(6, 4, '6KL7890', 2021, 50000, 1000.00),
(7, 5, '7MN8901', 2022, 25000, 950.00),
(8, 6, '8OP9012', 2023, 10000, 2000.00);

INSERT INTO zakaznik (jmeno, prijmeni, email, telefon, cislo_ridicaku) VALUES
('Karel', 'Mly', 'karel.mly@email.cz', '+420601111111', 'CR1234567'),
('Anna', 'Sykorova', 'anna.sykorova@email.cz', '+420602222222', 'CR2345678'),
('Josef', 'Marek', 'josef.marek@email.cz', '+420603333333', 'CR3456789'),
('Veronika', 'Pokorna', 'veronika.pokorna@email.cz', '+420604444444', 'CR4567890'),
('David', 'Benes', 'david.benes@email.cz', '+420605555555', 'CR5678901'),
('Tereza', 'Fialova', 'tereza.fialova@email.cz', '+420606666666', 'CR6789012'),
('Michal', 'Kucera', 'michal.kucera@email.cz', '+420607777777', 'CR7890123'),
('Petra', 'Ruzickova', 'petra.ruzickova@email.cz', '+420608888888', 'CR8901234');

INSERT INTO vypujcka (id_zakaznik, id_vozidlo, id_zamestnanec, datum_od, datum_do, stav) VALUES
(1, 1, 1, '2025-01-10', '2025-01-15', 'ukoncena'),
(2, 3, 3, '2025-02-01', '2025-02-05', 'ukoncena'),
(3, 4, 4, '2025-03-12', '2025-03-20', 'ukoncena'),
(4, 5, 5, '2025-03-15', '2025-03-18', 'ukoncena'),
(5, 2, 2, '2025-04-01', '2025-04-03', 'aktivni'),
(6, 6, 6, '2025-04-05', '2025-04-10', 'aktivni'),
(7, 7, 7, '2025-04-08', '2025-04-12', 'aktivni'),
(8, 8, 8, '2025-04-10', '2025-04-20', 'rezervovana');

INSERT INTO platba (id_vypujcka, castka, datum_platby, zpusob) VALUES
(1, 6000.00, '2025-01-10', 'karta'),
(2, 4400.00, '2025-02-01', 'hotovost'),
(3, 12000.00, '2025-03-12', 'karta'),
(4, 5400.00, '2025-03-15', 'prevod'),
(5, 1800.00, '2025-04-01', 'karta'),
(6, 5000.00, '2025-04-05', 'hotovost'),
(7, 3800.00, '2025-04-08', 'karta'),
(8, 20000.00, '2025-04-10', 'prevod');

INSERT INTO skoda (id_vypujcka, poradi, popis, cena_opravy, datum_zjisteni) VALUES
(1, 1, 'Skrabanec na zadnim narazniku', 2500.00, '2025-01-15'),
(2, 1, 'Prasklé celni sklo', 8000.00, '2025-02-05'),
(3, 1, 'Poskozene levé zrcatko', 3200.00, '2025-03-20'),
(3, 2, 'Promacknute dvere ridice', 6500.00, '2025-03-20'),
(4, 1, 'Sjete pneumatiky', 4800.00, '2025-03-18'),
(5, 1, 'Skvrna na sedacce', 1200.00, '2025-04-03'),
(6, 1, 'Odrene disky kol', 2000.00, '2025-04-10');