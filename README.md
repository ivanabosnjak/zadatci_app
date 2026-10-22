# zadatci_app

## Podaci o projektu

- **Ime:** Ivana Bosnjak
- **Operacijski sustav:** Windows 11
- **Verzija Fluttera:** Flutter 3.47.7
- **Verzija Darta:** Dart 3.13.5
- **Korišteni uređaj:** 2210129SG (mobile) • 23ca3a6b • android-arm64 • Android 15 (API 35)

## Provjera razumijevanja 1

Polja modela nisu promjenjiva jer su final.

Da u JSON-u polje naslov nedostaje (as String na vrijednosti null), dogodilo bi se:

```
Unhandled exception:
type 'Null' is not a subtype of type 'String' in type cast
```

## Provjera razumijevanja 2

Kad iznimku iz Futurea ne uhvatimo ni na jednom mjestu dogadja se:

```
Unhandled exception:
TimeoutException after 0:00:00.300000: Future not completed
```

## Provjera razumijevanja 3

Future se stvara u polju, a ne u build jer build se poziva svaki put kad se widget ponovno iscrtava. Kad bi se Future stvarao u build, svaki bi build pokrenuo novi dohvat.

Tri stanja koja svaki zaslon s podacima mora prikazati: Ucitavanje, error i stvarni podaci.

##  Provedene izmjene

Dodala u model polje String? opis.

U repozitorij_provjera.dart dohvat pozovala s Future.wait dvaput istovremeno i izmjerila
vrijeme pomoću Stopwatch. Dohvat omotala s .timeout(Duration(milliseconds: 300)) i uhvatila TimeoutException. Ispisala
poruku Isteklo vrijeme.

Promijenila poruku pogreške u "Dogodila se greska".
Dodala ispod popisa tekst koji prikazuje broj završenih zadataka.
Omotala ListView u RefreshIndicator tako da povlačenje prema dolje 
ponovno dohvaća podatke.