import 'package:app_tasks/colors_app.dart';
import 'package:app_tasks/data/tasca.dart'; // Importa tu modelo Tasca
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemTask extends StatefulWidget {
  final Tasca tasca; // Ahora ItemTask recibe el objeto Tasca completo
  final Function(bool?)? onCheckboxChanged; // Callback para el checkbox
  final VoidCallback? onEdit; // Callback para editar
  final VoidCallback? onDelete; // Callback para eliminar

  const ItemTask({
    super.key,
    required this.tasca, // La tarea es requerida
    this.onCheckboxChanged,
    this.onEdit,
    this.onDelete,
  });

  @override
  State<ItemTask> createState() => _ItemTaskState();
}

class _ItemTaskState extends State<ItemTask> {
  // Ya no necesitamos 'checkValue' local, usamos 'widget.tasca.isCompleted'
  // y el callback para actualizar el estado en el widget padre.

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(
        widget.tasca.id,
      ), // Importante para que Slidable funcione bien con listas
      endActionPane: ActionPane(
        motion: const StretchMotion(), // const
        children: [
          // Boton editar
          SlidableAction(
            icon: Icons.edit,
            backgroundColor: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            onPressed: (context) {
              widget.onEdit?.call(); // Llama al callback de edición
            },
          ),
          // Boton eliminar
          SlidableAction(
            icon: Icons.delete,
            backgroundColor: ColorsApp.closeColor,
            borderRadius: BorderRadius.circular(10),
            onPressed: (context) {
              widget.onDelete?.call(); // Llama al callback de eliminación
            },
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(10), // const
        padding: const EdgeInsets.all(10), // const
        decoration: BoxDecoration(
          color: ColorsApp.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                side: BorderSide(color: ColorsApp.secondaryColor, width: 2),
                shape: const CircleBorder(), // const
                value: widget.tasca.isCompleted, // Usa el estado de la tarea
                activeColor: ColorsApp.greenColor,
                hoverColor: ColorsApp.accentColor,
                onChanged: (value) {
                  // Llama al callback para notificar al padre sobre el cambio
                  widget.onCheckboxChanged?.call(value);
                },
              ),
            ),
            Text(
              widget.tasca.title, // Usa el título de la tarea
              style: TextStyle(
                color: ColorsApp.secondaryColor,
                // Agregamos estilo para tachar si está completada
                decoration: widget.tasca.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationColor: ColorsApp.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
