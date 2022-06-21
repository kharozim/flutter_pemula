import 'package:flutter/material.dart';
import 'package:flutter_pemula/utils/formatter_utils.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'dummy/dummy_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _BodyContent(),
    );
  }

  _BodyContent() => SafeArea(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return MasonryGridView.count(
          padding: EdgeInsets.all(8),
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemCount: listDummy.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      listDummy[index].image,
                      width: constraints.maxHeight,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 8.0),
                            color: _getColor(listDummy[index].tag),
                            child: Text(
                              listDummy[index].tag,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Colors.white70),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listDummy[index].name,
                            style: TextStyle(
                              color: Colors.grey[900],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            FormatterUtils.convertToIdr(listDummy[index].price),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                    color: Colors.red.shade100,
                                    borderRadius: BorderRadius.circular(4)),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 1, horizontal: 4),
                                child: Text(
                                  '${listDummy[index].discount}%',
                                  style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                _getBrutoPrice(listDummy[index].discount,
                                    listDummy[index].price),
                                style: const TextStyle(
                                    fontSize: 10,
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 15,
                              ),
                              Text(
                                '${listDummy[index].rating.toString()} / Terjual ${listDummy[index].sold}',
                                style: const TextStyle(color: Colors.black45),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }));

  _getColor(String tag) {
    var color;
    if (tag.contains('favorit')) {
      color = Colors.blue.shade600;
    } else if (tag.contains('terlaris')) {
      color = Colors.green.shade600;
    } else {
      color = Colors.brown.shade600;
    }
    return color;
  }

  String _getBrutoPrice(int discount, int price) {
    final discountPrince = (discount * price) / 100;
    final brutoPrice = discountPrince + price;
    return FormatterUtils.convertToIdr(brutoPrice);
  }
}
