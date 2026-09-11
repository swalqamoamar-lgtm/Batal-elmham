import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(BatalApp());

class BatalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'بطل المهام',
      theme: ThemeData(useMaterial3: true, textTheme: GoogleFonts.tajawalTextTheme()),
      home: WelcomeScreen(),
      locale: Locale('ar'),
      builder: (context, child) => Directionality(textDirection: TextDirection.rtl, child: child!),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF7B61FF), Color(0xFFFF8A00)], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('⭐', style: TextStyle(fontSize: 80)),
            SizedBox(height: 20),
            Text('بطل المهام', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 10),
            Text('تطبيق الأبطال الصغار', style: TextStyle(fontSize: 20, color: Colors.white70)),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen())),
              style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16), backgroundColor: Colors.white),
              child: Text('ابدأ الآن 🚀', style: TextStyle(color: Color(0xFF7B61FF), fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ]),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> tasks = [
    {'title': 'رتب سريرك', 'done': false, 'points': 10},
    {'title': 'اغسل أسنانك', 'done': false, 'points': 10},
    {'title': 'ساعد ماما', 'done': false, 'points': 20},
    {'title': 'اقرأ قصة', 'done': false, 'points': 15},
  ];
  int totalPoints = 0;

  @override
  void initState() { super.initState(); loadPoints(); }
  loadPoints() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => totalPoints = prefs.getInt('points')?? 0);
  }
  savePoints() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('points', totalPoints);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('مهامي اليوم - $totalPoints ⭐'), backgroundColor: Color(0xFF7B61FF)),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, i) {
          return Card(
            margin: EdgeInsets.all(8),
            child: CheckboxListTile(
              title: Text(tasks[i]['title'], style: TextStyle(decoration: tasks[i]['done']? TextDecoration.lineThrough : null)),
              subtitle: Text('${tasks[i]['points']} نقاط'),
              value: tasks[i]['done'],
              onChanged: (v) {
                setState(() {
                  if (!tasks[i]['done'] && v == true) { totalPoints += tasks[i]['points'] as int; savePoints(); }
                  if (tasks[i]['done'] && v == false) { totalPoints -= tasks[i]['points'] as int; savePoints(); }
                  tasks[i]['done'] = v!;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
