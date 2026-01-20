import 'package:app_tasks/colors_app.dart';
import 'package:flutter/material.dart';

class Textfieldcontacte extends StatelessWidget {
  final TextEditingController controllertitle;
  final String? hintText; // Hacemos el hintText opcional
  final TextInputType? keyboardType; // Añadimos keyboardType opcional
  final bool obscureText; // Añadimos obscureText opcional

  const Textfieldcontacte({
    super.key,
    required this.controllertitle,
    this.hintText, // Puede ser nulo
    this.keyboardType, // Puede ser nulo
    this.obscureText = false, // Por defecto es false
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllertitle,
      cursorColor: ColorsApp.primaryColor,
      cursorWidth: 2,
      style: TextStyle(
        color: ColorsApp.accentColor,
        fontSize: 18,
        fontStyle: FontStyle.italic,
      ),
      keyboardType: keyboardType, // Usamos el keyboardType proporcionado
      obscureText: obscureText, // Usamos obscureText proporcionado
      decoration: InputDecoration(
        // El hint ahora puede ser un simple texto o el widget Row si es para la "nueva tarea" por defecto
        hintText: hintText, // Usamos hintText directamente
        hintStyle: TextStyle(
          color: ColorsApp.accentColor,
          fontSize: 18,
          fontStyle: FontStyle.italic,
        ),
        prefixIcon: hintText == "Introdueix la nova tasca"
            ? Icon(Icons.edit, color: ColorsApp.accentColor)
            : null, // Icono solo si es para la tarea por defecto
        filled: true,
        fillColor: ColorsApp.secondaryColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ColorsApp.primaryColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          // Cambiado a OutlineInputBorder para consistencia
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ColorsApp.closeColor,
            width: 2,
          ), // Borde consistente
        ),
      ),
    );
  }
}
