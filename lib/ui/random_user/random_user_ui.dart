import 'package:flutter/material.dart';
import 'package:parse_json_all/model/random_user_model.dart';
import 'package:parse_json_all/services/random_user_service.dart';
import 'package:parse_json_all/ui/random_user/random_user_profile.dart';

class RandomUserUi extends StatefulWidget {
  @override
  _RandomUserUiState createState() => _RandomUserUiState();
}

class _RandomUserUiState extends State<RandomUserUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getRandomUsers(),
        builder: (ctx, snap){
          if (snap.connectionState == ConnectionState.done) {
            return ListView.separated(
              itemCount: snap.data.results.length,
              separatorBuilder: (ctx, index) {
                return Divider(
                  height: 10.0,
                  color: Colors.green,
                );
              },
              itemBuilder: (ctx, index) {
                Results results = snap.data.results[index];
                return ListTile(
                  leading: ClipOval(
                    child: Image.network(results.picture.thumbnail),
                  ),
                  title: Text(
                    results.name.first + " " + results.name.last
                  ),
                  subtitle: Text(
                    results.email
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return RandomUserProfile(
                          results: results,
                        );
                      }
                    ));
                  },
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}