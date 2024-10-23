class PrayerTime {
  final String imsyak;
  final String shubuh;
  final String dzuhur;
  final String tanggal;
  final String terbit;
  final String magrib;
  final String isya;
  final String dhuha;
  final String ashr;

  PrayerTime({
    required this.imsyak,
    required this.shubuh,
    required this.dzuhur,
    required this.tanggal,
    required this.terbit,
    required this.magrib,
    required this.isya,
    required this.dhuha,
    required this.ashr,
  });

  factory PrayerTime.fromJson(Map<String, dynamic> json) {
    return PrayerTime(
      imsyak: json['imsyak'],
      shubuh: json['shubuh'],
      dzuhur: json['dzuhur'],
      tanggal: json['tanggal'],
      terbit: json['terbit'],
      magrib: json['magrib'],
      isya: json['isya'],
      dhuha: json['dhuha'],
      ashr: json['ashr'],
    );
  }
}
