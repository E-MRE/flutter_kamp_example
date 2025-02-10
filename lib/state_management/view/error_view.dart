import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kamp_example/state_management/cubit/calculate_cubit.dart';
import 'package:flutter_kamp_example/state_management/state/calculate_state.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.onReset});

  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CalculateCubit, CalculateState, CalculateStateError?>(
      selector: (state) => state is CalculateStateError ? state : null,
      builder: (context, state) {
        if (state == null) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Error occurred: ${state.message}',
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  _reset(context);
                },
                child: const Text('Tekrar Dene!'),
              )
            ],
          ),
        );
      },
    );
  }

  void _reset(BuildContext context) {
    context.read<CalculateCubit>().reset();
    onReset.call();
  }
}
