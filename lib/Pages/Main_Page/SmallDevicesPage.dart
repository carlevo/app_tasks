import 'package:app_tasks/colors_app.dart';
import 'package:app_tasks/components/dialog_nova_tasca.dart'; // Importa el dialog para añadir
import 'package:app_tasks/components/dialog_editar_tasca.dart'; // Importa el NUEVO dialog para editar
import 'package:app_tasks/components/item_task.dart';
import 'package:app_tasks/data/repositori_tasca.dart';
import 'package:app_tasks/data/tasca.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

// --- Importaciones para Contactos ---
import 'package:app_tasks/components/dialog_nou_contacte.dart'; // Dialog para añadir contacto
import 'package:app_tasks/components/item_contacte.dart'; // Item para mostrar contacto
import 'package:app_tasks/data/repositori_contacte.dart'; // Repositorio de contactos
import 'package:app_tasks/data/contacte.dart'; // Modelo de Contacto
// --- Fin Importaciones para Contactos ---

class Smalldevicespage extends StatefulWidget {
  const Smalldevicespage({super.key});

  @override
  State<Smalldevicespage> createState() => _SmalldevicespageState();
}

class _SmalldevicespageState extends State<Smalldevicespage> {
  //Control para mostrar u ocultar tareas
  bool isShowingTasks = true; // true para tareas, false para contactos

  // Instancia de RepositoriTasca una sola vez
  final RepositoriTasca _repositoriTasca = RepositoriTasca();
  // Instancia de RepositoriContacte una sola vez
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
        return const DialogNouContacte(); // <--- Corregido aquí
      },
    );
  }

  void _onEditContact(BuildContext context, Contacte contacteAEditar) async {
    await showDialog(
      context: context,
      builder: (context) {
        // Aquí podrías crear un DialogEditarContacte similar a DialogEditarTasca
        // Por simplicidad, por ahora solo abrimos el de añadir para un ejemplo básico
        // En una app real, querrías un dialog dedicado para editar contactos con sus campos.
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
                // Aquí iría la lógica para actualizar el contacto
                // Por ejemplo:
                // final updatedContact = contacteAEditar.copyWith(nom: "Nuevo Nombre");
                // await _repositoriContacte.actualitzarContacte(updatedContact);
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
          isShowingTasks ? "Tasks App" : "Contactes App", // Título dinámico
          style: TextStyle(color: ColorsApp.accentColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Acción para el icono de persona (Podría ser para perfil de usuario)
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
            child: isShowingTasks
                ? ValueListenableBuilder(
                    valueListenable: Hive.box<Tasca>(
                      RepositoriTasca.nomBoxTasques,
                    ).listenable(),
                    builder: (context, Box<Tasca> boxTasques, _) {
                      final llistaTasques = _repositoriTasca.getLlistaTasques();
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
                  )
                : ValueListenableBuilder(
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
                            onEdit: () => _onEditContact(context, contacte),
                            onDelete: () => _onDeleteContact(contacte.id),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "add_item_fab", // Añadido un heroTag único
            onPressed: () {
              // Abre el diálogo de añadir según si estamos en tareas o contactos
              if (isShowingTasks) {
                _abreDialogNovaTasca(context);
              } else {
                _abreDialogNouContacte(context);
              }
            },
            backgroundColor: ColorsApp.primaryColor,
            shape: const CircleBorder(
              side: BorderSide(color: ColorsApp.secondaryColor, width: 2),
            ),
            child: Icon(Icons.add, color: ColorsApp.accentColor),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "toggle_list_fab", // Añadido un heroTag único
            onPressed: () {
              // Al presionar, cambiamos el estado de isShowingTasks para alternar las listas
              setState(() {
                isShowingTasks = !isShowingTasks; // Alternar true/false
              });
            },
            backgroundColor: ColorsApp.primaryColor,
            shape: const CircleBorder(
              side: BorderSide(color: ColorsApp.secondaryColor, width: 2),
            ),
            child: Icon(
              isShowingTasks
                  ? Icons.contact_page_outlined
                  : Icons.task_alt_outlined, // Icono dinámico
              color: ColorsApp.accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
