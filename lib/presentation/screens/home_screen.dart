import 'package:flutter/material.dart';
import '../widgets/home/home_bottom_nav_bar.dart';
import 'main_content_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    MainContentScreen(),
    Center(child: Text('🔍 Search Screen', style: TextStyle(fontSize: 24))),
    Center(child: Text('👤 Profile Screen', style: TextStyle(fontSize: 24))),
    Center(child: Text('⚙️ Settings Screen', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Colors
    const bgColor = Color(0xFFF4F6F8);
    const accentGreen = Color(0xFF6CF05A);

    return Scaffold(
      backgroundColor: bgColor,
      body: _screens[_selectedIndex],
      bottomNavigationBar: HomeBottomNavBar(
        accentGreen: accentGreen,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
