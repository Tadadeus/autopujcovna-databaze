# 🚗 Autopůjčovna – databázový projekt

Tento projekt představuje relační databázi pro systém autopůjčovny. Cílem je navrhnout a implementovat databázi, která umožňuje správu vozidel, zákazníků, poboček, zaměstnanců, výpůjček a souvisejících plateb a škod.

---

## 📦 Co projekt obsahuje

- Návrh databáze (ER diagram)
- SQL skript pro vytvoření tabulek (`create.sql`)
- SQL skript s ukázkovými daty (`insert.sql`)
- SQL dotazy nad databází (`queries.sql`)

---

## 🧠 Struktura databáze

Databáze obsahuje následující entity:

- značka
- model
- vozidlo
- zákazník
- výpůjčka
- platba
- škoda
- pobočka
- zaměstnanec

Tyto entity jsou propojeny pomocí cizích klíčů a tvoří relační databázový model splňující normalizační pravidla.

---

## ⚙️ Použití

1. Spusť `create.sql` pro vytvoření struktury databáze
2. Spusť `insert.sql` pro naplnění ukázkovými daty
3. Spusť `queries.sql` pro testovací dotazy

---

## 📊 Funkce projektu

- Správa vozidel a jejich modelů
- Evidence zákazníků
- Evidence výpůjček
- Sledování plateb a škod
- Propojení dat pomocí JOIN operací

---

## 🧾 Význam projektu

Školní projekt zaměřený na návrh relační databáze pro budoucí web a práci se SQL.

---

### 📌 Poznámka

README soubor jsme nechali vygenerovat AI, jelikož jsme nevěděli jak se přesně dělá + co by tam mělo být a není to povinná část projektu ;)