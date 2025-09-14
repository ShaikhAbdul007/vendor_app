import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';
import 'package:vendor_app/helper/constant.dart';
import 'package:vendor_app/modules/sign_up/controller/sign_up_controller.dart';
import 'package:vendor_app/routes/routes.dart';
import 'package:vendor_app/widgets/dropdown.dart';
import 'package:vendor_app/widgets/textfield.dart';
import '../../../global Keys/global_keys.dart';
import '../../../helper/colors.dart';
import '../../../helper/sizebox.dart';
import '../../../widgets/buttons.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());

    final upiDetailsWithoutAmount = UPIDetails(
        upiID: "9768858160@ybl",
        payeeName: "Abdul Rehman",
        transactionNote: "Package Amount",
        currencyCode: 'INR',
        amount: 500);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        toolbarHeight: 30,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 18,
            )),
      ),
      body: Form(
        key: registrationKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: ListView(
            children: [
              Image.asset('assets/signup.png'),
              setHeight(height: 0),
              CustomTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter name";
                  } else {
                    return null;
                  }
                },
                hintText: 'Name',
                controller: controller.name,
              ),
              setHeight(height: 15),
              CustomTextField(
                keyboardType: TextInputType.number,
                filteringTextInputFormatterRequired: true,
                maxInputLength: 10,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter mobile number";
                  }
                  if (value.length < 10) {
                    return "Mobile number should be 10 digit";
                  } else {
                    return null;
                  }
                },
                hintText: 'Mobile Number',
                controller: controller.mobileNumber,
              ),
              setHeight(height: 15),
              CustomTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter email";
                  } else if (!value.isEmail) {
                    return "Please enter valid email";
                  } else {
                    return null;
                  }
                },
                hintText: 'Email',
                controller: controller.email,
              ),
              setHeight(height: 15),
              CustomTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter address";
                  } else {
                    return null;
                  }
                },
                hintText: 'Address',
                controller: controller.address,
              ),
              setHeight(height: 15),
              CustomDropDown(
                  listItems: controller.packageList,
                  notifyParent: (value) {
                    controller.selectedDropDrownValue = value;
                  },
                  label: 'Package',
                  helpText: 'Select Package'),
              setHeight(height: 15),
              CustomTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter shopname";
                  } else {
                    return null;
                  }
                },
                hintText: 'Shop Name',
                controller: controller.shopname,
              ),
              setHeight(height: 15),
              Obx(
                () => CustomTextField(
                  obscureText: controller.passwordVisible.value,
                  controller: controller.passwordController,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.passwordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.primaryColor,
                    ),
                    onPressed: () => controller.toggle(),
                  ),
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
                    label: "Sign Up",
                    onPress: () {
                      Constant.printLog('Sign Up');

                      signUpButton(
                          context: context,
                          controller: controller,
                          upiDetailsWithoutAmount: upiDetailsWithoutAmount);
                    },
                  ),
                ),
              ),
              setHeight(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have a account ? ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {
                      MyRoutes.navigateToRoute(routeName: MyRoutes.loginScreen);
                    },
                    child: Text('Login',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 15, color: AppColors.gradientStartColor)),
                  ),
                ],
              ),
              setHeight(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  signUpButton(
      {required SignUpController controller,
      required BuildContext context,
      required UPIDetails upiDetailsWithoutAmount}) {
    if (registrationKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      controller.postSignUpData(
        context: context,
        onButtonOnPress: () {
          MyRoutes.navigateToRoute(routeName: MyRoutes.loginScreen);
        },
        upiDetailsWithoutAmount: upiDetailsWithoutAmount,
      );
    }
  }
}
