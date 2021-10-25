import 'package:flutter/material.dart';
import 'task.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To do list',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'To-do-list'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  int i=0;

  List<bool?> isSelected=[false,true];
  List<Task> tasks = [Task("T1", true), Task("T2", false), Task("T3", true)];


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title,
        style: TextStyle(
          fontSize: 50,
          backgroundColor:Colors.purple,
          ),
          ),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(tasks.length, 
          (i) => CheckboxListTile(
              title: Text(tasks[i].s,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              
              ),
              value: tasks[i].isChecked,
              onChanged: (bool? val) {
                setState(() {
                  tasks[i].isChecked = val!;
                }
                );
               },
              ),
           )    
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          setState(() {
            tasks.add(Task("T",false));
          });
        },
        
        
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
