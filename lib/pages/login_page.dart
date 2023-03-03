import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
import 'package:user_lulu/pages/register_page.dart';
import '../controller/api_crud_controller.dart';
import '../utlis/utils.dart';
import '../widgets/round_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _subAdminController = TextEditingController();

  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  final height = Get.height;
  final width = Get.width;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _subAdminController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ApiCrudProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email)),
          ),
          // passwordTextfield
          ValueListenableBuilder(
            valueListenable: _obscurePassword,
            builder: (context, value, child) {
              return TextFormField(
                controller: _passwordController,
                obscureText: value,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_open_rounded),
                  suffixIcon: InkWell(
                    onTap: () {
                      _obscurePassword.value = !_obscurePassword.value;
                    },
                    child: Icon(_obscurePassword.value
                        ? Icons.visibility
                        : Icons.visibility_off_outlined),
                  ),
                ),
              );
            },
          ),
          TextFormField(
            controller: _subAdminController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'sub Admin',
                labelText: 'Refer Code',
                prefixIcon: Icon(Icons.admin_panel_settings)),
          ),
          SizedBox(
            height: height * 0.085,
          ),
          // RoundButton(
          //   title: 'Login',
          //   // loading: authViewModel.loading,
          //   onPress: () {
          // if (_emailController.text.isEmpty) {
          //   Utils.flushBarErrorMessage('Please enter email', context);
          // } else if (_passwordController.text.isEmpty) {
          //   Utils.flushBarErrorMessage('Please enter password', context);
          // } else if (_passwordController.text.length < 6) {
          //   Utils.flushBarErrorMessage(
          //       'Please enter 6 digit password', context);
          // } else {
          //   Map data = {
          //     // 'email': _emailController.text.toString(),
          //     // 'password': _passwordController.text.toString()
          //     'email': 'eve.holt@reqres.in',
          //     'password': 'cityslicka'
          //   };
          //   authViewModel.loginApi(data, context);
          //   print('api hit');
          // }
          //   },
          // ),
          AppButton(
              operation: 'Login',
              isLoading: provider.getPostLoading,
              onPressed: () async {
                await provider.getPostApi();
                Utils.snakBar('POST API CALLED', context);
              },
              operationColor: Colors.brown),
          SizedBox(
            height: height * .02,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RegisterPage(),
              ));
            },
            child: Text('Don\'t have an account? Sign Up'),
          ),
        ],
      ),
    );
  }
}
