import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/src/features/auth/registration/presentation/controller/registration_controller.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      body: GetBuilder<RegistrationController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .25,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 20, 116, 194),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(23),
                      bottomLeft: Radius.circular(23),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images.jpg', width: 120),
                      Text(
                        "Caretutors",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          labelText: 'Name',
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          labelText: "Email",
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          labelText: "Password",
                          suffixIcon: IconButton(
                            onPressed: controller.showPassword,
                            icon: Icon(
                              controller.hidenPassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                          ),
                        ),
                        obscureText: controller.hidenPassword,
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          labelText: "Confirm Password",
                          suffixIcon: IconButton(
                            onPressed: controller.showConfirmPassword,
                            icon: Icon(
                              controller.hidenCofirmPassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                          ),
                        ),
                        obscureText: controller.hidenCofirmPassword,
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: controller.isLoading
                              ? null
                              : () {
                                  controller.register(
                                    nameController.text,
                                    emailController.text,
                                    passwordController.text,
                                    confirmPasswordController.text,
                                    context,
                                  );
                                  nameController.clear();
                                  emailController.clear();
                                  passwordController.clear();
                                  confirmPasswordController.clear();
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 20, 116, 194),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                          child: controller.isLoading
                              ? const CircularProgressIndicator()
                              : const Text(
                                  "Create Account",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?  ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.5,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              context.go('/login_page');
                            },
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                color: Color(0xff1153A0),
                                fontSize: 14.5,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                                decorationThickness: 3,
                                decorationColor: Color(0xff1153A0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
