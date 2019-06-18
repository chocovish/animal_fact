import 'package:flutter/material.dart';
import './DataStore.dart';
import 'package:provider/provider.dart';





class CategoryPage extends StatelessWidget {

  final _categories = ['cat', 'dog', 'cow','jellyfish'];
  
  @override
  Widget build(BuildContext context) {
    final animalBloc = Provider.of<AnimalBloc>(context);
    return Container(
      //height: 600,
      child: ListView.builder(
        itemCount: _categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 130,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 400,
                    child: InkWell(
                      child: Card(
                        child: Image.asset("assets/${_categories[index]}.jpg",
                            fit: BoxFit.cover),
                      ),
                      onTap: (){
                        animalBloc.selectedCat = _categories[index];
                      },
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                         animalBloc.selectedCat==_categories[index] ? 'Selected' : "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
