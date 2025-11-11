import 'package:app_tasks/colors_app.dart';
import 'package:flutter/material.dart';

class Smalldevicespage extends StatelessWidget {
  const Smalldevicespage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorsApp.accentColor,
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        title: Text("Tasks App",style:TextStyle(
          color:ColorsApp.accentColor,
        ),
        ),
        actions: [
          IconButton(onPressed: () {
            
          }, icon: Icon(Icons.book, color: ColorsApp.accentColor,)),
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
            color: ColorsApp.primaryColor,
            width: 2,
          ),
        ),
        child: Icon(Icons.favorite,color: ColorsApp.accentColor,),
        ),
        SizedBox(height: 10,),
        FloatingActionButton(onPressed: () {
          
        },
        
        backgroundColor: ColorsApp.primaryColor,
        shape:CircleBorder(
          side: BorderSide(
            color: ColorsApp.primaryColor,
            width: 2,
          ),
        ),
        child: Icon(Icons.add,color:ColorsApp.accentColor),
        ),
      ],
      
    ),
    
    );
  }
}