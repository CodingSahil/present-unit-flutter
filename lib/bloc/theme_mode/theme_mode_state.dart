part of 'theme_mode_bloc.dart';

final class ThemeModeState extends Equatable {
  final bool isDarkMode;

  const ThemeModeState({required this.isDarkMode});

  ThemeModeState copyWith({bool? isDarkMode}) {
    return ThemeModeState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }

  @override
  List<Object?> get props => [isDarkMode];
}
