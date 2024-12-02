import 'package:flutter/material.dart';
import 'theme/theme.dart';
import 'package:provider/provider.dart';
import 'theme/theme_notifier.dart';
import 'screens/home.dart';
import 'screens/data.dart';
import 'screens/contact.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeNotifier.themeMode,
          home: const NavigationBarWidget(),
        );
      },
    );
  }
}

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarWidget> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Theme.of(context).colorScheme.secondary,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home_outlined),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.collections_outlined),
            icon: Icon(Icons.collections),
            label: 'Data',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.mail_outlined),
            icon: Icon(Icons.mail),
            label: 'Contact',
          ),
        ],
      ),
      body: <Widget>[
        const HomeScreen(),
        DataScreen(),
        const ContactScreen(),
      ][currentPageIndex],
    );
  }
}
