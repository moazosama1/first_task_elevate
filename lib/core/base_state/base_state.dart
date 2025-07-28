abstract class BaseState<T> {
  final String? baseError;
  final bool baseLoading;
  final T baseData;

  BaseState(
      {required this.baseError,
      required this.baseLoading,
      required this.baseData});
}
