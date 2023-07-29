import '/models/models.dart';

abstract class BaseUserRepository {
  Stream<Users> getUser(String userId);
  Future<void> createUser(Users user);
  Future<void> updateUser(Users user);
}
