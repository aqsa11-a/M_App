import 'package:flutter/material.dart';
import 'main.dart'; // To use AppDrawer

class SubjectsScreen extends StatelessWidget {
  final List<Map<String, String>> subjects = [
    {'subject': 'Computer Science', 'teacher': 'Mr. Ahmed', 'credits': '3'},
    {'subject': 'Mathematics', 'teacher': 'Ms. Fatima', 'credits': '4'},
    {'subject': 'Physics', 'teacher': 'Dr. Usman', 'credits': '3'},
    {'subject': 'English', 'teacher': 'Mrs. Khan', 'credits': '2'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Subjects")),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,  // align left
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                "These are the subjects you have enrolled in:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage('assets/bgnu.jfif'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                final subject = subjects[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      subject['subject']!,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Teacher: ${subject['teacher']}",
                            style: TextStyle(color: Colors.black54)),
                        Text("Credits: ${subject['credits']}",
                            style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                    leading: Icon(Icons.book, color: Colors.blue),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
