import 'package:flutter/material.dart';
import 'game_store.dart';

class DetailPages extends StatefulWidget {
  final GameStore game;
  final List<GameStore> favorite;
  const DetailPages({Key? key, required this.game, required this.favorite})
      : super(key: key);

  @override
  State<DetailPages> createState() => _DetailPagesState();
}

class _DetailPagesState extends State<DetailPages> {
  bool isFavorite = false;

  setFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        widget.favorite.add(widget.game);
      } else {
        widget.favorite.remove(widget.game);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    isFavorite = widget.favorite.contains(widget.game);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${widget.game.name}'),
         //  actions: [
         //    IconButton(
         //        onPressed: () {
         //          launchUrl(widget.game.linkStore);
         //          print(widget.game.linkStore);
         //        },
         //        icon: const Icon(Icons.share))
         // ],
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.game.imageUrls.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              widget.game.imageUrls[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                setFavorite();
                              },
                              icon: Icon(Icons.favorite,
                                  color: isFavorite ? Colors.red : Colors.grey),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.money),
                            Text(
                              'Rp ${widget.game.price}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.star),
                            Text(
                              '${widget.game.reviewAverage}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.shopping_cart),
                            Text(
                              '${widget.game.releaseDate}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Description: ${widget.game.about}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
