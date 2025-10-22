import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:present_unit_flutter/bloc/theme_mode/theme_mode_bloc.dart';
import 'package:present_unit_flutter/helpers/colors/theme.dart';
import 'package:present_unit_flutter/routes/route_generator.dart';

final RegExp passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MaterialTheme theme = MaterialTheme();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeModeBloc>(
          create: (context) => ThemeModeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeModeBloc, ThemeModeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'PresentUnit',
            debugShowCheckedModeBanner: false,
            theme: state.isDarkMode ? theme.dark() : theme.light(),
            onGenerateRoute: RouteGenerator.onGenerate,
          );
        },
      ),
    );
  }
}
