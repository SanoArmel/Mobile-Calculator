import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';
import 'theme_provider.dart'; // Import your ThemeProvider class

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final authService = Provider.of<AuthService>(context);

    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          final ThemeData themeData = themeProvider.themeMode == ThemeMode.dark
              ? ThemeData.dark()
              : ThemeData.light();

          // Define custom text styles
          final TextStyle titleStyle = TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: themeData.textTheme.bodyLarge?.color,
          );

          return Scaffold(
            appBar: AppBar(
              title: const Text('Sign In'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign In',
                      style: titleStyle,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: themeData.primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: themeData.primaryColor),
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        authService.signIn(emailController.text, passwordController.text);
                        if (authService.isAuthenticated) {
                          Navigator.pushReplacementNamed(context, '/calculator');
                        } else {
                          // Handle sign-in failure (e.g., show an error message)
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeData.primaryColor,
                        textStyle: const TextStyle(color: Colors.white),
                      ),
                      child: const Text('Sign In'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
