class User {
  final String user;
  final String phone;
  final DateTime checkin;

  const User({
    required this.user,
    required this.phone,
    required this.checkin,
  });

  User copy({
    String? user,
    String? phone,
    DateTime? checkin,
  }) =>
      User(
        user: user ?? this.user,
        phone: phone ?? this.phone,
        checkin: checkin ?? this.checkin,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          user == other.user &&
          phone == other.phone &&
          checkin == other.checkin;

  @override
  int get hashCode => user.hashCode ^ phone.hashCode ^ checkin.hashCode;
}

String convertToAgo(DateTime checkin) {
  Duration diff = DateTime.now().difference(checkin);

  if (diff.inDays >= 1) {
    return '${diff.inDays} day(s) ago';
  } else if (diff.inHours >= 1) {
    return '${diff.inHours} hour(s) ago';
  } else if (diff.inMinutes >= 1) {
    return '${diff.inMinutes} minute(s) ago';
  } else if (diff.inSeconds >= 1) {
    return '${diff.inSeconds} second(s) ago';
  } else {
    return 'just now';
  }
}
