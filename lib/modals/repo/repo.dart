import 'package:job_search_app/modals/data/data_model.dart';
import 'package:job_search_app/services/response.dart';

class Repo {
  Repo._();

  static Future<List<DataModel>> callResponse() async {
    final responseJsonList = await ResponseService.getResponse();
    List<DataModel> scores = (List<DataModel>.of(
        (responseJsonList).map((e) => DataModel.fromMap(e)))).toList();
    return scores;
  }
}
