import 'dart:convert';
import 'dart:math';

import 'package:audit_info/Repositry/Api/Api_client.dart';
import 'package:audit_info/Repositry/model/SRCmodel.dart';
import 'package:audit_info/ui/SRC.dart';
import 'package:http/http.dart';

class Srcapi {
  ApiClient api = ApiClient();

  Future<List<SrcModel>> getsrc() async {
    String path = "src/get";
    try {
      final response = await api.invokeAPI(path, "GET", "");
      final List jsonData = jsonDecode(response.body);
      return jsonData.map((s) => SrcModel.fromJson(s)).toList();
    } catch (s) {
      throw Exception("Failed to fetch src");
    }
  }


Future<void>AddSrc(Map<String,dynamic> srcdata )async{

String  path="src/create";
try{
  final  String body=jsonEncode(srcdata);
  await api.invokeAPI(path, "POST", body);
} catch(e){
  throw Exception("Failed to Add src");
}

}

Future<void>deletesrc(String id)async{
String path="src/delete/$id";
try{
  await api.invokeAPI(path, "DELETE", "");
} catch(e){
  throw Exception("Failed to DELETE");
}


}


}
