import 'package:app_tasks/colors_app.dart';
import 'package:app_tasks/data/contacte.dart'; // Importa tu modelo Contacte
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemContacte extends StatefulWidget {
  final Contacte
  contacte; // Ahora ItemContacte recibe el objeto Contacte completo
  //Se inicializa y no recibe ni pasa ningun valor
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const ItemContacte({
    super.key,
    required this.contacte, // El contacto es requerido
    this.onEdit,
    this.onDelete,
  });

  @override
  State<ItemContacte> createState() => _ItemContacteState();
}

class _ItemContacteState extends State<ItemContacte> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(widget.contacte.id),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            icon: Icons.edit,
            backgroundColor: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            onPressed: (context) {
              widget.onEdit?.call();
            },
          ),
          SlidableAction(
            icon: Icons.delete,
            backgroundColor: ColorsApp.closeColor,
            borderRadius: BorderRadius.circular(10),
            onPressed: (context) {
              widget.onDelete?.call();
            },
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorsApp.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.person,
              color: ColorsApp.secondaryColor,
            ), // Icono de persona
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.contacte.nom, // Muestra el nombre del contacto
                  style: TextStyle(
                    color: ColorsApp.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  widget.contacte.email, // Muestra el email del contacto
                  style: TextStyle(
                    color: ColorsApp.secondaryColor.withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
