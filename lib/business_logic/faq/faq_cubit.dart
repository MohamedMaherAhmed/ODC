import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../constants/end_point/end_points.dart';
import '../../data/data_provider/remote/dio_helper.dart';
import '../../data/models/faq_model/faq_model.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqInitial());

  static FaqCubit get(context) => BlocProvider.of(context);

  FAQModel? faqModel;
  Future<dynamic> getFAQ() async
  {
    emit(FaqLoading());
    DioHelper.getData(url: faqEndPoint).then((value)
    {
      faqModel = FAQModel.fromJson(json:value.data);
      emit(FaqSuccess());

    }).catchError((error)
    {
      emit(FaqError());
    });

  }


}
