class Request {
  Map<String, dynamic> byPhone;
  Map<String, dynamic> toPhone;
  String status;
  String mesaage;
  Map<String, dynamic> medicineID;
  String refrenceID = '';

  Request(
      {required this.byPhone,
      required this.toPhone,
      required this.status,
      required this.mesaage,
      required this.medicineID,
      required this.refrenceID});

  Request.empty({
    this.byPhone = const {},
    this.toPhone = const {},
    this.status = '',
    this.mesaage = '',
    this.medicineID = const {},
    this.refrenceID = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'byPhone': byPhone,
      'toPhone': toPhone,
      'status': status,
      'mesaage': mesaage,
      'medicineID': medicineID,
      'refrenceID': refrenceID,
    };
  }

  factory Request.fromMap(Map<String, dynamic> map) {
    return Request(
      byPhone: Map<String, dynamic>.from(map['byPhone']),
      toPhone: Map<String, dynamic>.from(map['toPhone']),
      status: map['status'] ?? '',
      mesaage: map['mesaage'] ?? '',
      medicineID: Map<String, dynamic>.from(map['medicineID']),
      refrenceID: map['refrenceID'] ?? '',
    );
  }
}
