import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kamp_example/state_management/cubit/calculate_cubit.dart';
import 'package:flutter_kamp_example/state_management/state/calculate_state.dart';
import 'package:flutter_kamp_example/state_management/view/error_view.dart';

class CalculateBodyView extends StatelessWidget {
  const CalculateBodyView({
    super.key,
    required this.controller1,
    required this.controller2,
  });

  final TextEditingController controller1;
  final TextEditingController controller2;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculateCubit, CalculateState>(
      builder: (context, state) {
        if (state is CalculateStateError) {
          return ErrorView(
            onReset: () => _clearControllers(),
          );
        }

        if (state is CalculateStateLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CalculateStateSuccess) {
          return _buildBody(context, state);
        }

        return _buildBody(context, null);
      },
    );
  }

  Column _buildBody(BuildContext context, CalculateStateSuccess? state) {
    return Column(
      children: [
        TextField(
          controller: controller1,
          decoration: const InputDecoration(
            hintText: 'İlk numarayı girin',
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: controller2,
          decoration: const InputDecoration(
            hintText: 'İkinci numarayı girin',
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            ElevatedButton(
                onPressed: () async {
                  await _sum(context.read<CalculateCubit>());
                },
                child: const Text('Topla')),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () async => _divide(context),
              child: const Text('Böl'),
            ),
          ],
        ),
        if (state != null) const SizedBox(height: 16),
        if (state != null)
          Column(
            children: [
              Text('Result: ${state.result}'),
              Text('Message: ${state.message}'),
            ],
          ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: () async => _reset(context),
          child: const Text('Durumu Sıfırla'),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: () async => _setSuccessMessage(
            'Değişti! ${DateTime.now()}',
            context.read<CalculateCubit>(),
          ),
          child: const Text('Başarılı mesajı değiştir'),
        ),
      ],
    );
  }

  Future<void> _sum(CalculateCubit cubit) async {
    //text controller kontrolü yapıldı.
    final number1 = int.tryParse(controller1.text) ?? 0;
    final number2 = int.tryParse(controller2.text) ?? 0;

    await cubit.sum(number1, number2);
  }

  Future<void> _divide(BuildContext context) async {
    //text controller kontrolü yapıldı.
    final number1 = int.tryParse(controller1.text) ?? 0;
    final number2 = int.tryParse(controller2.text) ?? 0;

    await context.read<CalculateCubit>().divide(number1, number2);
  }

  void _reset(BuildContext context) {
    _clearControllers();
    context.read<CalculateCubit>().reset();
  }

  void _clearControllers() {
    controller1.clear();
    controller2.clear();
  }

  void _setSuccessMessage(String message, CalculateCubit cubit) {
    cubit.setSuccessMessage(message);
  }
}
