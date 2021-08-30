import 'package:bloc/bloc.dart';

class CuibitCubit extends Cubit<double> {
  CuibitCubit() : super(0);

  void setoffset(double offset) => emit(offset);
}
