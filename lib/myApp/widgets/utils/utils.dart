import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

  //Mostra el missatge de guardat correctament
  void showCustomDialog(BuildContext context, String title, String message, {String buttonText = 'D\'acord'}) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(
          message,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }

 //Widget que mostra un camp de text amb validació i actualitza el mapa formData
Widget buildField({
  required String key,
  required String label,
  required String hint,
  required String? Function(String?) validator,
  required Map<String, String> formData,
  bool numericOnly = false,
  bool allowDecimal = false, // 1. Nueva propiedad opcional
}) {
  return TextFormField(
    // 2. Ajustamos el teclado para permitir el punto decimal
    keyboardType: numericOnly 
        ? TextInputType.numberWithOptions(decimal: allowDecimal) 
        : null,
    
    // 3. Cambiamos el formateador para permitir puntos o comas
    inputFormatters: numericOnly 
        ? [
            FilteringTextInputFormatter.allow(
              RegExp(allowDecimal ? r'[0-9.,]' : r'[0-9]'),
            ),
          ] 
        : null,
    
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
      hintStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 14,
      ),
      border: const OutlineInputBorder(),
    ),
    validator: validator,
    onSaved: (value) => formData[key] = value ?? '',
  );
}

  //Widged que deixa un espai de separació entre dos camps del formulari, per defecte 12
  Widget buildSpacer( {double space = 12}) {
    return SizedBox(height: space);
  }


  