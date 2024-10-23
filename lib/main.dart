import 'package:flutter/material.dart';
import 'models/prayer_time.dart';
import 'services/prayer_time_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prayer Time App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PrayerTimeScreen(),
    );
  }
}

class PrayerTimeScreen extends StatelessWidget {
  final PrayerTimeService service = PrayerTimeService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Sholat Semarang 12/09'),
      ),
      body: FutureBuilder<List<PrayerTime>>(
        future: service.fetchPrayerTimes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          }

          List<PrayerTime> prayerTimes = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: prayerTimes.length,
            itemBuilder: (context, index) {
              PrayerTime prayer = prayerTimes[index];
              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date: ${prayer.tanggal}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      PrayerTimeRow(label: 'Imsyak', time: prayer.imsyak),
                      PrayerTimeRow(label: 'Shubuh', time: prayer.shubuh),
                      PrayerTimeRow(label: 'Dhuha', time: prayer.dhuha),
                      PrayerTimeRow(label: 'Dzuhur', time: prayer.dzuhur),
                      PrayerTimeRow(label: 'Ashr', time: prayer.ashr),
                      PrayerTimeRow(label: 'Magrib', time: prayer.magrib),
                      PrayerTimeRow(label: 'Isya', time: prayer.isya),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PrayerTimeRow extends StatelessWidget {
  final String label;
  final String time;

  PrayerTimeRow({required this.label, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
