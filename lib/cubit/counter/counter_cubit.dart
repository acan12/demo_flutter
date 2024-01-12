import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit(initialState) : super(initialState);

  void increament() => emit(state + 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print("ini perubahan state = $change");
  }
}
