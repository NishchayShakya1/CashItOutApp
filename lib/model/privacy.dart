import 'dart:convert';

class PrivacyModel {

  static List<Privacy> items;

 

  // Get Item by ID
   Privacy getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: () => null);

  // Get Item by position
   Privacy getByPosition(int pos) => items[pos];
}

class Privacy {
  final int id;
  final String l;
  

  Privacy({
     this.id,
     this.l,
    
  });

  Privacy copyWith({
    int id,
    String l,
  }) {
    return Privacy(
      id: id ?? this.id,
      l: l ?? this.l,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'l': l,
    };
  }

  factory Privacy.fromMap(Map<String, dynamic> map) {
    return Privacy(
      id: map['id'],
      l: map['l'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Privacy.fromJson(String source) => Privacy.fromMap(json.decode(source));

  @override
  String toString() => 'Privacy(id: $id, l: $l)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Privacy &&
      other.id == id &&
      other.l == l;
  }

  @override
  int get hashCode => id.hashCode ^ l.hashCode;
}
