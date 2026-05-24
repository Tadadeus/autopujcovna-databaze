-- Dotaz 1: Vypis vsech vozidel, ktere maji cenu za den vyssi nez 1000 korun
-- (WHERE)
SELECT spz, cena_za_den
FROM vozidlo
WHERE cena_za_den > 1000;

-- Dotaz 2: Najde vsechny zakazniky, kretych prijmeni zacina na "P"
-- (WHERE, LIKE)
SELECT jmeno, prijmeni
FROM zakaznik
WHERE prijmeni LIKE 'P%';

-- Dotaz 3: Vypise modely, kterych nazev obsahuje "o"
-- (WHERE, LIKE)
SELECT nazev, karoserie
FROM model
WHERE nazev LIKE '%o%';

-- Dotaz 4: Najde zamestnance, kterych pozice obsahuje slovo "Vedouci"
-- (WHERE, LIKE)
SELECT jmeno, prijmeni, pozice
FROM zamestnanec
WHERE pozice LIKE '%Vedouci%';

-- Dotaz 5: Vypise 3 nejdrazsi vozidla podle ceny za den
-- (ORDER BY, LIMIT, WHERE)
SELECT spz, cena_za_den
FROM vozidlo
WHERE cena_za_den > 0
ORDER BY cena_za_den DESC
LIMIT 3;

-- Dotaz 6: Vypise 5 zamestnancu s nejvyssim platem
-- (ORDER BY, LIMIT, WHERE)
SELECT jmeno, prijmeni, plat
FROM zamestnanec
WHERE plat > 0
ORDER BY plat DESC
LIMIT 5;

-- Dotaz 7: Vypise vozidla i s nazvem jejich modelu a znacky
-- (JOIN ON, WHERE)
SELECT vozidlo.spz, znacka.nazev AS znacka, model.nazev AS model
FROM vozidlo
JOIN model ON vozidlo.id_model = model.id_model
JOIN znacka ON model.id_znacka = znacka.id_znacka
WHERE vozidlo.rok_vyroby >= 2020;

-- Dotaz 8: Vypise vypujcky i se jmenem zakaznika a SPZtkou vozidla
-- (JOIN ON, WHERE)
SELECT vypujcka.id_vypujcka, zakaznik.prijmeni, vozidlo.spz, vypujcka.stav
FROM vypujcka
JOIN zakaznik ON vypujcka.id_zakaznik = zakaznik.id_zakaznik
JOIN vozidlo ON vypujcka.id_vozidlo = vozidlo.id_vozidlo
WHERE vypujcka.stav = 'ukoncena';

-- Dotaz 9: Vypise zamestnance a mesto pobocky kde pracuji
-- (JOIN ON, WHERE)
SELECT zamestnanec.prijmeni, zamestnanec.pozice, pobocka.mesto
FROM zamestnanec
JOIN pobocka ON zamestnanec.id_pobocka = pobocka.id_pobocka
WHERE pobocka.mesto = 'Praha';

-- Dotaz 10: Vypise platby vetsi nez 5000 korun a prijmeni zakaznika
-- (JOIN ON, WHERE)
SELECT zakaznik.prijmeni, platba.castka, platba.zpusob
FROM platba
JOIN vypujcka ON platba.id_vypujcka = vypujcka.id_vypujcka
JOIN zakaznik ON vypujcka.id_zakaznik = zakaznik.id_zakaznik
WHERE platba.castka > 5000;

-- Dotaz 11: Vypise vsechny vypujcky a skody i kdyz skoda nenastala
-- (LEFT JOIN, JOIN ON, WHERE)
SELECT vypujcka.id_vypujcka, vypujcka.stav, skoda.popis
FROM vypujcka
LEFT JOIN skoda ON vypujcka.id_vypujcka = skoda.id_vypujcka
WHERE vypujcka.id_vypujcka > 0;

-- Dotaz 12: Vypise vsechny pobocky a pocet vozidel ktere tam maji i kdyz nemaji zadne
-- (LEFT JOIN, GROUP BY, WHERE, AS, Funkce COUNT)
SELECT pobocka.mesto, COUNT(vozidlo.id_vozidlo) AS pocet_vozidel
FROM pobocka
LEFT JOIN vozidlo ON pobocka.id_pobocka = vozidlo.id_pobocka
WHERE pobocka.id_pobocka > 0
GROUP BY pobocka.id_pobocka, pobocka.mesto

-- Dotaz 13: Spocita prumernou cenu za den u vsech vozidel
-- (Funkce AVG, WHERE, AS)
SELECT AVG(cena_za_den) AS prumerna_cena
FROM vozidlo
WHERE cena_za_den > 0;

-- Dotaz 14: Vypise zakazniky kteri maji vice nez jednu vypujcku
-- (JOIN ON, GROUP BY, HAVING, WHERE, AS, Funkce COUNT)
SELECT zakaznik.prijmeni, COUNT(vypujcka.id_vypujcka) AS pocet_vypujcek
FROM zakaznik
JOIN vypujcka ON zakaznik.id_zakaznik = vypujcka.id_zakaznik
WHERE vypujcka.id_vypujcka > 0
GROUP BY zakaznik.prijmeni
HAVING COUNT(vypujcka.id_vypujcka) > 1;

-- Dotaz 15: Spocitej u kazde vypujcky pocet dni a celkovou cenu (vypocet).
-- (RIGHT JOIN, Vypocet, ORDER BY, GROUP BY, Funkce COUNT, WHERE, AS)
SELECT vozidlo.spz,
       vozidlo.cena_za_den * 30 AS cena_za_mesic,
       COUNT(vypujcka.id_vypujcka) AS pocet_vypujcek
FROM vypujcka
RIGHT JOIN vozidlo ON vypujcka.id_vozidlo = vozidlo.id_vozidlo
WHERE vozidlo.cena_za_den > 0
GROUP BY vozidlo.spz, vozidlo.cena_za_den
ORDER BY cena_za_mesic DESC;
