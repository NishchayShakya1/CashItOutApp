import 'dart:convert';

class FaqModel {

  static List<Faq> items;

 

  // Get Item by ID
   Faq getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: () => null,);

  // Get Item by position
   Faq getByPosition(int pos) => items[pos];
}

class Faq {
  final int id;
  final String q;
  final String a;

  Faq({
     this.id,
     this.q,
     this.a,
  });

  Faq copyWith({
    int id,
    String q,
    String a,
  }) {
    return Faq(
      id: id ?? this.id,
      q: q ?? this.q,
      a: a ?? this.a,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'q' : q,
      'a' : a,
    };
  }

  factory Faq.fromMap(Map<String, dynamic> map) {
  

    return Faq(
      id: map['id'],
      q: map['q'],
      a: map['a'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Faq.fromJson(String source) => Faq.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, q: $q, a: $a,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Faq &&
        other.id == id &&
        other.q == q &&
        other.a == a ;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        q.hashCode ^
        a.hashCode;

  }
}