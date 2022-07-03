import 'package:flutter/material.dart';

import '../domain/product_domain.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({Key? key, required this.product}) : super(key: key);

  final ProductDomain product;

  @override
  State<CheckoutWidget> createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  final double heightMaster = 0.1;
  int? _valueRam = 0;
  int? _valueProcie = 0;
  double widthMaster = 0.1;
  double procWidth = 0;
  double ramHigh = 0;

  @override
  Widget build(BuildContext context) {
    final procSize = widget.product.procieVariant.length;
    final ramSize = widget.product.procieVariant.length;
    final fullWidth = MediaQuery.of(context).size.width;
    final fullHigh = MediaQuery.of(context).size.height / 4;
    final defaultWidth = fullWidth / procSize;
    final defaultHeight = fullHigh / ramSize;

    return LayoutBuilder(builder: (context, constraints) {
      return ListView(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: [
                AnimatedContainer(
                  color: Colors.green.shade200,
                  duration: Duration(milliseconds: 500),
                  height: ramHigh == 0 ? defaultHeight : ramHigh,
                  child: SizedBox(
                    width: 20,
                    child: Image.network(
                      widget.product.image,
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
                child: Image.network(
              widget.product.image,
              height: fullHigh,
            )),
          ],
        ),
        Row(
          children: [
            AnimatedContainer(
              color: Colors.red.shade200,
              duration: Duration(milliseconds: 500),
              width: procWidth == 0 ? defaultWidth : procWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 20,
                    child: Icon(
                      Icons.speed_rounded,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Flexible(
          child: Container(
            margin: const EdgeInsets.all(12),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Processor'),
                Wrap(
                    spacing: 8,
                    children: List.generate(
                      procSize,
                      (int index) {
                        return ChoiceChip(
                          label: Text(widget.product.procieVariant[index]),
                          padding: EdgeInsets.all(4),
                          selected: _valueProcie == index,
                          selectedColor: Colors.amber,
                          onSelected: (bool selected) {
                            setState(() {
                              _valueProcie = (selected ? index : null)!;
                              procWidth = defaultWidth * (index + 1);
                              print('procecor width $procWidth');
                            });
                          },
                        );
                      },
                    )),
                const Text('RAM'),
                Wrap(
                    spacing: 8,
                    children: List.generate(
                      widget.product.procieVariant.length,
                      (int index) {
                        return ChoiceChip(
                          label: Text('${widget.product.ramVariant[index]} GB'),
                          padding: EdgeInsets.all(4),
                          selected: _valueRam == index,
                          selectedColor: Colors.amber,
                          onSelected: (bool selected) {
                            setState(() {
                              _valueRam = (selected ? index : null)!;
                              ramHigh = defaultHeight * (index + 1);
                              print('ram width $ramHigh');
                            });
                          },
                        );
                      },
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  width: double.maxFinite,
                  child: ElevatedButton(
                      onPressed: () {}, child: Text('Beli Sekarang')),
                ),
              ],
            ),
          ),
        )
      ]);
    });
  }
}
