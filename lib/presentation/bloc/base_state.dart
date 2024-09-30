abstract class BaseState {
  final String? errorMessage;

  BaseState({this.errorMessage});
}

class LoadingState extends BaseState {}

class ErrorState extends BaseState {
  ErrorState(String errorMessage) : super(errorMessage: errorMessage);
}

class SuccessState extends BaseState {
  SuccessState();
}
