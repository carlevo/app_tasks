import 'package:app_tasks/colors_app.dart';
import 'package:app_tasks/components/dialog_nova_tasca.dart';
import 'package:app_tasks/components/item_task.dart';
import 'package:flutter/material.dart';

class Smalldevicespage extends StatelessWidget {
  const Smalldevicespage({super.key});

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
            onPressed: () {},
            icon: Icon(Icons.book, color: ColorsApp.accentColor),
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
              boxShadow: [BoxShadow(blurRadius: 2)],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return ItemTask(textValue: index.toString());
              },
            ),
          ),
        ],
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            // Primer botón flotante
            onPressed: () {},

            backgroundColor: ColorsApp.primaryColor,
            shape: CircleBorder(
              side: BorderSide(color: ColorsApp.primaryColor, width: 2),
            ),
            child: Icon(Icons.favorite, color: ColorsApp.accentColor),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            //Botó afegir nova tasca
            onPressed: () {
              obreDialogNovaTasca(context);
            },

            backgroundColor: ColorsApp.primaryColor,
            shape: CircleBorder(
              side: BorderSide(color: ColorsApp.primaryColor, width: 2),
            ),
            child: Icon(Icons.add, color: ColorsApp.accentColor),
          ),
        ],
      ),
    );
  }

  void obreDialogNovaTasca(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogNovaTasca();
      },
    );
  }
}
