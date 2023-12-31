import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:go_spendr/models/models.dart';

abstract class BaseAuthRepository {
  Stream<auth.User?> get user;
  Future<auth.User?> signUp({
    required Users user,
    required String password,
  });
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> loginWithGoogle();
  Future<void> signOut();
}
