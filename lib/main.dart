import 'package:flutter/material.dart';
import 'package:parse_json_all/model/api_list_model.dart';
import 'package:parse_json_all/services/api_list_service.dart';
import 'package:parse_json_all/ui/api_endpoints/api_endpoints_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: getApiList(),
        builder: (ctx, snap) {
          return ListView.separated(
            itemCount: snap.data.apiList.length,
            separatorBuilder: (ctx, index) => Divider(
                  color: Colors.green,
                  height: 10.0,
                ),
            itemBuilder: (ctx, index) {
              Api api = snap.data.apiList[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(api.index.toString()),
                ),
                title: Text(api.title),
                subtitle: Text(api.url),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ApiEndpointsPage(
                        appBarTitle: api.title,
                      );
                    }
                  ));
                },
              );
            },
          );
        },
      ),
    );
  }
}


