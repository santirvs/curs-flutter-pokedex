import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../features/admin/domain/pokemon_model.dart';

const _kAdminPokemons = 'admin_pokemons';

//Definició dels camps que hi haurà al formulari
enum FieldsInForm {
  name('Nom','String', 2, 50, "Ex: Balbusar"),
  hp('Vida', 'Int', 10, 35,""),
  attack('Atac','Int',111, 222,""),
  defense('Defensa', 'Int', 150, 250,""),
  ;

  final String field;
  final String type;
  final int minValue;
  final int maxValue;
  final String sampleHint;

  //Constructor constante
  const FieldsInForm(this.field, this.type, this.minValue, this.maxValue, this.sampleHint);

  //Métodos personalizados
  String get hint {
      switch (type) {
        case 'Int' :  return '$minValue .. $maxValue' ;
        case 'String' : return sampleHint;
        default: return "No s'ha definit cap exemple";
      }
    }


}

class AdminScreenController {
  final _prefs = SharedPreferencesAsync();
  final List<Pokemon> pokemons = [];

  Future<void> loadPokemons() async {
    final raw = await _prefs.getStringList(_kAdminPokemons);
    if (raw == null) return;
    pokemons
      ..clear()
      ..addAll(raw.map((e) => Pokemon.fromJson(jsonDecode(e) as Map<String, dynamic>)));
  }

  Future<void> addPokemon(Pokemon pokemon) async {
    pokemons.add(pokemon);
    await _saveAll();
  }

  Future<void> _saveAll() async {
    final encoded = pokemons.map((p) => jsonEncode(p.toJson())).toList();
    await _prefs.setStringList(_kAdminPokemons, encoded);
  }

  Pokemon createPokemon({
    required String id,
    required String name,
    required PokemonType type,
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

  String? validateId(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'L\'ID és obligatori';
    }
    final id = int.tryParse(value.trim());
    if (id == null) {
      return 'L\'ID ha de ser un número';
    }
    if (id <= 0) {
      return 'L\'ID ha de ser més gran que 0';
    }
    if (pokemons.any((p) => p.id == id)) {
      return 'Ja existeix un Pokémon amb aquest ID';
    }
    return null;
  }

  String? _validateString(String? value, FieldsInForm fif) {
    if (value == null || value.trim().isEmpty) {
      return 'El ${fif.field} és obligatori';
    }
    if (value.trim().length < fif.minValue || value.trim().length > fif.maxValue) {
      return 'El ${fif.field} ha de tenir entre ${fif.minValue} i ${fif.maxValue} caràcters';
    }
    return null;
  }

  String? validateType(PokemonType? value) =>
      value == null ? 'Selecciona un tipus' : null;

  String? _validateInteger(String? value, FieldsInForm fif) {
    if (value == null || value.trim().isEmpty) {
      return 'El ${fif.field} és obligatori';
    }
    final n = int.tryParse(value.trim());
    if (n == null) {
      return 'El ${fif.field} ha de ser un número';
    }
    if (n < fif.minValue || n > fif.maxValue) {
      return 'El valor de ${fif.field} ha d\'estar entre ${fif.minValue} i ${fif.maxValue}';
    }
    return null;
  }

  String? validateName(String? value) => _validateString(value, FieldsInForm.name);
  String getHintName() => FieldsInForm.name.hint;

  String? validateHp(String? value) => _validateInteger(value, FieldsInForm.hp);
  String getHintHp() => FieldsInForm.hp.hint;

  String? validateAttack(String? value) => _validateInteger(value, FieldsInForm.attack);
  String getHintAttack() => FieldsInForm.attack.hint;

  String? validateDefense(String? value) => _validateInteger(value, FieldsInForm.defense);
  String getHintDefense() => FieldsInForm.defense.hint;

  String? validateImage(bool hasImage) =>
      hasImage ? null : 'Has de seleccionar una imatge';
}
