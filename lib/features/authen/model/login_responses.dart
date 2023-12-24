

class LoginResponse {
  LoginResponse({
    required this.message,
    required this.id,
  });
final String message;
final int id;




  LoginResponse copyWith({
    String? message,
    int? id,
  }) {
    return LoginResponse(
      message: message ?? this.message,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'id': id,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      message: map['message'] as String,
      id: map['id'] as int,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory LoginResponse.fromJson(String source) => LoginResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginResponse(message: $message, id: $id)';

  @override
  bool operator ==(covariant LoginResponse other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message &&
      other.id == id;
  }

  @override
  int get hashCode => message.hashCode ^ id.hashCode;
}
