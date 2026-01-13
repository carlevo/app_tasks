import 'package:app_tasks/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemTask extends StatefulWidget {
  final bool checked; // Nueva propiedad para el estado del checkbox
  final String textValue;
  const ItemTask({
    super.key,
    this.checked = false,
    this.textValue =
        "", // Valor por defecto es false con el override la pasamos
  });

  @override
  State<ItemTask> createState() => _ItemTaskState();
}

class _ItemTaskState extends State<ItemTask> {
  late bool
  checkValue; // late para inicializar una variable sin valor inmediato

  @override
  void initState() {
    super.initState();

    checkValue = widget
        .checked; // Inicializa con el valor pasado desde el stateful widget
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          //Boton editar
          SlidableAction(
            icon: Icons.edit,
            backgroundColor: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            //Funcion editar
            onPressed: (context) {},
          ),
          //Boton eliminar
          SlidableAction(
            icon: Icons.delete,
            backgroundColor: ColorsApp.closeColor,
            borderRadius: BorderRadius.circular(10),
            //Funcion borrar
            onPressed: (context) {},
          ),
        ],
      ),

      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
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
                shape: CircleBorder(),
                value: checkValue,
                //checkColor: ColorsApp.primaryColor, (cambia el color del check)
                activeColor: ColorsApp.greenColor, //Color del circulo
                hoverColor: ColorsApp.accentColor,
                onChanged: (value) {
                  setState(() {
                    checkValue = value ?? false;
                    //?? false por si value es null
                  });
                },
              ),
            ),
            Text(
              widget.textValue,
              style: TextStyle(color: ColorsApp.secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
