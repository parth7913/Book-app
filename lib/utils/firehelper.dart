import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireHelper {
  FireHelper._();

  static FireHelper fireHelper = FireHelper._();
  String? Uid;

// Signup User
  Future<bool> signupUser(String email, String password) async {
    bool issignup = false;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
      (value) {
        issignup = true;
      },
    ).catchError((error) {
      issignup = false;
    });
    return issignup;
  }

  // Sign In User
  Future<bool> signinUser(String email, String password) async {
    bool insignin = false;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      insignin = true;
    }).catchError(
      (error) {
        insignin = false;
      },
    );
    return insignin;
  }

  // Cheack Login
  Future<bool> cheacklogin() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    if (await firebaseAuth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  // Sign Out
  Future<bool> signout() async {
    bool insingout = false;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((value) {
      insingout = true;
    }).catchError((error) {
      insingout = false;
    });
    return insingout;
  }

  // ---------------google  firebase------------//
  Future<bool> signInWithGoogle() async {
    bool isLogin = false;
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      isLogin = true;
    }).catchError((error) {
      isLogin = false;
    });

    return isLogin;
  }


  //----------------------- book ------------------------------//

  Future<bool> addbook(String name, String other, String image, String rating,
      String Pyear) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    bool isbook = false;
    await firebaseFirestore.collection("Book").doc(Uid).collection("Bk").add({
      "name": name,
      "Other": other,
      "image": image,
      "Rating ": rating,
      "Publish_Year": Pyear
    }).then((value) {
      isbook = true;
    }).catchError((error) {
      isbook = false;
    });
    return isbook;
  }

// read getBook

  Stream<QuerySnapshot<Map<String, dynamic>>> getbook() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return firestore.collection("Book").doc(Uid).collection("Bk").snapshots();
  }

// Delet Book
  void delet(String id) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("Book").doc(Uid).collection("Bk").doc(id).delete();
  }

  // Update Book Name
  void Update(String id, String name) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection("Book")
        .doc(Uid)
        .collection("Bk")
        .doc(id)
        .update({"name": name});
  }

  // Uri Id
  void UserData() {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    User? user = firebaseAuth.currentUser;
    Uid = user!.uid;
  }
}
