// MidDevicesPage.dart
import 'package:app_tasks/colors_app.dart';
import 'package:app_tasks/components/dialog_nova_tasca.dart';
import 'package:app_tasks/components/dialog_editar_tasca.dart';
import 'package:app_tasks/components/item_task.dart';
import 'package:app_tasks/data/repositori_tasca.dart';
import 'package:app_tasks/data/tasca.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

// --- Importaciones para Contactos ---
import 'package:app_tasks/components/dialog_nou_contacte.dart';
import 'package:app_tasks/components/item_contacte.dart';
import 'package:app_tasks/data/repositori_contacte.dart';
import 'package:app_tasks/data/contacte.dart';
// --- Fin Importaciones para Contactos ---

class MidDevicesPage extends StatefulWidget {
  const MidDevicesPage({super.key});

  @override
  State<MidDevicesPage> createState() => _MidDevicesPageState();
}

class _MidDevicesPageState extends State<MidDevicesPage> {
  final RepositoriTasca _repositoriTasca = RepositoriTasca();
  final RepositoriContacte _repositoriContacte = RepositoriContacte();

  // --- Métodos para Tareas ---
  void _abreDialogNovaTasca(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return const DialogNovaTasca();
      },
    );
  }

  Future<void> _onCheckboxChanged(Tasca tasca, bool? value) async {
    final Tasca tascaActualizada = tasca.copyWith(isCompleted: value ?? false);
    await _repositoriTasca.actualitzarTasca(tascaActualizada);
  }

  void _onEditTask(BuildContext context, Tasca tascaAEditar) async {
    await showDialog(
      context: context,
      builder: (context) {
        return DialogEditarTasca(
          tascaAEditar: tascaAEditar,
          onSave: (tascaEditada) async {
            await _repositoriTasca.actualitzarTasca(tascaEditada);
          },
        );
      },
    );
  }

  Future<void> _onDeleteTask(String idTascaAEliminar) async {
    await _repositoriTasca.eliminarTasca(idTascaAEliminar);
  }
  // --- Fin Métodos para Tareas ---

  // --- Métodos para Contactos ---
  void _abreDialogNouContacte(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return const DialogNouContacte();
      },
    );
  }

  void _onEditContact(BuildContext context, Contacte contacteAEditar) async {
    // Aquí puedes implementar un DialogEditarContacte real si lo necesitas.
    // Por ahora, para mantener la paridad con tu Smalldevicespage, dejo un placeholder.
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Editar Contacte (Simplificado)"),
          content: Text("Funcionalidad de edición para ${contacteAEditar.nom}"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cerrar"),
            ),
            TextButton(
              onPressed: () async {
                // Lógica de guardado aquí
                Navigator.of(context).pop();
              },
              child: const Text("Guardar cambios"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _onDeleteContact(String idContacteAEliminar) async {
    await _repositoriContacte.eliminarContacte(idContacteAEliminar);
  }
  // --- Fin Métodos para Contactos ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.accentColor,
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        title: Text(
          "Tasks & Contacts App", // Título para dispositivos medianos
          style: TextStyle(color: ColorsApp.accentColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Acción para el icono de persona
            },
            icon: Icon(Icons.person, color: ColorsApp.accentColor),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 2,
            decoration: BoxDecoration(
              color: ColorsApp.secondaryColor,
              boxShadow: const [BoxShadow(blurRadius: 2)],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // Sección de Tareas
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        color: ColorsApp.primaryColor.withOpacity(0.1),
                        child: Text(
                          "Tareas",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorsApp.primaryColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ValueListenableBuilder(
                          valueListenable: Hive.box<Tasca>(
                            RepositoriTasca.nomBoxTasques,
                          ).listenable(),
                          builder: (context, Box<Tasca> boxTasques, _) {
                            final llistaTasques = _repositoriTasca
                                .getLlistaTasques();
                            return ListView.builder(
                              itemCount: llistaTasques.length,
                              itemBuilder: (context, index) {
                                final tasca = llistaTasques[index];
                                return ItemTask(
                                  tasca: tasca,
                                  onCheckboxChanged: (value) =>
                                      _onCheckboxChanged(tasca, value),
                                  onEdit: () => _onEditTask(context, tasca),
                                  onDelete: () => _onDeleteTask(tasca.id),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          heroTag: "add_task_fab",
                          onPressed: () => _abreDialogNovaTasca(context),
                          backgroundColor: ColorsApp.primaryColor,
                          shape: const CircleBorder(
                            side: BorderSide(
                              color: ColorsApp.secondaryColor,
                              width: 2,
                            ),
                          ),
                          child: Icon(Icons.add, color: ColorsApp.accentColor),
                        ),
                      ),
                    ],
                  ),
                ),
                VerticalDivider(
                  width: 2,
                  thickness: 2,
                  color: ColorsApp.secondaryColor,
                ),
                // Sección de Contactos
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        color: ColorsApp.primaryColor.withOpacity(0.1),
                        child: Text(
                          "Contactos",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorsApp.primaryColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ValueListenableBuilder(
                          valueListenable: Hive.box<Contacte>(
                            RepositoriContacte.nomBoxContactes,
                          ).listenable(),
                          builder: (context, Box<Contacte> boxContactes, _) {
                            final llistaContactes = _repositoriContacte
                                .getLlistaContactes();
                            return ListView.builder(
                              itemCount: llistaContactes.length,
                              itemBuilder: (context, index) {
                                final contacte = llistaContactes[index];
                                return ItemContacte(
                                  contacte: contacte,
                                  onEdit: () =>
                                      _onEditContact(context, contacte),
                                  onDelete: () => _onDeleteContact(contacte.id),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          heroTag: "add_contact_fab",
                          onPressed: () => _abreDialogNouContacte(context),
                          backgroundColor: ColorsApp.primaryColor,
                          shape: const CircleBorder(
                            side: BorderSide(
                              color: ColorsApp.secondaryColor,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.person_add,
                            color: ColorsApp.accentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
