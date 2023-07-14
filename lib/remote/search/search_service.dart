import 'package:dartz/dartz.dart';
import 'package:flutter_task_project/app/data/custom_exception_handler.dart';

import '../../app/models/search_user_list_model.dart';

abstract class SearchService {
  Future<Either<CustomException, SearchUsersListModel>> getUserList(
      String search);
}
