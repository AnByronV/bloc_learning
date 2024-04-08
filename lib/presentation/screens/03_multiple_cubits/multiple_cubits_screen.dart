import 'package:bloc_learning/config/config.dart';
import 'package:bloc_learning/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MultipleCubitScreen extends StatelessWidget {
  const MultipleCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final CounterCubit counterCubit = context.watch<CounterCubit>();
    final ThemeCubit themeCubit = context.watch<ThemeCubit>();
    final UsernameCubit usernameCubit = context.watch<UsernameCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Cubits'),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 1,),

            IconButton(
              // icon: const Icon( Icons.light_mode_outlined, size: 100 ),
              icon: Icon( themeCubit.state.isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined, size: 100 ),
              onPressed: () {
                themeCubit.toggleTheme();
              },
            ),

            Text(usernameCubit.state, style: const TextStyle(fontSize: 25 )),

            TextButton.icon(
              icon: const Icon( Icons.add, size: 50,),
              label: Text('${counterCubit.state}', style: const TextStyle(fontSize: 100)),
              onPressed: () {
                counterCubit.incrementBy(2);
              },
            ),
            
            const Spacer( flex: 2 ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon( Icons.refresh_rounded ),
        onPressed: () {
          usernameCubit.updateUsername(RandomGenerator.getRandomName());
        },
      ),
    );
  }
}