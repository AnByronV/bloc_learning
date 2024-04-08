part of 'theme_cubit.dart';

// Quiero poder crear instancias de ThemeState, por lo que elimino sealed que es para clases abstractas
class ThemeState extends Equatable {

  final bool isDarkMode;


  const ThemeState({
    required this.isDarkMode,
  });

  @override
  List<Object> get props => [isDarkMode];
}

// final class ThemeInitial extends ThemeState {}
