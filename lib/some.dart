/*Hethi sessionFirebase bech tnadiha kol mat7ebb te5dem b methode Firebase : auth.methodeXouY ..
FirebaseAuth auth = FirebaseAuth.instance;
var email = 'admin1@admin.com';
var pass = 'admin1';
Future<Function> zebi() async {
  print('rani d5alt l zebi');
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: 'admin1@admin.com', password: 'admin1');
    print('YEEEEEY HAW RABB L MAIL ' + userCredential.user.email.toString());
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
*/
