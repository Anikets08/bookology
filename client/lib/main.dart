import "package:bookology/common/constants.dart";
import "package:bookology/common/route.dart";
import "package:bookology/common/theme.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:hive_flutter/hive_flutter.dart";

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kAppStorage);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      debugShowCheckedModeBanner: false,
      theme: theme,
      routes: routes,
      initialRoute: "/",
    );
  }
}
