import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/data/data_provider/local/cache_helper.dart';
import '../../constants/end_point/end_points.dart';
import '../../data/data_provider/remote/dio_helper.dart';
import '../../data/models/news_model/news_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  NewsModel? newsModel;

  //load news from api
  void getNews() {
    emit(NewsLoading());
    print("Access Token from LoginModel: ${CacheHelper.get(key: "token")}\n");
    DioHelper.getData(url: newsEndPoint, token: CacheHelper.get(key: "token"))
        .then((value) {
      print(value.data);
      newsModel = NewsModel.fromJson(value.data);
      emit(NewsSuccess());
    }).catchError((onError) {
      print(onError);
      print("Cannot load news");
      emit(NewsError());
    });
  }
}
