class Medicine {
  String name;
  String formula;
  double? condition;
  String expireDate;
  int qty;
  String type;
  String desc;
  String uPhoneno;
  List<String> imgs;

  //construtor
  Medicine({
    required this.name,
    required this.formula,
    required this.condition,
    required this.expireDate,
    required this.qty,
    required this.type,
    required this.desc,
    required this.imgs,
    required this.uPhoneno,
  });
  Medicine.empty({
    this.name = '',
    this.formula = '',
    this.condition = 0.0,
    this.expireDate = '',
    this.qty = 0,
    this.type = '',
    this.desc = '',
    this.uPhoneno = '',
    this.imgs = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'formula': formula,
      'condition': condition,
      'expireDate': expireDate,
      'qty': qty,
      'type': type,
      'desc': desc,
      'uPhoneno': uPhoneno,
      'imgs': imgs,
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      name: map['name'] ?? '',
      formula: map['formula'] ?? '',
      condition: map['condition']?.toDouble(),
      expireDate: map['expireDate'] ?? '',
      qty: map['qty']?.toInt() ?? 0,
      type: map['type'] ?? '',
      desc: map['desc'] ?? '',
      uPhoneno: map['uPhoneno'] ?? '',
      imgs: List<String>.from(map['imgs']),
    );
  }
}
