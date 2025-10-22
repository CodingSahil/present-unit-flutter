import 'package:flutter/material.dart';
import 'package:present_unit_flutter/helpers/colors/theme.dart';

final RegExp passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    MaterialTheme theme = MaterialTheme();
    return MaterialApp(
      title: 'PresentUnit',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
    );
  }
}
