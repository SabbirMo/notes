import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/src/features/auth/home/presentation/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Notes"),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          if (controller.notes.isEmpty) {
            return Center(
              child: Text(
                "No Notes",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: controller.notes.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  title: Text(controller.notes[index].title),
                  subtitle: Text(controller.notes[index].description),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/add_note');
        },
        shape: CircleBorder(),
        backgroundColor: Color.fromARGB(255, 20, 116, 194),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
