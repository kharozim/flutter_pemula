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
    final ramSize = widget.product.ramVariant.length;
    final fullWidth = MediaQuery.of(context).size.width - 18;
    final fullHigh = MediaQuery.of(context).size.height / 4;
    final defaultWidth = fullWidth / procSize;
    final defaultHeight = fullHigh / ramSize;

    return ListView(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Column(
              children: [
                Container(
                    height: ramHigh == 0 ? defaultHeight : ramHigh,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12),
                          topLeft: Radius.circular(12)),
                      color: Colors.green.shade200,
                    ),
                    padding: const EdgeInsets.only(top: 12),
                    child: Column(
                      children: [
                        const Icon(Icons.speed_rounded),
                        ramHigh > defaultHeight
                            ? const RotatedBox(
                                quarterTurns: -1, child: Text('RAM'))
                            : const SizedBox()
                      ],
                    )),
              ],
            ),
          ),
          Image.network(
            widget.product.image,
            height: fullHigh + 18,
          ),
          SizedBox(width: 20)
        ],
      ),
      Row(
        children: [
          Container(
            width: procWidth == 0 ? defaultWidth : procWidth,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              color: Colors.red.shade200,
            ),
            padding: EdgeInsets.only(right: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text('PROC'),
                Icon(
                  Icons.speed_rounded,
                ),
              ],
            ),
          ),
        ],
      ),
      Container(
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
                  widget.product.ramVariant.length,
                  (int index) {
                    print(index);
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
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: double.maxFinite,
              child: ElevatedButton(
                  onPressed: () {}, child: Text('Beli Sekarang')),
            ),
          ],
        ),
      )
    ]);
  }
}
