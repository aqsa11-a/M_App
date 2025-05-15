import 'package:flutter/material.dart';
import 'SubjectsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(color: Colors.grey),
        drawerTheme: DrawerThemeData(backgroundColor: Colors.white),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black87),
        ),
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/subjects': (context) => SubjectsScreen(),

      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Subjects")),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          "Welcome!",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Subjects Screen")),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          "This is the Subject Screen",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.grey),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/bgnu.jfif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 12),

              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Subjects'),
            onTap: () => Navigator.pushReplacementNamed(context, '/subjects'),
          ),
        ],
      ),
    );
  }
}
