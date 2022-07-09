import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_pemula/domain/product_domain.dart';
import 'package:flutter_pemula/dummy/dummy_data.dart';
import 'package:flutter_pemula/utils/formatter_utils.dart';

import 'checkout_widget.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.productId}) : super(key: key);
  final int productId;

  @override
  Widget build(BuildContext context) {
    final product = listDummy.where((element) => element.id == productId).first;

    return Scaffold(
        appBar: AppBar(title: Text('Detail')), body: _bodyContent(product));
  }

  String _getBrutoPrice(int discount, int price) {
    final discountPrince = (discount * price) / 100;
    final brutoPrice = discountPrince + price;
    return FormatterUtils.convertToIdr(brutoPrice);
  }

  void _showConfirmation(ProductDomain product, BuildContext context) {
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        builder: (BuildContext dialogContex) {
          return CheckoutWidget(product: product);
        });
  }

  _bodyContent(ProductDomain product) => LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return _setLayoutLanscape(context, product);
        } else {
          return _setLayoutPortrait(context, product);
        }
      });

  _setLayoutPortrait(BuildContext context, ProductDomain product) =>
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.image),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                  Text(
                    FormatterUtils.convertToIdr(product.price),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            borderRadius: BorderRadius.circular(4)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 4),
                        child: Text(
                          '${product.discount}%',
                          style: const TextStyle(
                              fontSize: 11,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _getBrutoPrice(product.discount, product.price),
                        style: const TextStyle(
                            fontSize: 10,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Terjual ${product.sold}"),
                      SizedBox(width: 8),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 2),
                            RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: FontSize.small.size,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: product.rating.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: " (${product.sold.toString()})"),
                                  ]),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Divider(thickness: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Html(data: product.description),
            ),
            Container(
                margin: EdgeInsets.all(12.0),
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: () {
                      _showConfirmation(product, context);
                    },
                    child: Text('Beli Sekarang')))
          ],
        ),
      );

  _setLayoutLanscape(BuildContext context, ProductDomain product) =>
      SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
                child: Image.network(product.image)),
            Flexible(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(fontSize: 18,color : Colors.blue),
                    ),
                    Text(
                      FormatterUtils.convertToIdr(product.price),
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              borderRadius: BorderRadius.circular(4)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 4),
                          child: Text(
                            '${product.discount}%',
                            style: const TextStyle(
                                fontSize: 11,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _getBrutoPrice(product.discount, product.price),
                          style: const TextStyle(
                              fontSize: 10,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Terjual ${product.sold}"),
                        SizedBox(width: 8),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 14,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 2),
                              RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: FontSize.small.size,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: product.rating.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: " (${product.sold.toString()})"),
                                    ]),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const Divider(thickness: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Html(data: product.description),
                    ),
                    Container(
                        margin: EdgeInsets.all(12.0),
                        child: ElevatedButton(
                            onPressed: () {
                              _showConfirmation(product, context);
                            },
                            child: Text('Beli Sekarang')))
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
