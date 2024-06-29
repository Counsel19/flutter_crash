import "package:firebase_auth/firebase_auth.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:hello_flutter/services/auth_service.dart";

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(
    ref.read(
      firebaseAuthProvider,
    ),
  ),
);
