import 'package:app_tasks/colors_app.dart';
import 'package:flutter/material.dart';

//Customizar con los colores que pertoque
class Textfieldpersonalitzat extends StatelessWidget {
  const Textfieldpersonalitzat({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      //Color del cursor al escribir
      cursorColor: ColorsApp.primaryColor,
      //Tamaño del cursor que parpadea al escribir
      cursorWidth: 2,
      //Estilos de la caja de texto
      style: TextStyle(
        color: ColorsApp.accentColor,
        fontSize: 18,
        fontStyle: FontStyle.italic,
      ),
      decoration: InputDecoration(
        hint: Row(
          children: [
            Icon(Icons.edit, color: ColorsApp.accentColor),
            SizedBox(width: 7),
            Text(
              "Introdueix la nova tasca",
              style: TextStyle(
                color: ColorsApp.accentColor,
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        filled: true,
        //back del textfield
        fillColor: ColorsApp.secondaryColor,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ColorsApp.primaryColor, width: 2),
        ),
        //Aspecte de la bora quan el TextField está en focus
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsApp.closeColor),
        ),
      ),
    );
  }
}
