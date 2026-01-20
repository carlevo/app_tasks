import 'package:app_tasks/colors_app.dart';
import 'package:app_tasks/components/boto_dialog.dart';
import 'package:app_tasks/components/Textfieldcontacte.dart';
import 'package:app_tasks/data/repositori_contacte.dart';
import 'package:app_tasks/data/contacte.dart';
import 'package:flutter/material.dart';

class DialogNouContacte extends StatelessWidget {
  const DialogNouContacte({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerNom = TextEditingController();
    final TextEditingController controllerEmail = TextEditingController();
    final TextEditingController controllerPassword = TextEditingController();

    return AlertDialog(
      backgroundColor: ColorsApp.accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: ColorsApp.secondaryColor, width: 2),
      ),
      title: Text(
        "Nou Contacte",
        style: TextStyle(color: ColorsApp.primaryColor),
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Textfieldcontacte(
                controllertitle: controllerNom,
                hintText: "Nom del contacte", // HintText añadido
              ),
              const SizedBox(height: 10),
              Textfieldcontacte(
                controllertitle: controllerEmail,
                hintText: "Email del contacte", // HintText añadido
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              Textfieldcontacte(
                controllertitle: controllerPassword,
                hintText: "Contrasenya", // HintText añadido
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BotoDialog(
                    text: "Tancar",
                    colorBoto: ColorsApp.closeColor,
                    iconBtn: const Icon(Icons.close),
                    accioBoto: () => tancarContacte(context),
                  ),
                  BotoDialog(
                    text: "Guardar",
                    colorBoto: ColorsApp.greenColor,
                    iconBtn: const Icon(Icons.save),
                    accioBoto: () => guardarContacte(
                      context,
                      controllerNom.text,
                      controllerEmail.text,
                      controllerPassword.text,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> guardarContacte(
    BuildContext context,
    String nom,
    String email,
    String password,
  ) async {
    if (nom.trim().isEmpty || email.trim().isEmpty || password.trim().isEmpty) {
      print("Todos los campos del contacto deben estar completos.");
      // Puedes mostrar un SnackBar o un mensaje de error si quieres
      return;
    }
    RepositoriContacte repositoriContacte = RepositoriContacte();
    final navigator = Navigator.of(context);
    await repositoriContacte.afegirContacte(
      Contacte(nom: nom, email: email, password: password),
    );
    navigator.pop();
  }

  void tancarContacte(BuildContext context) {
    Navigator.of(context).pop();
  }
}
