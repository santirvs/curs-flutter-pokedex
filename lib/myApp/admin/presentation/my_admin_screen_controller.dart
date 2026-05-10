import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../myApp/admin/domain/troop_model.dart';

const _kAdminTroops = 'admin_troops';

//Definició dels camps que hi haurà al formulari
enum FieldsInForm {
  id ('id', 'Id','Id', 0, 0, "Valor numèric únic identificador"),
  name('name','Nom','String', 2, 50, "Ex: Duc Drac"),
  itemType('type','Tipus','NotNull',0,0, "Tria un tipus"),
  level('level','Nivell', 'Int', 1, 100,""),
  life('life','Vida', 'Int', 1, 10000,""),
  damage('damage','Atac','Int',1, 3000,""),
  range('range','Rang','Double',0, 10,""),
  image('imageUrl','Imatge', 'NotNull',0,0, "Tria una imatge"),
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
        case 'Double' :  return '$minValue.0 .. $maxValue.0' ;
        case 'String' : return sampleHint;
        case 'Id' : return sampleHint;
        case 'NotNull' : return sampleHint;
        default: return "No s'ha definit cap exemple";
      }
    }


}

class AdminScreenController {
  final _prefs = SharedPreferencesAsync();
  final List<Troop> tropes = [];

  Future<void> loadTroops() async {
    final raw = await _prefs.getStringList(_kAdminTroops);
    if (raw == null) return;
    tropes
      ..clear()
      ..addAll(raw.map((e) => Troop.fromJson(jsonDecode(e) as Map<String, dynamic>)));
  }

  Future<void> addTroop(Troop troop) async {
    tropes.add(troop);
    await _saveAll();
  }

  Future<void> _saveAll() async {
    final encoded = tropes.map((p) => jsonEncode(p.toJson())).toList();
    await _prefs.setStringList(_kAdminTroops, encoded);
  }

 Troop createTroop({
    required String id,
    required String name,
    required TroopType type,
    required String level,
    required String life,
    required String damage,
    required String range,
    required Uint8List imageBytes,
    required String? mimeType,
  }) {
    final mime = mimeType ?? 'image/jpeg';
    final imageUrl = 'data:$mime;base64,${base64Encode(imageBytes)}';

    return Troop(
      id: int.parse(id.trim()),
      name: name.trim(),
      type: type,
      level: int.parse(level.trim()),
      life: int.parse(life.trim()),
      damage: int.parse(damage.trim()),
      range: double.parse(range.trim()),
      imageUrl: imageUrl,
    );
  }

 
  // Mètodes de validació dels camps del formulari.
  // Quedaria pendent incorporar-los a l'enum
  String? validateId(String? value) => _validateId(value, FieldsInForm.id);
  String getHintId() => FieldsInForm.id.hint;

  String? validateName(String? value) => _validateString(value, FieldsInForm.name);
  String getHintName() => FieldsInForm.name.hint;
  
  String? validateType(TroopType? value) => _validateNotNull(value != null, FieldsInForm.itemType);
  String getHintTipus() => FieldsInForm.itemType.hint;

  String? validateLevel(String? value) => _validateInteger(value, FieldsInForm.level);
  String getHintLevel() => FieldsInForm.level.hint;
  
  String? validateLife(String? value) => _validateInteger(value, FieldsInForm.life);
  String getHintLife() => FieldsInForm.life.hint;
  
  String? validateDamage(String? value) => _validateInteger(value, FieldsInForm.damage);
  String getHintDamage() => FieldsInForm.damage.hint;
  
  String? validateRange(String? value) => _validateDouble(value, FieldsInForm.range);
  String getHintRange() => FieldsInForm.range.hint;
 
  String? validateImage(bool hasImage) => _validateNotNull(hasImage, FieldsInForm.image);
  String getHintImatge() => FieldsInForm.image.hint;



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

   //Mètodes de validació genèrica
  String? _validateDouble(String? value, FieldsInForm fif) {
    if (value == null || value.trim().isEmpty) {
      return 'El ${fif.label} és obligatori';
    }
    final n = double.tryParse(value.trim());
    if (n == null) {
      return 'El ${fif.label} ha de ser un número decimal';
    }
    if (n < fif.minValue.toDouble() || n > fif.maxValue.toDouble()) {
      return 'El valor de ${fif.label} ha d\'estar entre ${fif.minValue.toDouble()} i ${fif.maxValue.toDouble()}';
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
    if (tropes.any((p) => p.id == id)) {
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
