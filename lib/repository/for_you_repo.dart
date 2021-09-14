import 'package:smartforce/constants/collections.dart';
import 'package:smartforce/models/post.dart';
import 'package:smartforce/repository/repo.dart';

class ForYouRepo extends Repo {
  Stream<List<Post>> getPosts() =>
      db.collection(FORYOUCOLLECTION).snapshots().map((event) =>
          List<Post>.from(event.docs.map((e) => Post.fromMap(e.data()))));
}
