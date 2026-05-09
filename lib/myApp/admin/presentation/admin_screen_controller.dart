import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../myApp/admin/domain/pokemon_model.dart';
import '../../../myApp/admin/domain/troop_model.dart';

const _kAdminPokemons = 'admin_pokemons';

//Definició dels camps que hi haurà al formulari
enum FieldsInForm {
  id ('Id', 'Id','Id', 0, 0, "Valor numèric únic identificador"),
  name('name','Nom','String', 2, 50, "Ex: Balbusar"),
  hp('hp','Vida', 'Int', 10, 35,""),
  attack('attack','Atac','Int',111, 222,""),
  defense('defense','Defensa', 'Int', 150, 250, ""),
  image('image','Imatge', 'NotNull',0,0, "Tria una imatge"),
  itemType('type','Tipus','NotNull',0,0, "Tria un tipus"),
  ;

  final String key;
  final String label;
  final String type;
  final int minValue;
  final int maxValue;
  final String sampleHint;

  //Constructor constante
  const FieldsInForm(this.key, this.label, this.type, this.minValue, this.maxValue, this.sampleHint);

  //Métodes personalitzats
  String get hint {
      switch (type) {
        case 'Int' :  return '$minValue .. $maxValue' ;
        case 'String' : return sampleHint;
        case 'Id' : return sampleHint;
        case 'NotNull' : return sampleHint;
        default: return "No s'ha definit cap exemple";
      }
    }


}

class AdminScreenController {
  final _prefs = SharedPreferencesAsync();
  final List<Pokemon> tropa = [];

  Future<void> loadPokemons() async {
    final raw = await _prefs.getStringList(_kAdminPokemons);
    if (raw == null) return;
    tropa
      ..clear()
      ..addAll(raw.map((e) => Pokemon.fromJson(jsonDecode(e) as Map<String, dynamic>)));
  }

  Future<void> addPokemon(Pokemon pokemon) async {
    tropa.add(pokemon);
    await _saveAll();
  }

  Future<void> _saveAll() async {
    final encoded = tropa.map((p) => jsonEncode(p.toJson())).toList();
    await _prefs.setStringList(_kAdminPokemons, encoded);
  }

  Pokemon createPokemon({
    required String id,
    required String name,
    required TroopMovementType type,
    required String hp,
    required String attack,
    required String defense,
    required Uint8List imageBytes,
    required String? mimeType,
  }) {
    final mime = mimeType ?? 'image/jpeg';
    final imageUrl = 'data:$mime;base64,${base64Encode(imageBytes)}';

    return Pokemon(
      id: int.parse(id.trim()),
      name: name.trim(),
      type: type,
      hp: int.parse(hp.trim()),
      attack: int.parse(attack.trim()),
      defense: int.parse(defense.trim()),
      imageUrl: imageUrl,
    );
  }

 
  // Mètodes de validació dels camps del formulari.
  // Quedaria pendent incorporar-los a l'enum
  String? validateId(String? value) => _validateId(value, FieldsInForm.id);
  String getHintId() => FieldsInForm.id.hint;

  String? validateName(String? value) => _validateString(value, FieldsInForm.name);
  String getHintName() => FieldsInForm.name.hint;

  String? validateHp(String? value) => _validateInteger(value, FieldsInForm.hp);
  String getHintHp() => FieldsInForm.hp.hint;

  String? validateAttack(String? value) => _validateInteger(value, FieldsInForm.attack);
  String getHintAttack() => FieldsInForm.attack.hint;

  String? validateDefense(String? value) => _validateInteger(value, FieldsInForm.defense);
  String getHintDefense() => FieldsInForm.defense.hint;

  String? validateImage(bool hasImage) => _validateNotNull(hasImage, FieldsInForm.image);
  String getHintImatge() => FieldsInForm.image.hint;

  String? validateType(PokemonType? value) => _validateNotNull(value != null, FieldsInForm.itemType);
  String getHintTipus() => FieldsInForm.itemType.hint;


  //Mètodes de validació genèrica
  String? _validateInteger(String? value, FieldsInForm fif) {
    if (value == null || value.trim().isEmpty) {
      return 'El ${fif.label} és obligatori';
    }
    final n = int.tryParse(value.trim());
    if (n == null) {
      return 'El ${fif.label} ha de ser un número';
    }
    if (n < fif.minValue || n > fif.maxValue) {
      return 'El valor de ${fif.label} ha d\'estar entre ${fif.minValue} i ${fif.maxValue}';
    }
    return null;
  }

  String? _validateId(String? value, FieldsInForm fif) {
    if (value == null || value.trim().isEmpty) {
      return 'L\'${fif.label} és obligatori';
    }
    final id = int.tryParse(value.trim());
    if (id == null) {
      return 'L\'${fif.label} ha de ser un número';
    }
    if (id <= 0) {
      return 'L\'${fif.label} ha de ser més gran que 0';
    }
    if (tropa.any((p) => p.id == id)) {
      return 'Ja existeix un element amb aquest ${fif.label}';
    }
    return null;
  }

  String? _validateString(String? value, FieldsInForm fif) {
    if (value == null || value.trim().isEmpty) {
      return 'El ${fif.label} és obligatori';
    }
    if (value.trim().length < fif.minValue || value.trim().length > fif.maxValue) {
      return 'El ${fif.label} ha de tenir entre ${fif.minValue} i ${fif.maxValue} caràcters';
    }
    return null;
  }

  String? _validateNotNull(bool value, FieldsInForm fif) =>
      value == false ? 'Selecciona un ${fif.name}' : null;


}
