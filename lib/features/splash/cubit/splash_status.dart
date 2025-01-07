/// Init event
abstract class InitStatus {}

class InitInitial extends InitStatus {}

class InitLoading extends InitStatus {}

class InitSuccess extends InitStatus {}

class InitError extends InitStatus {
  final String message;

  InitError(this.message);
}
