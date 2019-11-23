import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart';

CollectionReference get _movies => fb.firestore().collection("movies");

// Cria a Stream de documentos para usuários
Stream<List<DocumentSnapshot>> get streamMovies => _movies.onSnapshot.map(
      (QuerySnapshot query) =>
          query.docs.map((DocumentSnapshot doc) => doc).toList(),
    );

initFirebase() {
  fb.initializeApp(
    apiKey: "AIzaSyBOGb7SL4XwAyJITL3zGJkX_ZBTM5GCtvw",
    projectId: "moviesup2019b",
    databaseURL: "https://moviesup2019b.firebaseio.com",
  );
}
