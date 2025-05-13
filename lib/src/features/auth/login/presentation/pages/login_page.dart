import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/src/features/auth/login/presentation/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      body: GetBuilder<LoginController>(
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
                        "Log In",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            labelText: 'Email',
                            ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: controller.showPassword,
                            icon: Icon(controller.hidenPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                          ),
                        ),
                        obscureText: controller.hidenPassword,
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: controller.isLoading
                              ? null
                              : () {
                                  controller.login(
                                    emailController.text,
                                    passwordController.text,
                                    context,
                                  );
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
                                  "Log In",
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
                            "Don't have an account?  ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.5,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              context.go('/registration_page'); 
                            },
                            child: Text(
                              "Create an Account",
                              style: TextStyle(
                                color: Color(0xff1153A0),
                                fontSize: 14.5,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
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
