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
| Tabulka | Účel a důležité údaje |
| ------- | --------------------- |
| `teams` | Informace o závodních týmech, jejich jméno, země původu, šéf týmu, počet pohárů konstruktérů a příznak aktuální aktivity (`is_active`). |
| `drivers` | Závodní jezdci, jejich jméno, příjmení, startovní číslo, datum narození, národnost, počet titulů a příznak, zda stále aktivně závodí (`is_active`). |
| `formulas` | Konkrétní modely monopostů nasazené týmy v dané sezóně a jejich dodavatelé motorů. |
| `circuits` | Fyzické závodní okruhy, jejich název, stát, ve kterém se nacházejí, a délka tratě v kilometrech. |
| `races` | Konkrétní vypsané závody konané na okruzích, jejich název, ročník sezóny a přesné datum konání. |
| `race_results` | Výsledek jezdce v konkrétním závodě, startovní a cílová pozice, čas a příznak klasifikace v cíli (`is_classified`). Jedinečná kombinace závodu a jezdce brání duplicitnímu uložení výsledku. |
| `pit_stops` | Detailní informace o zastávkách v boxech, číslo kola, typ obutých pneumatik (`tire_type`) a celková délka zastávky v sekundách. |

## ER diagram
Teams (1) – (N) Drivers\
Teams (1) – (N) Formulas\
Circuits (1) – (N) Races\
Races (1) – (N) RaceResults\
Drivers (1) – (N) RaceResults\
Races (1) – (N) PitStops\
Drivers (1) – (N) PitStops\
Drivers (M) – (N) Races přes RaceResults\
Drivers (M) – (N) Races přes PitStops\

<img width="658" height="605" alt="image" src="https://github.com/user-attachments/assets/95a9535f-b5fb-4a4b-8607-3ee603c19671" />



## ukázková data a dotaz
1. Analýza spolehlivosti týmů a efektivity zastávek v boxech
2. součet získaných bodů a odstaveným monopostů pro jednotlivé týmy





