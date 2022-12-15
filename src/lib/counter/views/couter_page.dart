import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/counter/cubit/counter_cubit.dart';
import 'package:flutter_todos/l10n/l10n.dart';
import 'package:flutter_todos/stats/stats.dart';
import 'package:todos_repository/todos_repository.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.select((CounterCubit cubit) => cubit.state);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        BlocBuilder<CounterCubit, int>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return Text('$state');
          },
        ),
        IconButton(
          onPressed: () => context.read<CounterCubit>().increment(),
          iconSize: 32,
          icon: const Icon(Icons.plus_one_rounded),
        )
      ]),
    );
  }
}
