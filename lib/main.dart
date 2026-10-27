import 'package:flutter/material.dart';

void main() {
  runApp(const NoorQuranApp());
}

class NoorQuranApp extends StatelessWidget {
  const NoorQuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'نور القرآن 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0D1B2A),
        primaryColor: const Color(0xFF1B263B),
        fontFamily: 'Cairo',
      ),
      home: const MainHomeScreen(),
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreenContent(),
    const QuranScreen(),
    const PrayerAndQiblaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: const Color(0xFF1B263B),
        selectedItemColor: const Color(0xFFE0A96D),
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'القرآن الكريم',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'المواقيت والقبلة',
          ),
        ],
      ),
    );
  }
}

// 1. الواجهة الرئيسية
class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نور القرآن 1'),
        backgroundColor: const Color(0xFF1B263B),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.auto_awesome, size: 80, color: Color(0xFFE0A96D)),
              const SizedBox(height: 20),
              const Text(
                'مرحباً بك في تطبيق نور القرآن 1',
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'يشمل الأجزاء 1 إلى 3، مواقيت الصلاة، وتحديد اتجاه القبلة',
                style: TextStyle(color: Colors.white70, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 2. شاشة القرآن الكريم
class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('القرآن الكريم (الأجزاء 1 - 3)'),
        backgroundColor: const Color(0xFF1B263B),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildJuzCard('الجزء الأول', 'سورة الفاتحة - البقرة (آية 141)'),
          _buildJuzCard('الجزء الثاني', 'سورة البقرة (آية 142) - البقرة (252)'),
          _buildJuzCard('الجزء الثالث', 'سورة البقرة (آية 253) - آل عمران (92)'),
        ],
      ),
    );
  }

  Widget _buildJuzCard(String juzTitle, String details) {
    return Card(
      color: const Color(0xFF1B263B),
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        leading: const Icon(Icons.menu_book_rounded, color: Color(0xFFE0A96D), size: 36),
        title: Text(juzTitle, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(details, style: const TextStyle(color: Colors.white70, fontSize: 14)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 18),
      ),
    );
  }
}

// 3. شاشة مواقيت الصلاة والقبلة
class PrayerAndQiblaScreen extends StatelessWidget {
  const PrayerAndQiblaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مواقيت الصلاة والقبلة'),
        backgroundColor: const Color(0xFF1B263B),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'مواقيت الصلاة اليوم',
            style: TextStyle(fontSize: 20, color: Color(0xFFE0A96D), fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildPrayerRow('الفجر', '04:32 ص'),
          _buildPrayerRow('الشروق', '06:05 ص'),
          _buildPrayerRow('الظهر', '11:50 ص'),
          _buildPrayerRow('العصر', '03:12 م'),
          _buildPrayerRow('المغرب', '05:35 م'),
          _buildPrayerRow('العشاء', '06:55 م'),
          const SizedBox(height: 25),
          const Text(
            'اتجاه القبلة',
            style: TextStyle(fontSize: 20, color: Color(0xFFE0A96D), fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF1B263B),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Column(
              children: [
                Icon(Icons.explore, color: Color(0xFFE0A96D), size: 60),
                SizedBox(height: 10),
                Text(
                  'جاري تحديد اتجاه الكعبة المشرفة...',
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerRow(String prayer, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1B263B),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(prayer, style: const TextStyle(color: Colors.white, fontSize: 16)),
          Text(time, style: const TextStyle(color: Color(0xFFE0A96D), fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
