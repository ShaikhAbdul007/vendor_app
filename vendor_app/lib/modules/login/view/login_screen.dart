import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/global%20Keys/global_keys.dart';
import 'package:vendor_app/helper/constant.dart';
import 'package:vendor_app/modules/login/controller/login_controller.dart';
import 'package:vendor_app/routes/routes.dart';
import 'package:vendor_app/widgets/textfield.dart';
import '../../../helper/colors.dart';
import '../../../helper/sizebox.dart';
import '../../../widgets/buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Form(
        key: loginKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: ListView(
            children: [
              Image.asset('assets/login.png'),
              setHeight(height: 50),
              CustomTextField(
                keyboardType: TextInputType.number,
                filteringTextInputFormatterRequired: true,
                maxInputLength: 10,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please mobile number";
                  } else if (value.length > 10) {
                    return "Mobile no should be 10 digits";
                  } else {
                    return null;
                  }
                },
                hintText: 'Mobile Number',
                controller: controller.mobileNumber,
              ),
              setHeight(height: 30),
              Obx(
                () => CustomTextField(
                  obscureText: controller.passwordVisible.value,
                  controller: controller.passwordController,
                  suffixIcon: IconButton(
                      icon: Icon(
                        controller.passwordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.blackColor,
                      ),
                      onPressed: () => controller.togglePassword()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter password";
                    } else {
                      return null;
                    }
                  },
                  hintText: 'Password',
                ),
              ),
              setHeight(height: 28),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: CustomButton(
                    isLoading: controller.isLoading.value,
                    height: 35,
                    width: 100,
                    label: "Login",
                    onPress: () {
                      Constant.printLog('login');
                      loginFunction(context: context, controller: controller);
                    },
                  ),
                ),
              ),
              setHeight(height: 15),
              // TextButton(
              //     onPressed: () async {
              //       // MyRoutes.navigateToRoute(
              //       //     routeName: MyRoutes.forgotPasswordScreen,
              //       //     data: 'Forgot Password');
              //     },
              //     child: Text(
              //       "Forgot Password",
              //       style: Theme.of(context).textTheme.bodySmall?.copyWith(
              //           decoration: TextDecoration.underline,
              //           decorationThickness: 0.5,
              //           fontSize: 17,
              //           fontWeight: FontWeight.w500,
              //           color: Colors.amber),
              //     )),
              // setHeight(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not yet registered ? ",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        decorationThickness: 1.5,
                        fontSize: 15,
                        color: AppColors.blackColor),
                  ),
                  InkWell(
                    onTap: () {
                      MyRoutes.navigateToRoute(routeName: MyRoutes.signUpSreen);
                    },
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          decoration: TextDecoration.underline,
                          decorationThickness: 0.5,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.amber),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginFunction(
      {required BuildContext context, required LoginController controller}) {
    if (loginKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      controller.postLoginData(context: context);
    }
  }
}
