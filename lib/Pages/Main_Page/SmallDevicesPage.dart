import 'package:app_tasks/colors_app.dart';
import 'package:flutter/material.dart';

class Smalldevicespage extends StatelessWidget {
  const Smalldevicespage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        title: Text("Tasks App",style:TextStyle(
          color:ColorsApp.secondaryColor,
        ),
        ),
        actions: [
          IconButton(onPressed: () {
            
          }, icon: Icon(Icons.book, color: ColorsApp.secondaryColor,)),
        ],
      ),

    floatingActionButton: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(onPressed: () {  

        },
        backgroundColor: ColorsApp.primaryColor,
        shape:CircleBorder(
          side: BorderSide(
            color: ColorsApp.secondaryColor,
            width: 2,
          ),
        ),
        child: Icon(Icons.favorite,),
        ),
        FloatingActionButton(onPressed: () {
          
        },
        backgroundColor: ColorsApp.primaryColor,
        shape:CircleBorder(
          side: BorderSide(
            color: ColorsApp.secondaryColor,
            width: 2,
          ),
        ),
        child: Icon(Icons.add),
        ),
      ],
      
    ),
    
    );
  }
}