import 'package:demo_block/Screen/Home/Bloc/home_event.dart';
import 'package:demo_block/Screen/Home/Bloc/home_state.dart';
import 'package:demo_block/Screen/Home/Repository/home_repository_impl.dart';
import 'package:demo_block/model/api_res_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;
  static const int perPage = 5;
  int page = 1;
  bool limitRich = false;

  HomeBloc(this.repository) : super(const HomeInitial()) {
    on<FetchApiEvent>((event, emit) async {
      print('FetchApiEvent 00');
      emit(const LoaderState());
      try {
        if (!limitRich) {
          dynamic result = await repository.userGetApiCall(perPage, page);
          page++;
          if (result is ApiResModel) {
            if (result.data?.isNotEmpty ?? false) {
              limitRich = ((result.data?.length ?? 0) < perPage);
              emit(ApiSuccessState(apiResModel: result, key: DateTime.now().millisecondsSinceEpoch.toString()));
            } else {
              limitRich = true;
              emit(const PageNotFound());
            }
          } else {
            emit(ErrorState(errorMessage: result.message));
          }
        }
      } catch (e) {
        emit(ErrorState(errorMessage: e.toString()));
      }
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
