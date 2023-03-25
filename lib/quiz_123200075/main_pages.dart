import 'package:flutter/material.dart';
import 'detail_pages.dart';
import 'game_store.dart';

class MainPages extends StatelessWidget {
  const MainPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Game Store'),
          centerTitle: true,
        ),
        body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            final GameStore place = gameList[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>DetailPages(game: place, favorite: [],),
                  ),
                );
              },
            child: Card(
            child: Row(
            children: [
            Container(
            width:MediaQuery.of(context).size.width/3,
            height:MediaQuery.of(context).size.width/3,
            // child: Image.network(place.imageUrls),
            ),
            Text(place.name),
            Text(place.price),
            ],
            )
            ),// subtitle: Text(place.price),
            );
          },
        ),
       ),
      ),
    );
  }
}
