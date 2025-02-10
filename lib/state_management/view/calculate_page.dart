import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kamp_example/state_management/cubit/calculate_cubit.dart';
import 'package:flutter_kamp_example/state_management/state/calculate_state.dart';
import 'package:flutter_kamp_example/state_management/view/calculate_body_view.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  final _number1TextController = TextEditingController();
  final _number2TextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hesaplama'),
        ),
        body: BlocProvider<CalculateCubit>(
          create: (context) => CalculateCubit(),
          child: BlocListener<CalculateCubit, CalculateState>(
            listener: _buildListener,
            child: CalculateBodyView(
              controller1: _number1TextController,
              controller2: _number2TextController,
            ),
          ),
        ),
      ),
    );
  }

  void _buildListener(BuildContext context, CalculateState state) {
    if (state is CalculateStateError) {
      _showBottomSheet(context, Colors.red, state.message);
    } else if (state is CalculateStateSuccess) {
      _showBottomSheet(context, Colors.green,
          'Result: ${state.result} || Message: ${state.message}');
    }
  }

  void _showBottomSheet(BuildContext context, Color color, String message) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: color,
          padding: const EdgeInsets.all(16),
          child: Text(message),
        );
      },
    );
  }
}
