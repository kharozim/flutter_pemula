import 'package:flutter/material.dart';
import 'package:flutter_pemula/utils/formatter_utils.dart';

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
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.7),
            itemCount: listDummy.length,
            itemBuilder: (context, index) {
              return Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Image.network(
                          listDummy[index].image,
                          width: constraints.maxHeight,
                          fit: BoxFit.cover,
                        ),
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
                                    fontSize: 10, color: Colors.white70),
                              )),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(listDummy[index].name),
                              const SizedBox(height: 4),
                              Text(
                                FormatterUtils.convertToIdr(
                                    listDummy[index].price),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
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
}
