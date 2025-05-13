import 'package:get/get.dart';
import 'package:notes/src/features/auth/home/presentation/controller/home_controller.dart';
import 'package:notes/src/features/auth/login/presentation/controller/login_controller.dart';
import 'package:notes/src/features/auth/registration/presentation/controller/registration_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(()=> LoginController());
    Get.lazyPut<RegistrationController>(() => RegistrationController());
    Get.lazyPut<HomeController>(()=> HomeController());
  }
}
