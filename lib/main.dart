import 'package:bloc_learning/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/blocs/blocs.dart';

void main() {
  serviceLocatorInit();
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<UsernameCubit>(
        create: (_) => getIt<UsernameCubit>(),
        lazy:
            true, // Esta propiedad es opcional, indica que se creará el cubit cuando se necesite; En caso de que sea false se creará al inicio
      ),
      BlocProvider<RouterSimpleCubit>(
          create: (_) => getIt<RouterSimpleCubit>()),
      BlocProvider<CounterCubit>(create: (_) => getIt<CounterCubit>()),
      BlocProvider<ThemeCubit>(create: (_) => getIt<ThemeCubit>()),
      BlocProvider(create: (context) => getIt<GuestsBloc>()),
      BlocProvider(create: (context) => getIt<PokemonBloc>()),
      BlocProvider(create: (context) => getIt<GeolocationCubit>()),
      BlocProvider(create: (context) => getIt<HistoricLocationBloc>()),
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Usamos el watch dado que puede cambar
    final appRouter = context.watch<RouterSimpleCubit>().state;
    final theme = context.watch<ThemeCubit>().state;

    return MaterialApp.router(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkmode: theme.isDarkMode).getTheme(),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Material App Bar'),
      //   ),
      //   body: const Center(
      //     child: Text('Hello World'),
      //   ),
      // ),
    );
  }
}
