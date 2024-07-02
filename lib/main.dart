import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';
import 'calculator_screen.dart';
import 'sign_in_screen.dart';
import 'sign_up_screen.dart';
import 'theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Calculator',
      themeMode: themeProvider.themeMode,
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.blue,
        hintColor: Colors.indigo,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black), // Example of bodyText1 usage
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.blue,
        hintColor: Colors.indigo,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // Example of bodyText1 usage
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/signIn': (context) => const SignInScreen(),
        '/signUp': (context) => const SignUpScreen(),
        '/calculator': (context) => const CalculatorScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
        actions: [
          Switch(
            value: themeProvider.themeMode == ThemeMode.dark,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(119, 199, 230, 255),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/rr.png'), // Replace with your profile picture asset
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Profile',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.login),
                title: const Text('Sign In'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/signIn');
                },
              ),
              ListTile(
                leading: const Icon(Icons.app_registration),
                title: const Text('Sign Up'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/signUp');
                },
              ),
              ListTile(
                leading: const Icon(Icons.calculate),
                title: const Text('Calculator'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/calculator');
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.indigo],
          ),
        ),
        child: Center(
          child: const Text(
            'Welcome to the Calculator App',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
