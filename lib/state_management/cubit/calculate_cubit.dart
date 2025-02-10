import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kamp_example/state_management/state/calculate_state.dart';

class CalculateCubit extends Cubit<CalculateState> {
  CalculateCubit() : super(const CalculateStateInitial());

  Future<void> sum(int number1, int number2) async {
    //validasyon varsa ilk onu yap duruma göre hata döndür
    emit(const CalculateStateLoading());
    await Future.delayed(const Duration(seconds: 2));

    final result = number1 + number2;

    emit(CalculateStateSuccess(result: result, message: 'Sonuç Başarılı'));
  }

  Future<void> divide(int number1, int number2) async {
    emit(const CalculateStateLoading());
    await Future.delayed(const Duration(seconds: 1));

    if (number2 == 0) {
      emit(const CalculateStateError(message: 'Bölen 0 olamaz!'));
      return;
    }

    final result = number1 / number2;
    emit(CalculateStateSuccess(result: result.toInt(), message: 'Başarılı'));
  }

  void reset() {
    emit(const CalculateStateInitial());
  }

  void setSuccessMessage(String message) {
    if (state is! CalculateStateSuccess) {
      return;
    }

    emit((state as CalculateStateSuccess).copyWith(message: message));
  }
}
