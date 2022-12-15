import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(-1);

  void setCount(int count) => emit(count);
  void increment() => emit(state + 1);
}
