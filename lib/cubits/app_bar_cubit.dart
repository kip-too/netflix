import 'package:bloc/bloc.dart';


class AppBarCubit extends Cubit<double> {
  AppBarCubit() : super(0);

  void setOffSet(double offSet) => emit(offSet);
}
