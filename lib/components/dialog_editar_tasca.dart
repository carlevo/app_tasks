import 'package:app_tasks/colors_app.dart';
import 'package:app_tasks/components/boto_dialog.dart';
import 'package:app_tasks/components/textfieldpersonalitzat.dart';
import 'package:app_tasks/data/tasca.dart';
import 'package:flutter/material.dart';

class DialogEditarTasca extends StatelessWidget {
  final Tasca tascaAEditar;
  final Function(Tasca) onSave; // Callback para guardar la tarea editada

  const DialogEditarTasca({
    Key? key,
    required this.tascaAEditar,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Inicializa el controlador con el título actual de la tarea
    final TextEditingController controllerTextTasca = TextEditingController(
      text: tascaAEditar.title,
    );
    return AlertDialog(
      backgroundColor: ColorsApp.accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: ColorsApp.secondaryColor, width: 2),
      ),
      title: Text(
        "Editar Tasca",
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BotoDialog(
                  text: "Cancelar",
                  colorBoto: ColorsApp.closeColor,
                  iconBtn: const Icon(Icons.close),
                  accioBoto: () => Navigator.of(context).pop(),
                ),
                BotoDialog(
                  text: "Guardar",
                  colorBoto: ColorsApp.greenColor,
                  iconBtn: const Icon(Icons.save),
                  accioBoto: () {
                    if (controllerTextTasca.text.trim().isNotEmpty) {
                      // Crea una copia de la tarea con el nuevo título
                      final Tasca tascaActualizada = tascaAEditar.copyWith(
                        title: controllerTextTasca.text,
                      );
                      onSave(
                        tascaActualizada,
                      ); // Llama al callback para guardar
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'El título de la tarea no puede estar vacío.',
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
