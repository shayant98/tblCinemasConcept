import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirestoreService _firestoreService = locator<FirestoreService>();

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    return user != null;
  }

  Stream<FirebaseUser> userAuthState() {
    return _firebaseAuth.onAuthStateChanged;
  }

  Future loginWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    try {
      final AuthResult authResult =
          await _firebaseAuth.signInWithCredential(credential);

      if (authResult.user != null) {
        _firestoreService.updateUser(authResult.user);
      }
      return authResult.user != null;
    } catch (e) {
      return e;
    }
  }

  logout() {
    _firebaseAuth.signOut();
    _googleSignIn.disconnect();
  }
}
