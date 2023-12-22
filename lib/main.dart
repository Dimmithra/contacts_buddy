import 'package:contacts_buddy/pages/splash/splash.dart';
import 'package:contacts_buddy/providers/contact_provider.dart';
import 'package:contacts_buddy/providers/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => ContactProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ContactProvider>(context, listen: false).loadTheme();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Contact Buddy',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: Provider.of<ContactProvider>(context).darkMode
            ? ThemeMode.dark
            : ThemeMode.light,
        home: const SplashScreen());
  }
}
