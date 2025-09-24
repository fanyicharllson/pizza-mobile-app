import '../entities/entities.dart';

class MyUser {
  final String userId;
  final String email;
  final String name;
  final bool hasActiveCard;

  MyUser({
    required this.userId,
    required this.email,
    required this.name,
    required this.hasActiveCard,
  });

  static final empty = MyUser(
    userId: '',
    email: '',
    name: '',
    hasActiveCard: false,
  );

  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId,
      email: email,
      name: name,
      hasActiveCard: hasActiveCard,
    );
  }

  // From entity, constitute data that we will use in our app
  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      userId: entity.userId,
      email: entity.email,
      name: entity.name,
      hasActiveCard: entity.hasActiveCard,
    );
  }

  @override
  String toString() {
    return 'MyUser: $userId, $name, $email, $hasActiveCard';
  }
}
