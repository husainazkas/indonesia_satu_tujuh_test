part of 'arithmatics_bloc.dart';

@freezed
class ArithmaticsEvent with _$ArithmaticsEvent {
  const factory ArithmaticsEvent.perform(int index) = _Perform;
}