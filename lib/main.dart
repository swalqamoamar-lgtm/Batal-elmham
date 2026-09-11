import 'package:flutter/material.dart';

void main() => runApp(BatalApp());

class BatalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7B61FF), Color(0xFFFF8A00)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('⭐', style: TextStyle(fontSize: 80)),
              SizedBox(height: 20),
              Text('بطل المهام', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
              SizedBox(height: 10),
              Text('تطبيق الأبطال الصغار', style: TextStyle(fontSize: 20, color: Colors.white70)),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => TasksPage()));
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16)),
                child: Text('ابدأ الآن 🚀', style: TextStyle(color: Color(0xFF7B61FF), fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TasksPage extends StatefulWidget {
  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List<Map> tasks = [
    {'title': 'رتب سريرك 🛏️', 'done': false},
    {'title': 'اغسل أسنانك 🪥', 'done': false},
    {'title': 'اقرأ 10 دقايق 📚', 'done': false},
    {'title': 'ساعد ماما 🧹', 'done': false},
  ];

  int get points => tasks.where((t) => t['done']).length * 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('مهامي اليوم ⭐ $points نقطة'), backgroundColor: Color(0xFF7B61FF)),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (c, i) {
          return Card(
            child: CheckboxListTile(
              title: Text(tasks[i]['title'], style: TextStyle(fontSize: 18)),
              value: tasks[i]['done'],
              onChanged: (v) => setState(() => tasks[i]['done'] = v),
            ),
          );
        },
      ),
    );
  }
}
