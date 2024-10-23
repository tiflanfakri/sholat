import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/prayer_time.dart';

class PrayerTimeService {
  final String url = 'https://raw.githubusercontent.com/lakuapik/jadwalsholatorg/master/adzan/semarang/2019/12.json';

  Future<List<PrayerTime>> fetchPrayerTimes() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => PrayerTime.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load prayer times');
    }
  }
}
