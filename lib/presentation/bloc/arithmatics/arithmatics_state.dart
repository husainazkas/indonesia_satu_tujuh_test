part of 'arithmatics_bloc.dart';

@freezed
class ArithmaticsState with _$ArithmaticsState {
  const factory ArithmaticsState.initial() = _Initial;
  const factory ArithmaticsState.loading() = _Loading;
  const factory ArithmaticsState.failure(String message) = _Failure;
  const factory ArithmaticsState.success(String result) = _Success;
}
