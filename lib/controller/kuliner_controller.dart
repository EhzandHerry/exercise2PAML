import 'dart:convert';
import 'dart:io';

import 'package:exercise2/model/kuliner.dart';
import 'package:exercise2/service/kuliner_service.dart';



class KulinerController {
  final KulinerService kulinerService = KulinerService();

  Future<Map<String, dynamic>> addKuliner(Kuliner wisata,) async {
    Map<String, String> data = {
      'nama_wisata': wisata.nama_wisata,
      'review': wisata.review,
      'alamat': wisata.alamat,
      'no_telepon': wisata.telepon,
    };

    try {
      var response = await kulinerService.addKuliner(data,);

      if (response.statusCode == 201) {
        return {
          'success': true,
          'message': 'Data berhasil disimpan',
        };
      } else {
        if (response.headers['content-type']!.contains('application/json')) {
          var decodedJson = jsonDecode(response.body);
          return {
            'success': false,
            'message': decodedJson['message'] ?? 'Terjadi kesalahan',
          };
        }
        var decodedJson = jsonDecode(response.body);
        return {
          'success': false,
          'message':
              decodedJson['message'] ?? 'Terjadi kesalahan saat menyimpan data'
        };
      }
    } catch (e) {
      return {
        "success": false,
        "message": 'Terjadi kesalahan: $e',
      };
    }
  }

  Future<List<Kuliner>> getKuliner() async {
    try {
      List<dynamic> kulinerData = await kulinerService.fetchPeople();
      List<Kuliner> kuliner =
          kulinerData.map((json) => Kuliner.fromMap(json)).toList();
      return kuliner;
    } catch (e) {
      print(e);
      throw Exception('Failed to get kuliner');
    }
  }
}
