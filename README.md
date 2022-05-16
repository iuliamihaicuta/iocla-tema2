**Nume: Mihaicuta Iulia**
**Grupa 314CA**

## Tema 2 - IOCLA

### Task 1 - Simple cipher

* aplicam operatia de modulo numarului de deplasari pentru a
    eficientiza operatia

* copiem in registrul in care vom salva sirul criptat (edi)
    sirul initial

* construim o bucla in care producem n deplasari literii; la
    fiecare iteratie verificam daca am ajuns la sfarsitul
    alfabetului; efectuam operatia de deplasare



### Task 2 - Points

* point-distance: calculeaza distanta intre 2 puncte;
    deoarece punctele au aceeasi abcisa sau aceeasi ordonata,
    modulul sumei diferentelor lor reprezinta distanta

* road: calculeaza distanta dintre 2 puncte alaturate; apelam
    functia point-distance - dupa fiecare apelare ne mutam
    in alta parte a memoriei

* is_square: verifica daca distanta este patrat perfect; setam
    vectorul valorilor initial cu 0; comparam valoarea
    distantei cu patrate ale numerelor naturale


### Task 3 - Beaufort Encryption

* parcurgem textul initial si cheia simultan, folosind operatia
    modulo pentru a sincroniza cele 2 siruri

* prin scaderea celor 2 coduri ascii ale literelor aflam numarul
    de deplasari ce trebuiesc efectuate; daca acesta este negativ,
    adaugam numarul de litere pentru a afla numarul de deplasari

* adaugam 65 pentru a ajunge la codul ascii ale literelor

* repetam pentru fiecare litera

### Task 4 - Spiral Encryption

* avem n / 2 parcurgeri ale marginilor matricei

* la deplasarea spre dreapta iteram cu 4 prin ecx, la coborare
    crestem valoarea lui ecx cu 4 * n la fiecare pas; la
    deplasarea spre stanga scadem valoarea cu 4 iar la urcare
    scadem catre 4 * n din ecx

* numarul de deplasari in fiecare caz este caluculat in functie de
    iteratia la care am ajuns (eax) astfel:
```
-> n - 2 * eax (la dreapta)
-> n - 2 * eax - 1 (jos)
-> n - 2 * eax - 1 (la stanga)
-> n - 2 * eax - 2 (sus)
```