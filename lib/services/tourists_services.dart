import 'package:dio/dio.dart';

final dio = Dio();
const String baseUrl = 'http://restapi.adequateshop.com/api/';

Future<List<Map<String, dynamic>>> getAllTourists() async {
  final response = await dio.get('${baseUrl}Tourist?page=1');

  List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(response.data['data']);

  return data;
}

Future<Map<String, dynamic>> getTouristById(int touristId) async {
  final response = await dio.get('${baseUrl}Tourist/$touristId');

  Map<String, dynamic> data = Map<String, dynamic>.from(response.data);

  return data;
}

