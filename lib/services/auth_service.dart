import 'package:bltCinemas/app/locator.dart';
import 'package:bltCinemas/model/user_model.dart';
import 'package:bltCinemas/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirestoreService _firestoreService = locator<FirestoreService>();

  String _currentUser;
  String get currentUser => _currentUser;

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    populateCurrentUser(user);
    return user != null;
  }

  Stream<FirebaseUser> userAuthState() {
    return _firebaseAuth.onAuthStateChanged;
  }

  Future loginWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final AuthResult authResult =
          await _firebaseAuth.signInWithCredential(credential);

      User user = User(
        id: authResult.user.uid,
        displayName: authResult.user.displayName,
        photoUrl: authResult.user.photoUrl,
        email: authResult.user.email,
      );
      _firestoreService.updateUser(user);
      populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  logout() {
    _firebaseAuth.signOut();
    _googleSignIn.disconnect();
  }

  populateCurrentUser(FirebaseUser user) {
    if (user != null) {
      _currentUser = user.uid;
    }
  }
}
