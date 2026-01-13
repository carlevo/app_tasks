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
      backgroundColor: ColorsApp.accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: ColorsApp.secondaryColor, width: 2),
      ),
      title: Text(
        "Quina nova tasca vols afegir?",
        style: TextStyle(color: ColorsApp.primaryColor),
      ),
      content: SizedBox(
        height: 150,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Textfieldpersonalitzat(controllertitle: controllerTextTasca),
            const SizedBox(height: 20), // const
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BotoDialog(
                  text: "Tancar",
                  colorBoto: ColorsApp.closeColor,
                  iconBtn: const Icon(Icons.close), // const
                  accioBoto: () => tancarTasca(context),
                ),
                BotoDialog(
                  text: "Guardar",
                  colorBoto: ColorsApp.greenColor,
                  iconBtn: const Icon(Icons.save), // const
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
    if (text.trim().isEmpty) {
      // Validar que el texto no esté vacío
      // Puedes mostrar un SnackBar o un mensaje de error si quieres
      print("El título de la tarea no puede estar vacío.");
      return;
    }
    RepositoriTasca repositoriTasca = RepositoriTasca();
    final navigator = Navigator.of(context);
    await repositoriTasca.afegirTasca(Tasca(title: text));
    navigator.pop();
  }

  void tancarTasca(BuildContext context) {
    Navigator.of(context).pop();
  }
}
