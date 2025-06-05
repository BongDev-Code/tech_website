import 'package:flutter/material.dart';

import 'fund_tech_lab_page.dart';
import 'hire_graduates_page.dart';
import 'home_page.dart';
import 'join_school_page.dart';
import 'pages/courses_page.dart';
import 'pages/profile_page.dart';
import 'partner_school_page.dart';
import 'sponsor_graduate_page.dart';
import 'volunteer_partner_page.dart';

void main() {
  runApp(const TechBridgeSAApp());
}

class TechBridgeSAApp extends StatelessWidget {
  const TechBridgeSAApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechBridgeSA',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2196F3),
          brightness: Brightness.light,
          primary: const Color(0xFF2196F3),
          secondary: const Color(0xFF00BCD4),
          tertiary: const Color(0xFF3F51B5),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 4,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
            height: 1.2,
          ),
          headlineMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            height: 1.5,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            height: 1.5,
          ),
        ),
        cardTheme: CardTheme(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          clipBehavior: Clip.antiAlias,
        ),
      ),
      home: const MainScreen(),
      routes: {
        '/join-school': (context) => const JoinSchoolPage(),
        '/sponsor-graduate': (context) => const SponsorGraduatePage(),
        '/volunteer-partner': (context) => const VolunteerPartnerPage(),
        '/partner-school': (context) => const PartnerSchoolPage(),
        '/fund-tech-lab': (context) => const FundTechLabPage(),
        '/hire-graduates': (context) => const HireGraduatesPage(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const CoursesPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
            label: 'Courses',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
