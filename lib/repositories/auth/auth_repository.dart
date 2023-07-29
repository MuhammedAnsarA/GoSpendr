import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:go_spendr/models/models.dart';
import 'package:go_spendr/repositories/auth/base_auth_repository.dart';
import 'package:go_spendr/repositories/user/user_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository extends BaseAuthRepository {
  final auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final UserRepository _userRepository;

  AuthRepository({
    auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    required UserRepository userRepository,
  })  : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance,
        _googleSignIn =
            googleSignIn ?? GoogleSignIn.standard(scopes: ["email"]),
        _userRepository = userRepository;

  @override
  Future<auth.User?> signUp({
    required Users user,
    required String password,
  }) async {
    try {
      _firebaseAuth
          .createUserWithEmailAndPassword(
            email: user.email,
            password: password,
          )
          .then(
            (value) => _userRepository.createUser(
              user.copyWith(id: value.user!.uid),
            ),
          );
    } catch (_) {}
  }

  @override
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (_) {}
  }

  @override
  Stream<auth.User?> get user => _firebaseAuth.userChanges();

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> loginWithGoogle() async {
    try {
      late final auth.AuthCredential credential;

      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;

      credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      _firebaseAuth.signInWithCredential(credential).then((value) {
        _userRepository.createUser(Users(
          id: value.user!.uid,
          fullName: value.user!.displayName ?? "",
          email: value.user!.email ?? "",
        ));
      });
    } catch (_) {}
  }
}
