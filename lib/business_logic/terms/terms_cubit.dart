import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/data/models/terms_model/terms_model.dart';

import '../../constants/end_point/end_points.dart';
import '../../data/data_provider/remote/dio_helper.dart';
import '../../data/models/terms_model/terms_model.dart';

part 'terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit() : super(TermsInitial());

  static TermsCubit get(context) => BlocProvider.of(context);
  TermsModel? termsModel;

  void getTermsConditions() {
    emit(TermsLoading());
    DioHelper.getData(url: termsEndPoint).then((value)  {
      print("TermsModel Value: ${value.data}");
      termsModel = TermsModel.fromJson(value.data);
      emit(TermsSuccess());
    }).catchError((error) {
      emit(TermsError());
    });
  }
}
