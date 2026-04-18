import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const SafeChatApp());
}

class SafeChatApp extends StatelessWidget {
  const SafeChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SafeChat',

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,

      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}