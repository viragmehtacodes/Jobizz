import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_search_app/constants/data_location.dart';
import 'package:http/http.dart' as http;

class ResponseService {
  final FirebaseAuth _auth;
  ResponseService(this._auth);
  User get user => _auth.currentUser!;
  static Future<List<Map<String, dynamic>>> getResponse() async {
    // * LOCAL CALL
    // final String request = await Request.readJson(DataLocations.localData);
    // final Map<String, dynamic> jsonMap1 =
    //     jsonDecode(request) as Map<String, dynamic>;

    // * API CALL
    final responseRaw = await http.get(
      Uri.parse(
        DataLocations.url,
      ),
    );
    final parsed =
        (jsonDecode(responseRaw.body) as List).cast<Map<String, dynamic>>();


    return parsed;
  
  }
}
