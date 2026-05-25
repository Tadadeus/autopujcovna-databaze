-- Vytvoreni tabulek 

DROP TABLE IF EXISTS skoda;
DROP TABLE IF EXISTS platba;
DROP TABLE IF EXISTS vypujcka_vozidlo;
DROP TABLE IF EXISTS vypujcka;
DROP TABLE IF EXISTS vozidlo;
DROP TABLE IF EXISTS model;
DROP TABLE IF EXISTS znacka;
DROP TABLE IF EXISTS pobocka;
DROP TABLE IF EXISTS zamestnanec;
DROP TABLE IF EXISTS zakaznik;

CREATE TABLE znacka (
    id_znacka       INT             NOT NULL AUTO_INCREMENT,
    nazev           VARCHAR(50)     NOT NULL,
    zeme_puvodu     VARCHAR(50)     NOT NULL,
    rok_zalozeni    INT             NULL,
    PRIMARY KEY (id_znacka)
);

CREATE TABLE model (
    id_model        INT             NOT NULL AUTO_INCREMENT,
    id_znacka       INT             NOT NULL,
    nazev           VARCHAR(50)     NOT NULL,
    karoserie       VARCHAR(30)     NOT NULL,
    pocet_mist      INT             NOT NULL,
    palivo          VARCHAR(20)     NOT NULL,
    PRIMARY KEY (id_model),
    FOREIGN KEY (id_znacka)
        REFERENCES znacka(id_znacka)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE pobocka (
    id_pobocka      INT             NOT NULL AUTO_INCREMENT,
    nazev           VARCHAR(50)     NOT NULL,
    mesto           VARCHAR(50)     NOT NULL,
    adresa          VARCHAR(100)    NOT NULL,
    telefon         VARCHAR(20)     NOT NULL,
    PRIMARY KEY (id_pobocka)
);

CREATE TABLE zamestnanec (
    id_zamestnanec  INT             NOT NULL AUTO_INCREMENT,
    id_pobocka      INT             NOT NULL,
    jmeno           VARCHAR(50)     NOT NULL,
    prijmeni        VARCHAR(50)     NOT NULL,
    pozice          VARCHAR(50)     NOT NULL,
    plat            DECIMAL(10,2)   NOT NULL,
    PRIMARY KEY (id_zamestnanec),
    FOREIGN KEY (id_pobocka)
        REFERENCES pobocka(id_pobocka)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE vozidlo (
    id_vozidlo      INT             NOT NULL AUTO_INCREMENT,
    id_model        INT             NOT NULL,
    id_pobocka      INT             NOT NULL,
    spz             VARCHAR(10)     NOT NULL,
    rok_vyroby      INT             NOT NULL,
    najezd_km       INT             NOT NULL,
    cena_za_den     DECIMAL(10,2)   NOT NULL,
    PRIMARY KEY (id_vozidlo),
    FOREIGN KEY (id_model)
        REFERENCES model(id_model)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (id_pobocka)
        REFERENCES pobocka(id_pobocka)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE zakaznik (
    id_zakaznik     INT             NOT NULL AUTO_INCREMENT,
    jmeno           VARCHAR(50)     NOT NULL,
    prijmeni        VARCHAR(50)     NOT NULL,
    email           VARCHAR(100)    NOT NULL UNIQUE,
    telefon         VARCHAR(20)     NOT NULL UNIQUE,
    cislo_ridicaku  VARCHAR(20)     NOT NULL UNIQUE,
    PRIMARY KEY (id_zakaznik)
);

CREATE TABLE vypujcka (
    id_vypujcka     INT             NOT NULL AUTO_INCREMENT,
    id_zakaznik     INT             NOT NULL,
    id_zamestnanec  INT             NOT NULL,
    datum_od        DATE            NOT NULL,
    datum_do        DATE            NOT NULL,
    stav            VARCHAR(20)     NOT NULL,
    PRIMARY KEY (id_vypujcka),
    FOREIGN KEY (id_zakaznik)
        REFERENCES zakaznik(id_zakaznik)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (id_zamestnanec)
        REFERENCES zamestnanec(id_zamestnanec)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE vypujcka_vozidlo (
    id_polozka      INT             NOT NULL AUTO_INCREMENT,
    id_vypujcka     INT             NOT NULL,
    id_vozidlo      INT             NOT NULL,
    cena_za_den     DECIMAL(10,2)   NOT NULL,
    PRIMARY KEY (id_polozka),
    UNIQUE (id_vypujcka, id_vozidlo),
    FOREIGN KEY (id_vypujcka)
        REFERENCES vypujcka(id_vypujcka)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_vozidlo)
        REFERENCES vozidlo(id_vozidlo)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE platba (
    id_platba       INT             NOT NULL AUTO_INCREMENT,
    id_vypujcka     INT             NOT NULL,
    castka          DECIMAL(10,2)   NOT NULL,
    datum_platby    DATE            NOT NULL,
    zpusob          VARCHAR(30)     NOT NULL,
    PRIMARY KEY (id_platba),
    FOREIGN KEY (id_vypujcka)
        REFERENCES vypujcka(id_vypujcka)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE skoda (
    id_polozka      INT             NOT NULL,
    poradi          INT             NOT NULL,
    popis           VARCHAR(200)    NOT NULL,
    cena_opravy     DECIMAL(10,2)   NOT NULL,
    datum_zjisteni  DATE            NOT NULL,
    PRIMARY KEY (id_polozka, poradi),
    FOREIGN KEY (id_polozka)
        REFERENCES vypujcka_vozidlo(id_polozka)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);