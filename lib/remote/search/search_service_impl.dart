import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_task_project/app/data/api_calls.dart';
import 'package:flutter_task_project/app/data/custom_exception_handler.dart';
import 'package:flutter_task_project/app/data/endpoints.dart';
import 'package:flutter_task_project/app/models/search_user_list_model.dart';
import 'package:flutter_task_project/remote/search/search_service.dart';

class SearchServiceImpl implements SearchService {
  @override
  Future<Either<CustomException, SearchUsersListModel>> getUserList(
      String search) async {
    try {
      String url = "$searchUser?q=$search";

      final response = await APICalls().getApiCall(url);

      if (response.statusCode == 200) {
        // Process the response
        print(response.body);
        return Right(SearchUsersListModel.fromJson(jsonDecode(response.body)));
      } else {
        // Handle the error
        print('Error: ${response.statusCode}');
        return left(CustomException(
            message: response.body, code: response.statusCode.toString()));
      }
    } on CustomException catch (cE) {
      return left(cE);
    }
  }
}
