import 'package:animal_fact/CategoryPage.dart';
import 'package:animal_fact/FactPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './DataStore.dart';

void main() => runApp(MyApp());

List _pages = [FactPage(), CategoryPage()];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: AnimalBloc(),
      child: MaterialApp(
        home: Scaffold(
          appBar: buildAppBar(),
          body: Body(),
          bottomNavigationBar: MyBottomNav(),
          floatingActionButton: MyFav(),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            "FACT",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
          ),
          Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                'Animal',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
              )),
        ],
      ),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }
}

class MyBottomNav extends StatelessWidget {
  const MyBottomNav({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animalBloc = Provider.of<AnimalBloc>(context);
    return BottomNavigationBar(
      currentIndex: animalBloc.selectedPage,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.directions_boat), title: Text("Fact")),
        BottomNavigationBarItem(
            icon: Icon(Icons.category), title: Text("Category"))
      ],
      onTap: (index) {
        animalBloc.selectedPage = index;
      },
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final animalBloc = Provider.of<AnimalBloc>(context);
    return Container(child: _pages[animalBloc.selectedPage]);
  }
}

class MyFav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final animalBloc = Provider.of<AnimalBloc>(context);
    return animalBloc.selectedPage==0 ? FloatingActionButton(
      child: Icon(Icons.refresh),
      onPressed: () {
        animalBloc.selectedPage = 0;
      },
    ) : Container();
  }
}
