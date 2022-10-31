import 'package:demo_block/Helper/network_helper.dart';
import 'package:demo_block/model/api_res_model.dart';

abstract class HomeRepository {
  Future userGetApiCall(int perPage, int page);
}

class HomeRepositoryImpl extends HomeRepository {
  final NetworkAPICall _networkAPICall = NetworkAPICall();

  @override
  Future userGetApiCall(int perPage, int page) async {
    try {
      final request = await _networkAPICall.get('users?page=$page');

      if (request != null) {
        return ApiResModel.fromJson(request);
      } else {
        return request;
      }
    } catch (e) {
      rethrow;
    }
  }
}
