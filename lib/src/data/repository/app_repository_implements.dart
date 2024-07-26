
import 'dart:developer';

import 'package:new_lessoon/src/core/api/api_constants.dart';
import 'package:new_lessoon/src/data/entity/unsplash_model.dart';
import 'package:new_lessoon/src/data/repository/app_repository.dart';

import '../../core/api/api.dart';

class AppRepositoryImplements implements AppRepository {
  @override
  Future<UnSplashModel?> fetchData() async {
    log("AppRepoImpl FetchData");
    String? result = await Api.getData(api: ApiConstants.apiUnSplash, params: ApiConstants.defaultParam());
    log("AppRepoImpl Result: $result");

    if (result != null) {
      log("AppRepoImpl FetchData result != null");
      UnSplashModel model = unSplashModelFromJson(result);
      return model;
    } else {
      return null;
    }
  }
}
