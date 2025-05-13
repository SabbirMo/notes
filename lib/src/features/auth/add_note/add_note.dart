import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/src/features/auth/home/presentation/controller/home_controller.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController decorationController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    labelText: 'Title',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: decorationController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    labelText: 'Description',
                  ),
                  maxLines: 6,
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 130,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 20, 116, 194)),
                    onPressed: () {
                      controller.addNote(
                        titleController.text,
                        decorationController.text,
                      );
                      GoRouter.of(context).pop();
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
