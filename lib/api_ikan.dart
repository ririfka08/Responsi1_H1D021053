import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:responsi1/model/ikan.dart';

class IkanService {
  final String baseUrl = "https://responsi1a.dalhaqq.xyz/ikan";

  Future<List<Ikan>> getIkanList() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body)['data'];
      return list.map((model) => Ikan.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Ikan> getIkanById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return Ikan.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to load ikan');
    }
  }

  Future<Ikan> addIkan(Ikan ikan) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(ikan.toJson()),
    );
    if (response.statusCode == 200) {
      return Ikan.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to add ikan');
    }
  }

  Future<Ikan> updateIkan(String id, Ikan ikan) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(ikan.toJson()),
    );
    if (response.statusCode == 200) {
      return Ikan.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to update ikan');
    }
  }

  Future<bool> deleteIkan(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete ikan');
    }
  }
}