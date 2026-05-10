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
    required Map<String,String> formData,
    bool numericOnly = false,
  }) {
    return TextFormField(
      keyboardType: numericOnly? TextInputType.number : null,
      inputFormatters: numericOnly? [FilteringTextInputFormatter.digitsOnly] : null,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.grey, // O Colors.black38 para un gris suave
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


  