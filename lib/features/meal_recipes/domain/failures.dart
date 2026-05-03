abstract class Failure {
  const Failure(this.message);
  final String message;
}

class GeneralFailure extends Failure {
  const GeneralFailure(super.message);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);
}