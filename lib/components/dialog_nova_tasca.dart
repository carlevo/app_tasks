import 'package:app_tasks/colors_app.dart';
import 'package:app_tasks/components/boto_dialog.dart';
import 'package:app_tasks/components/textfieldpersonalitzat.dart';
import 'package:app_tasks/data/repositori_tasca.dart';
import 'package:app_tasks/data/tasca.dart';
import 'package:flutter/material.dart';

class DialogNovaTasca extends StatelessWidget {
  const DialogNovaTasca({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerTextTasca = TextEditingController();
    return AlertDialog(
      //Fondo del dialogo
      backgroundColor: ColorsApp.accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        //Añadimos el side
        side: BorderSide(color: ColorsApp.secondaryColor, width: 2),
      ),

      title: Text(
        "Quina nova tasca vols afegir?",
        style: TextStyle(color: ColorsApp.primaryColor),
      ),
      content: SizedBox(
        //Añadimos el height y width para limitar el contenido
        height: 150,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          //Añadimos un evenly para que quede uniforme
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Textfieldpersonalitzat(controllertitle: controllerTextTasca),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BotoDialog(
                  text: "Tancar",
                  colorBoto: ColorsApp.closeColor,
                  iconBtn: Icon(Icons.close),
                  accioBoto: () => tancarTasca(context),
                ),
                BotoDialog(
                  text: "Guardar",
                  colorBoto: ColorsApp.greenColor,
                  iconBtn: Icon(Icons.save),
                  accioBoto: () =>
                      guardarTasca(context, controllerTextTasca.text),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> guardarTasca(BuildContext context, String text) async {
    RepositoriTasca repositoriTasca = RepositoriTasca();
    final navigator = Navigator.of(context);
    await repositoriTasca.afegirTasca(Tasca(title: text));
    navigator.pop();
  }

  void tancarTasca(BuildContext context) {
    Navigator.of(context).pop();
  }
}
