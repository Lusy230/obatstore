// sign_in_page.dart
import 'package:flutter/material.dart';
import 'package:apotek/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'dashboard_page.dart';

class SignInPage extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showEmptyFieldDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Email and password cannot be empty.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LogIn'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),

            Obx(() {
              return ElevatedButton(
                onPressed: _authController.isLoading.value
                    ? null
                    : () async {
                        if (_emailController.text.isEmpty ||
                            _passwordController.text.isEmpty) {
                          _showEmptyFieldDialog(context);
                        } else {
                          await _authController.loginUser(
                            _emailController.text,
                            _passwordController.text,
                          );

                          // Use ever to observe changes in isLoading and isLoggedIn
                          ever(_authController.isLoading, (bool isLoading) {
                            if (!isLoading &&
                                _authController.isLoggedIn.value) {
                              // Navigate to DashboardPage upon successful login
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DashboardPage(),
                                ),
                              );
                            }
                          });
                        }
                      },
                child: _authController.isLoading.value
                    ? CircularProgressIndicator()
                    : Text('LogIn'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
