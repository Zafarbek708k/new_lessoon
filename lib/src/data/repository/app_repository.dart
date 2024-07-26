

import 'package:new_lessoon/src/data/entity/unsplash_model.dart';

abstract class AppRepository {
  /// get Data
  Future<UnSplashModel?> fetchData();

}
