import 'dart:convert';

class AboutModel {

  static List<About>  items;

 

  // Get Item by ID
   About getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: () => null);

  // Get Item by position
   About getByPosition(int pos) => items[pos];
}

class About {
  final int id;
  final String l;
  

  About({
     this.id,
    this.l,
    
  });

  About copyWith({
    int id,
    String l,
  }) {
    return About(
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

  factory About.fromMap(Map<String, dynamic> map) {
    return About(
      id: map['id'],
      l: map['l'],
    );
  }

  String toJson() => json.encode(toMap());

  factory About.fromJson(String source) => About.fromMap(json.decode(source));

  @override
  String toString() => 'About(id: $id, l: $l)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is About &&
      other.id == id &&
      other.l == l;
  }

  @override
  int get hashCode => id.hashCode ^ l.hashCode;
}
