import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_intern/features/domain/entities/active_user.dart';
import 'package:suitmedia_intern/features/presentation/pages/homes_page.dart';
import 'package:suitmedia_intern/features/presentation/pages/user_list_pages.dart';
import 'package:suitmedia_intern/features/presentation/pages/user_pages.dart';
import 'package:suitmedia_intern/features/presentation/provider/palindrom_provider.dart';
import 'package:suitmedia_intern/features/presentation/provider/user_provider.dart';
import 'package:suitmedia_intern/injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => di.locator<PalindromProvider>()),
        ChangeNotifierProvider(create: (_) => di.locator<UserProvider>()),
      ],
      child: MaterialApp(
        initialRoute: HomePage.routeNamed,
        routes: {
          HomePage.routeNamed: (context) => const HomePage(),
          UserPage.routeNamed: (context) => UserPage(
              model: ModalRoute.of(context)?.settings.arguments as ActiveUser),
          UserListPage.routeNamed: (context) => UserListPage(
              username: ModalRoute.of(context)?.settings.arguments as String),
        },
      ),
    );
  }
}
