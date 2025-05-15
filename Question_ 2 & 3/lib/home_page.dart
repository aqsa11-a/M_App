import 'package:flutter/material.dart';
import '1st.dart';
import 'sqlite.dart'; // ✅ Import your SQLite screen

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> tasks = [

    {
      "title": "Sqlite", // ✅ New SQLite screen
      "icon": Icons.note_alt,
      "widget": NoteScreen(),
    },
    {
      "title": "flag screen", // ✅ New SQLite screen
      "icon": Icons.note_alt,
      "widget": MainScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Showcase',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            shadows: [
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: tasks.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final task = tasks[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => task["widget"]),
                );
              },
              child: Card(
                key: ValueKey(task['title']),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.black,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(task["icon"], color: Colors.white, size: 40),
                      SizedBox(height: 10),
                      Text(
                        task["title"],
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
