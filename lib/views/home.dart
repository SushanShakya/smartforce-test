import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smartforce/constants/strings.dart';
import 'package:smartforce/models/post.dart';
import 'package:smartforce/repository/for_you_repo.dart';
import 'package:smartforce/repository/trending_repo.dart';
import 'package:smartforce/views/widgets/post_widget.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ForYouRepo repo;
  TrendingRepo tRepo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repo = ForYouRepo();
    tRepo = TrendingRepo();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            APPNAME,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey.shade400,
            tabs: [
              Tab(text: FORYOU),
              Tab(text: TRENDING),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StreamBuilder<List<Post>>(
              stream: repo.getPosts(),
              builder: (c, s) {
                if (s.hasData) {
                  return ListView.separated(
                    separatorBuilder: (c, i) => SizedBox(height: 10),
                    itemCount: s.data.length,
                    itemBuilder: (c, i) {
                      var post = s.data[i];
                      return PostWidget(post: post);
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
            StreamBuilder<List<Post>>(
              stream: tRepo.getPosts(),
              builder: (c, s) {
                if (s.hasData) {
                  return ListView.separated(
                    separatorBuilder: (c, i) => SizedBox(height: 10),
                    itemCount: s.data.length,
                    itemBuilder: (c, i) {
                      var post = s.data[i];
                      return PostWidget(post: post);
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            )
          ],
        ),
      ),
    );
  }
}
