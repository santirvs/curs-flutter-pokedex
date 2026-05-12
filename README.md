# MyApp - Curs de Flutter

## 07/05
 - Fork del repositori del dia 4.
 - Genero la estructura de MyApp
 - Adapto Splash i accedeixo a MyMapScreen

## 08/05
 - Personalització de l'Splash
 - Descàrrega d'icones i fonts de Clash of Clans
 - Creació de la pantalla de llista
 - Creació del model de dades Troop i TroopRepository que retorna una llista fixa de tropes

## 09/05
 - Personalització del form Admin
 - Creat un enum de camps que facilitin la definició i validació dels camps que conté el formulari
 - Canviat el DropdownButton per DropdownMenu per tal que s'ajusti a l'amplada del control
 - Ampliació del Troop i TroopMovement per definir colors
 - Canviat el contingut del Dropdown (ha donat error en carregar el Json i ha calgut desinstalar l'App per esborrar les SharedPreferences)
 - *** Falta corregir el teclat numèric que surt en introduir el nom
 - *** Falla al guardar, no dóna cap error, però no guarda res
 
## 10/05
 - Corregit que aparegui el teclat numèric només si es demanen números.
   - S'ha afegit un paràmetre numericOnly al _buildField que assigni null en cas que no sigui numeric als atributs keyboardType e inputFormatters
 - Corregit el guardar.
   - Hi havia conflicte entre el camp buscat "id" i el configurat "Id"
 - Creada una llibreria d'utilitats a widgets/utils/utils.dart per poder ser reaprofitades
    - ShowCustomDialog()
    - buildSpacer()
    - buildField()
 - Adaptat tota la Admin a la meva App
 - *** FALTA ELIMINAR QUALSEVOL POKEMON DEL CODI  --> OK, sense errors!
 - *** FALTA PERMETRE NÚMEROS DECIMALS PEL RANG  --> TextInputType.numberWithOptions(decimal: allowDecimal)
 - Unificada la Card de la llista oficial i la llista de creats

## 11/05
 - Començo a adaptar la crida a la API
 - Descarto fer servir https://developer.clashofclans.com/ degut a limitacions per IP
 - Canvio nom de l'aplicació a MyAppFlutter 

## 12/05
 - Incorporo el contingut d'exemples/day5 al projecte
 - Actualitzo el pubspec.yaml amb totes les noves depedències del dia 5
 - Canvio el name de pokedex a my_pokedex al pubspec.yaml --> Això em costa haver d'adaptar tots els imports que fan referència a pokedex i canviar-los per my_pokedex
 - Afegeixo la funcionalitat de la pantalla de rànking (API Pokemon)
 - Afegeixo la funcionalitat de marcar favorits
   - Canvio la card i afegeixo l'icona del cor
   - Canvio el pokemon_model i li afegeixo una propietat booleana favorit
   - Regenero el pokemon_model amb  >> dart run build_runner build --delete-conflicting-outputs
   - Afegeixo el favorite al constructor del Pokemon_repository
   - Informo el favorite segons si el ID existieix a una llista que es manté a SharedPreferences
   - Genero un mètode ToggleFavorite al pokemon_repositori del ranking
   - El principal problema l'he tingut en recuperar els elements de dalt de la ListView ja que actualitzava la pantalla
     i les preferències, però no els items de la ListView. Això, combinat amb el itemBuilder del ListView on cal indicar una key que combini id+favorit per tal que no reutilitzi una card antiga.





===============================================
# Pokédex — Curs de Flutter

Aplicació Pokédex desenvolupada al llarg del curs **"Desenvolupament d'Apps Multiplataforma amb Flutter"**.

## Estructura per branques (calendari)

Cada sessió usarem una branca **inici** (d’on sortim) i, quan el docent en publiqui una, una branca **final** amb el codi comentat de referència d’aquell dia.


## Instruccions

### Primera vegada (només una)

```bash
git clone https://github.com/arnair/curs-flutter-pokedex.git
cd curs-flutter-pokedex
flutter pub get
```

La branca per defecte del repositori és `dia-1-inici` (o comprova-ho amb `git branch`).

### Inici de cada classe (quan hi hagi noves branques al repositori)

```bash
git fetch origin
git checkout dia-X-inici
flutter pub get
```

### Si t'has perdut o vols comparar amb el codi resolt

```bash
git fetch origin
git checkout dia-X-final
```

## Executar l’app

L’**emulador Android** o el **simulador iOS** són l’objectiu per defecte. **Web (Chrome)** és alternativa.

```bash
flutter devices
flutter run
# o, per web només:  flutter run -d chrome
```
