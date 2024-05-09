import 'dart:convert';

class Kuliner {
  final String nama_wisata;
  final String review;
  final String alamat;
  final String telepon;
  Kuliner({
    required this.nama_wisata,
    required this.telepon,
    required this.review,
    required this.alamat,
  });

  Kuliner copyWith({
    String? nama_wisata,
    String? review,
    String? alamat,
    String? telepon,
  }) {
    return Kuliner(
      nama_wisata: nama_wisata ?? this.nama_wisata,
      review: review ?? this.review,
      alamat: alamat ?? this.alamat,
      telepon: telepon ?? this.telepon,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nama_wisata': nama_wisata});
    result.addAll({'review': review});
    result.addAll({'alamat': alamat});
    result.addAll({'telepon': telepon});

    return result;
  }

  factory Kuliner.fromMap(Map<String, dynamic> map) {
    return Kuliner(
      nama_wisata: map['nama_wisata'] ?? '',
      review: map['review'] ?? '',
      alamat: map['alamat'] ?? '',
      telepon: map['telepon'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Kuliner.fromJson(String source) => Kuliner.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Kuliner(nama_wisata: $nama_wisata, review: $review, alamat: $alamat, telepon: $telepon)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Kuliner &&
      other.nama_wisata == nama_wisata &&
      other.review == review &&
      other.alamat == alamat &&
      other.telepon == telepon;
  }

  @override
  int get hashCode {
    return nama_wisata.hashCode ^
      review.hashCode ^
      alamat.hashCode ^
      telepon.hashCode;
  }
}
