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
- výpůjčka_vozidlo
- platba
- škoda
- pobočka
- zaměstnanec

Jedna výpůjčka může obsahovat více vozidel a jedno vozidlo může být součástí více výpůjček – tento vztah M:N je vyřešen pomocí vazební tabulky `vypujcka_vozidlo`. Škoda je navázána na konkrétní vozidlo v dané výpůjčce.

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
- Evidence výpůjček (i s více vozidly)
- Sledování plateb a škod
- Propojení dat pomocí JOIN operací

---

## 🧾 Význam projektu

Školní projekt zaměřený na návrh relační databáze pro budoucí web a práci se SQL.

---

### 📌 Poznámka

README soubor jsme nechali vygenerovat AI, jelikož jsme nevěděli jak se přesně dělá + co by tam mělo být a není to povinná část projektu ;)