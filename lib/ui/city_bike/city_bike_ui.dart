import 'package:flutter/material.dart';
import 'package:parse_json_all/model/city_bike_model.dart';
import 'package:parse_json_all/services/city_bike_service.dart';

/**
 * Either Stateless or Statefull
 */
class CityBikeUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getCityBikeNetworksList(),
        builder: (context, snap) {
          if (snap.hasData) {
            return ListView.separated(
              itemCount: snap.data.networks.length,
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.teal,
                  height: 10.0,
                );
              },
              itemBuilder: (context, index) {
                Networks cityBikeNetwork = snap.data.networks[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(cityBikeNetwork.name[0]),
                  ),
                  title: Text(
                    cityBikeNetwork.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    cityBikeNetwork.location.city
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
