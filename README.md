# f1_project
## Databázový model pro evidenci závodů, týmů, jezdců a podrobných výsledků Formule 1

1. cíl je vyřešit problém s nepřehledným sledováním obrovského množství historických i aktuálních dat ze závodů Formule 1.
2. Systém by měl vzniknout, aby poskytl centralizovaný nástroj pro rychlé porovnávání statistik a technických dat
3. Konkrétním přínosem bude zrychlení přístupu k datům a možnost okamžitě analyzovat strategie zastávek v boxech nebo typ nasazených pneumatik 
4. Tato databáze bude sloužit především fanouškům motorsportu, sportovním novinářům nebo analytikům dat
5. Systém bude uchovávat detailní informace o jednotlivých jezdcích, týmech a technických specifikacích monopostů.
6. Dále bude ukládat komplexní data o celých závodních víkendech, parametrech jednotlivých okruhů a konečném pořadí velkých cen.
7. Uživatelům databáze umožní snadno filtrovat výsledky podle konkrétních sezón, týmů, národností nebo tratí
8. Systém uživatelům také umožní porovnávat výkonnost jezdců a přehledy úspěšnosti jezdců na konkrétních tratích.
9. Další klíčovou funkcí bude možnost přehledně sledovat vývoj celkového bodového zisku v poháru jezdců i konstruktérů v průběhu celého roku.
10. databáze bude  pro ucelené dotazování daty ze světa Formule 1 na jednom místě.

## popis tabulek

## ER diagram
Teams (1) – (N) Drivers
Teams (1) – (N) Formulas
Circuits (1) – (N) Races
Races (1) – (N) RaceResults
Drivers (1) – (N) RaceResults
Races (1) – (N) PitStops
Drivers (1) – (N) PitStops
Drivers (M) – (N) Races přes RaceResults
Drivers (M) – (N) Races přes PitStops

<img width="658" height="605" alt="image" src="https://github.com/user-attachments/assets/95a9535f-b5fb-4a4b-8607-3ee603c19671" />



## ukázková data a dotaz





