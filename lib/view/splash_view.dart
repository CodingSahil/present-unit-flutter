import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:present_unit_flutter/bloc/theme_mode/theme_mode_bloc.dart';
import 'package:present_unit_flutter/helper-widgets/loader/loader.dart';
import 'package:present_unit_flutter/helpers/extension/double_widget.dart';
import 'package:present_unit_flutter/helpers/extension/string_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceDim,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Loader(color: Theme.of(context).colorScheme.primary),
            4.height,
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                context.read<ThemeModeBloc>().add(ToggleThemeModeEvent());
              },
              child: "PresentUnit".textWidget(fontSize: 16, color: Theme.of(context).colorScheme.onSurface),
            ),
          ],
        ),
      ),
    );
  }
}
