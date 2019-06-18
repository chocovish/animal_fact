import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
//import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import './DataStore.dart';

Dio dio = Dio();

class FactPage extends StatelessWidget {
  Future<String> getFacts(String selectedCat) async {
    var r = "";
    try {
      Response response =
          await dio.get("http://uraqt.xyz/api/animalfacts/animal/$selectedCat");
      //print('got response : $response');
      //print(await http.read("https://random.dog/woof.json"));
      r = response.toString();
    } catch (e) {
      print(e);
    }
    return r;
  }

  @override
  Widget build(BuildContext context) {
    final animalBloc = Provider.of<AnimalBloc>(context);

    return Container(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${animalBloc.selectedCat} fact:"),
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: getFacts(animalBloc.selectedCat),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return snapshot.connectionState == ConnectionState.done
                    ? Text(
                        snapshot.data,
                        style: TextStyle(
                            fontSize: 42,
                            fontFamily: 'handwriting',
                            fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      )
                    : CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
