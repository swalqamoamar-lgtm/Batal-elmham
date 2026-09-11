import 'package:flutter/material.dart';

void main() => runApp(BatalApp());

class BatalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Cairo', useMaterial3: true),
      home: TasksPage(),
    );
  }
}

class TasksPage extends StatefulWidget {
  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List<Map<String, dynamic>> tasks = [
    {'title': 'رتب سريرك', 'icon': '🛏️', 'done': false, 'color': Color(0xFF7B61FF)},
    {'title': 'اغسل أسنانك', 'icon': '🪥', 'done': false, 'color': Color(0xFF00D2FF)},
    {'title': 'اقرأ 10 دقايق', 'icon': '📚', 'done': false, 'color': Color(0xFFFF8A00)},
    {'title': 'ساعد ماما', 'icon': '🧹', 'done': false, 'color': Color(0xFF00E676)},
    {'title': 'اشرب 4 كاسات مي', 'icon': '💧', 'done': false, 'color': Color(0xFF00BFFF)},
    {'title': 'رتب ألعابك', 'icon': '🧸', 'done': false, 'color': Color(0xFFFF5E7E)},
    {'title': 'اكتب واجبك', 'icon': '✏️', 'done': false, 'color': Color(0xFF7B61FF)},
    {'title': 'ساعد بابا', 'icon': '👨‍👧‍👦', 'done': false, 'color': Color(0xFF4CAF50)},
    {'title': 'نظف غرفتك', 'icon': '✨', 'done': false, 'color': Color(0xFFFFC107)},
    {'title': 'صلّ صلواتك', 'icon': '🕌', 'done': false, 'color': Color(0xFF00C9A7)},
    {'title': 'قل أذكار الصباح', 'icon': '☀️', 'done': false, 'color': Color(0xFFFF9800)},
    {'title': 'مارس رياضة 15 د', 'icon': '🤸', 'done': false, 'color': Color(0xFFE91E63)},
    {'title': 'راجع دروسك', 'icon': '📖', 'done': false, 'color': Color(0xFF3F51B5)},
    {'title': 'ساعد في المطبخ', 'icon': '🍳', 'done': false, 'color': Color(0xFFFF5722)},
    {'title': 'تعلم كلمة جديدة', 'icon': '🧠', 'done': false, 'color': Color(0xFF9C27B0)},
    {'title': 'ارسم رسمة', 'icon': '🎨', 'done': false, 'color': Color(0xFFFF4081)},
    {'title': 'رتب ملابسك', 'icon': '👕', 'done': false, 'color': Color(0xFF607D8B)},
    {'title': 'اغسل يديك قبل الأكل', 'icon': '🧼', 'done': false, 'color': Color(0xFF00BCD4)},
    {'title': 'قل شكراً لماما وبابا', 'icon': '❤️', 'done': false, 'color': Color(0xFFF44336)},
    {'title': 'نم باكراً', 'icon': '🌙', 'done': false, 'color': Color(0xFF3F51B5)},
    {'title': 'لا تلعب كثير بالجوال', 'icon': '📱', 'done': false, 'color': Color(0xFF795548)},
    {'title': 'ساعد أخوك الصغير', 'icon': '👶', 'done': false, 'color': Color(0xFFFFEB3B)},
    {'title': 'احفظ آية قصيرة', 'icon': '📿', 'done': false, 'color': Color(0xFF009688)},
    {'title': 'نظف أسنانك قبل النوم', 'icon': '🌟', 'done': false, 'color': Color(0xFF673AB7)},
    {'title': 'رتب حقيبتك', 'icon': '🎒', 'done': false, 'color': Color(0xFF8BC34A)},
    {'title': 'اشكر ربك', 'icon': '🤲', 'done': false, 'color': Color(0xFF4CAF50)},
    {'title': 'العب مع أصدقائك', 'icon': '⚽', 'done': false, 'color': Color(0xFF03A9F4)},
    {'title': 'تعلم حرف جديد', 'icon': '🔤', 'done': false, 'color': Color(0xFFFF6F00)},
    {'title': 'سقي الزرع', 'icon': '🌱', 'done': false, 'color': Color(0xFF8BC34A)},
    {'title': 'كن بطل اليوم!', 'icon': '🏆', 'done': false, 'color': Color(0xFFFFD700)},
  ];

  int get doneCount => tasks.where((t) => t['done']).length;
  double get progress => doneCount / tasks.length;

  void celebrate() {
    if (doneCount == tasks.length) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('🎉 مبروك يا بطل! 🎉', textAlign: TextAlign.center),
          content: Text('خلصت 30 مهمة! انت بطل اليوم بـ ${doneCount * 10} نقطة ⭐', textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
          actions: [Center(child: ElevatedButton(onPressed: () => Navigator.pop(context), child: Text('أحسنت! 🏆')))],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FF),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xFF7B61FF), Color(0xFF5E35B1), Color(0xFFFF8A00)], begin: Alignment.topRight, end: Alignment.bottomLeft),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('بطل المهام ⭐', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text('$doneCount / ${tasks.length} مهمة • ${doneCount * 10} نقطة', style: TextStyle(color: Colors.white70, fontSize: 16)),
                        SizedBox(height: 16),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(value: progress, minHeight: 10, backgroundColor: Colors.white24, valueColor: AlwaysStoppedAnimation(Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.3, crossAxisSpacing: 12, mainAxisSpacing: 12),
              delegate: SliverChildBuilderDelegate((c, i) {
                var task = tasks[i];
                return GestureDetector(
                  onTap: () {
                    setState(() => task['done'] =!task['done']);
                    if (task['done']) celebrate();
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: task['done']? task['color'].withOpacity(0.15) : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: task['done']? task['color'] : Colors.transparent, width: 2),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: Offset(0, 4))],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(task['icon'], style: TextStyle(fontSize: 36)),
                        SizedBox(height: 8),
                        Text(task['title'], textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, decoration: task['done']? TextDecoration.lineThrough : null)),
                        SizedBox(height: 8),
                        Icon(task['done']? Icons.check_circle : Icons.circle_outlined, color: task['done']? task['color'] : Colors.grey),
                      ],
                    ),
                  ),
                );
              }, childCount: tasks.length),
            ),
          ),
        ],
      ),
    );
  }
}
