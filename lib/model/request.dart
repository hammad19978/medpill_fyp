class Request {
  String byPhone;
  String toPhone;
  bool isApproved;
  String mesaage;
  String medicineID;
  Request({
    required this.byPhone,
    required this.toPhone,
    required this.isApproved,
    required this.mesaage,
    required this.medicineID,
  });

  Request.empty({
    this.byPhone = '',
    this.toPhone = '',
    this.isApproved = false,
    this.mesaage = '',
    this.medicineID = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'byPhone': byPhone,
      'toPhone': toPhone,
      'isApproved': isApproved,
      'mesaage': mesaage,
      'medicineID': medicineID,
    };
  }

  factory Request.fromMap(Map<String, dynamic> map) {
    return Request(
      byPhone: map['byPhone'] ?? '',
      toPhone: map['toPhone'] ?? '',
      isApproved: map['isApproved'] ?? false,
      mesaage: map['mesaage'] ?? '',
      medicineID: map['medicineID'] ?? '',
    );
  }
}
