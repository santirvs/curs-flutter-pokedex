# MyApp - Curs de Flutter

## 07/05
 - Fork del repositori del dia 4.
 - Genero la estructura de MyApp
 - Adapto Splash i accedeixo a MyMapScreen

## 08/05
 - Personalització de l'Splash
 - Descàrrega d'icones i fonts de Clash of Clans



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
