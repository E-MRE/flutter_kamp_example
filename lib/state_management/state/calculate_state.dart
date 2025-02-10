abstract class CalculateState {
  const CalculateState();
}

class CalculateStateInitial extends CalculateState {
  const CalculateStateInitial();
}

class CalculateStateLoading extends CalculateState {
  const CalculateStateLoading();
}

class CalculateStateSuccess extends CalculateState {
  CalculateStateSuccess({required this.result, required this.message});
  final int result;
  final String message;

  CalculateStateSuccess copyWith({
    int? result,
    String? message,
  }) {
    return CalculateStateSuccess(
      result: result ?? this.result,
      message: message ?? this.message,
    );
  }
}

class CalculateStateError extends CalculateState {
  final String message;
  const CalculateStateError({this.message = ''});
}
