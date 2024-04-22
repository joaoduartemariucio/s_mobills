// ignore_for_file: inference_failure_on_function_return_type

abstract class Result<T> {
  const Result({this.data, this.exception});

  final T? data;
  final Exception? exception;

  bool get isSuccess => this is Success<T>;

  bool get isFailure => this is Failure;

  void onSuccess(Function(T data) call) {
    if (isSuccess) {
      call(data as T);
    }
  }

  void onFailure(Function(Exception exception) call) {
    if (isFailure) {
      call(exception!);
    }
  }

  T getOrThrow() {
    if (isFailure) {
      throw exception!;
    }
    return data!;
  }

  T? getOrNull() {
    if (isFailure) {
      return null;
    }
    return data!;
  }
}

class Success<T> extends Result<T> {
  const Success(T data) : super(data: data);
}

class Failure<T> extends Result<T> {
  const Failure(Exception exception) : super(exception: exception);
}
