import 'package:flutter/foundation.dart';

abstract class ResultEntity<E, S> {
  const ResultEntity();

  S? getSuccess();

  E? getError();

  bool isError();

  bool isSuccess();

  W when<W>(
    W Function(E error) whenError,
    W Function(S success) whenSuccess,
  );
}

@immutable
class Success<E, S> implements ResultEntity<E, S> {
  final S _success;

  const Success(this._success);

  @override
  W when<W>(
    W Function(E error) whenError,
    W Function(S success) whenSuccess,
  ) {
    return whenSuccess(_success);
  }

  @override
  E? getError() => null;

  @override
  S? getSuccess() => _success;

  @override
  bool isError() => false;

  @override
  bool isSuccess() => true;
}

@immutable
class Error<E, S> implements ResultEntity<E, S> {
  final E _error;

  const Error(this._error);

  @override
  W when<W>(
    W Function(E error) whenError,
    W Function(S success) whenSuccess,
  ) {
    return whenError(_error);
  }

  @override
  E? getError() => _error;

  @override
  S? getSuccess() => null;

  @override
  bool isError() => true;

  @override
  bool isSuccess() => false;
}

/// Default success class.
///
/// Instead of returning void, as
/// ```dart
///   Result<Exception, void>
/// ```
/// return
/// ```dart
///   Result<Exception, SuccessResult>
/// ```
class SuccessResult {
  const SuccessResult._internal();
}

/// Default success case.
const success = SuccessResult._internal();
