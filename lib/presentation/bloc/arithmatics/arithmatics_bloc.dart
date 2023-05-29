import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'arithmatics_event.dart';
part 'arithmatics_state.dart';
part 'arithmatics_bloc.freezed.dart';

class ArithmaticsBloc extends Bloc<ArithmaticsEvent, ArithmaticsState> {
  final TextEditingController textController = TextEditingController();

  ArithmaticsBloc() : super(const ArithmaticsState.initial()) {
    on<_Perform>(_onPerform);
  }

  @override
  Future<void> close() {
    textController.dispose();
    return super.close();
  }

  void _onPerform(_Perform event, Emitter<ArithmaticsState> emit) {
    switch (event.index) {
      case 0:
        final result = _numberOne();
        if (result != null) {
          emit(ArithmaticsState.success(result));
        }
        break;
      case 1:
        final result = _numberTwo();
        if (result != null) {
          emit(ArithmaticsState.success(result));
        }
        break;
      case 2:
        final result = _numberThree();
        if (result != null) {
          emit(ArithmaticsState.success(result));
        }
        break;
      case 3:
        final result = _numberFour();
        if (result != null) {
          emit(ArithmaticsState.success(result));
        }
        break;
      default:
        emit(const ArithmaticsState.failure('Unknown operation'));
    }
  }

  String? _numberOne() {
    final text = textController.text;
    final input = int.tryParse(text);
    if (input == null) return null;

    String result = '';

    for (var i = 0; i < input; i++) {
      result += '${i + 1} ';
    }

    return 'N=$input, $result'.trim();
  }

  String? _numberTwo() {
    final text = textController.text;
    final input = int.tryParse(text);
    if (input == null) return null;

    String result = '';
    int lastIndex = 0;

    for (int i = lastIndex; i < (input * 2 - 1); i++) {
      if ((i + 1) > input) {
        result += '${lastIndex - 1} ';
        lastIndex--;
      } else {
        result += '${i + 1} ';
        lastIndex++;
      }
    }

    return 'N=$input, $result'.trim();
  }

  String? _numberThree() {
    final text = textController.text;
    final input = int.tryParse(text);
    if (input == null) return null;

    String result = '';

    for (var i = 0; i < input; i++) {
      result += '${(10 * (i + 1)) + i} ';
    }

    return 'N=$input, $result'.trim();
  }

  String? _numberFour() {
    final text = textController.text;
    final input = int.tryParse(text);
    if (input == null) return null;

    String result = '';

    for (var i = 0; i < input; i++) {
      if ((i + 1) % 5 == 0) {
        result += 'LIMA ';
      } else if ((i + 1) % 7 == 0) {
        result += 'TUJUH ';
      } else {
        result += '${i + 1} ';
      }
    }

    return 'N=$input, $result'.trim();
  }
}
