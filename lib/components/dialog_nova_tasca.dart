import 'package:app_tasks/colors_app.dart';
import 'package:app_tasks/components/boto_dialog.dart';
import 'package:flutter/material.dart';

class DialogNovaTasca extends StatelessWidget {
  const DialogNovaTasca({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorsApp.secondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      title: Text(
        "Quina nova tasca vols afegir?",
        style: TextStyle(color: ColorsApp.primaryColor),
      ),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(),
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
                  accioBoto: () => guardarTasca(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void guardarTasca(BuildContext context) {
    Navigator.of(context).pop();
  }

  void tancarTasca(BuildContext context) {
    Navigator.of(context).pop();
  }
}
