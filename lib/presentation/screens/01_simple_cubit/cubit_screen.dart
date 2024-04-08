import 'package:bloc_learning/config/config.dart';
import 'package:bloc_learning/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    // Al implementar en este punto el usernameCubit, se está pendiente a los cambios que se hagan en el cubit. Por lo que el Scaffold se evaluará de nuevo
    // en la mayoría de los casos no se necesita que se evalúe todo el Scaffold, solo la parte que se necesita, por ello se usa el cubitBuilder
    // PRIMERA FORMA DE USARLO
    // final usernameCubit = context.watch<UsernameCubit>();

    // Con esto solo se lee el cubit, no está pendiente a los cambios, normalmente se usa más cuando está dentro de algún metodo
    // final usernameCubitRead = context.read<UsernameCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Center(
        // SEGUNDA FORMA DE USARLO: Se añade un blocBuilder para que se actualice solo el texto
        child: BlocBuilder<UsernameCubit, String>(
          buildWhen: (previousState, state) => previousState != state,
          builder: (context, state) {
            return Text(state);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // PRIMERA FORMA DE USARLO
          // usernameCubit.updateUsername(RandomGenerator.getRandomName());
          // SEGUNDA FORMA DE USARLO
          context.read<UsernameCubit>().updateUsername(RandomGenerator.getRandomName());

        },
        child: const Icon(Icons.add),
      )
    );
  }
}