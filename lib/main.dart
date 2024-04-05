import 'package:bloc_learning/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/blocs/blocs.dart';

void main() => runApp(const BlocsProviders());

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UsernameCubit>(
          create: (_) => UsernameCubit(),
          lazy: true, // Esta propiedad es opcional, indica que se creará el cubit cuando se necesite; En caso de que sea false se creará al inicio
        ),
      ], 
      child: const MyApp()
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkmode: false).getTheme(),
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
