import 'package:app_tasks/colors_app.dart';
import 'package:app_tasks/components/dialog_nova_tasca.dart'; // Importa el dialog para añadir
import 'package:app_tasks/components/dialog_editar_tasca.dart'; // Importa el NUEVO dialog para editar
import 'package:app_tasks/components/item_task.dart';
import 'package:app_tasks/data/repositori_tasca.dart';
import 'package:app_tasks/data/tasca.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Smalldevicespage extends StatefulWidget {
  const Smalldevicespage({super.key});

  @override
  State<Smalldevicespage> createState() => _SmalldevicespageState();
}

class _SmalldevicespageState extends State<Smalldevicespage> {
  // Instancia de RepositoriTasca una sola vez
  final RepositoriTasca _repositoriTasca = RepositoriTasca();

  // Método para abrir el diálogo de añadir nueva tarea
  void _abreDialogNovaTasca(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return const DialogNovaTasca();
      },
    );
    // No necesitamos recargar aquí explícitamente porque ValueListenableBuilder
    // ya escuchará los cambios en la box de Hive.
  }

  // Método para manejar el cambio de estado del checkbox de una tarea
  Future<void> _onCheckboxChanged(Tasca tasca, bool? value) async {
    final Tasca tascaActualizada = tasca.copyWith(isCompleted: value ?? false);
    await _repositoriTasca.actualitzarTasca(tascaActualizada);
    // ValueListenableBuilder se encargará de reconstruir la lista
  }

  // Método para abrir el diálogo de editar tarea
  void _onEditTask(BuildContext context, Tasca tascaAEditar) async {
    await showDialog(
      context: context,
      builder: (context) {
        return DialogEditarTasca(
          tascaAEditar: tascaAEditar,
          onSave: (tascaEditada) async {
            await _repositoriTasca.actualitzarTasca(tascaEditada);
            // ValueListenableBuilder se encargará de reconstruir la lista
          },
        );
      },
    );
  }

  // Método para eliminar una tarea
  Future<void> _onDeleteTask(String idTascaAEliminar) async {
    await _repositoriTasca.eliminarTasca(idTascaAEliminar);
    // ValueListenableBuilder se encargará de reconstruir la lista
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.accentColor,
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        title: Text(
          "Tasks App",
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
              boxShadow: const [BoxShadow(blurRadius: 2)], // const
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: Hive.box<List<Tasca>>(
                RepositoriTasca.nomBoxTasques,
              ).listenable(),
              builder: (context, Box<List<Tasca>> boxTasques, _) {
                final llistaTasques = _repositoriTasca
                    .getLlistaTasques(); // Usamos la instancia del estado
                return ListView.builder(
                  itemCount: llistaTasques.length,
                  itemBuilder: (context, index) {
                    final tasca = llistaTasques[index];
                    return ItemTask(
                      tasca: tasca, // Pasamos el objeto Tasca completo
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
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _abreDialogNovaTasca(context); // Usamos el método de añadir
            },
            backgroundColor: ColorsApp.primaryColor,
            shape: const CircleBorder(
              // const
              side: BorderSide(color: ColorsApp.primaryColor, width: 2),
            ),
            child: Icon(Icons.add, color: ColorsApp.accentColor),
          ),
          const SizedBox(height: 10), // const
          FloatingActionButton(
            onPressed: () {
              // Acción para el segundo botón flotante (favoritos)
            },
            backgroundColor: ColorsApp.primaryColor,
            shape: const CircleBorder(
              // const
              side: BorderSide(color: ColorsApp.primaryColor, width: 2),
            ),
            child: Icon(Icons.favorite, color: ColorsApp.accentColor),
          ),
        ],
      ),
    );
  }
}
