import 'package:flutter/material.dart';

void main() => runApp(BatalApp());

class BatalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16)),
                  child: Text('ابدأ الآن 🚀', style: TextStyle(color: Color(0xFF7B61FF), fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
