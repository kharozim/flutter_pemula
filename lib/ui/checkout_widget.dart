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
  double ramWidth = 0;

  @override
  Widget build(BuildContext context) {
    final procSize = widget.product.procieVariant.length;
    final ramSize = widget.product.ramVariant.length;
    final fullWidth = MediaQuery.of(context).size.width - 18;
    final defaultProcWidth = fullWidth / procSize;
    final defaultRamWidth = fullWidth / ramSize;

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return _showLayoutPortrait(
            defaultRamWidth, fullWidth, defaultProcWidth, procSize);
      } else {
        return _showLayoutLanscape(
            defaultRamWidth, fullWidth, defaultProcWidth, procSize);
      }
    });
  }

  _showLayoutPortrait(
    defaultRamWidth,
    fullWidth,
    defaultProcWidth,
    procSize,
  ) =>
      ListView(children: [
        Image.network(
          widget.product.image,
          height: fullWidth / 2,
        ),
        Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: procWidth == 0 ? defaultProcWidth : procWidth,
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
        Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: ramWidth == 0 ? defaultRamWidth : ramWidth,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
                color: Colors.green.shade200,
              ),
              padding: EdgeInsets.only(right: 12.0),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('RAM'),
                    Icon(
                      Icons.speed_rounded,
                    ),
                  ],
                ),
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
              Divider(),
              Text(widget.product.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue)),
              const SizedBox(height: 4),
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
                            procWidth = defaultProcWidth * (index + 1);
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
                            ramWidth = defaultRamWidth * (index + 1);
                            print('ram width $ramWidth');
                          });
                        },
                      );
                    },
                  )),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Terimakasih Telah Berbelanja!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pop(context);
                    },
                    child: Text('Bayar')),
              ),
            ],
          ),
        )
      ]);

  _showLayoutLanscape(
    double defaultRamWidth,
    double fullWidth,
    double defaultProcWidth,
    int procSize,
  ) =>
      ListView(children: [
        Row(
          children: [
            Flexible(
              child: Column(
                children: [
                  Image.network(
                    widget.product.image,
                    height: fullWidth / 5,
                  ),
                  Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: procWidth == 0 ? (defaultProcWidth / 2) : (procWidth/2),
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
                  Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: ramWidth == 0 ? (defaultRamWidth /2) : (ramWidth/2),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                          color: Colors.green.shade200,
                        ),
                        padding: EdgeInsets.only(right: 12.0),
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text('RAM'),
                              Icon(
                                Icons.speed_rounded,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.all(12),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    Text(widget.product.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue)),
                    const SizedBox(height: 4),
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
                                  procWidth = defaultProcWidth * (index + 1);
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
                              label: Text(
                                  '${widget.product.ramVariant[index]} GB'),
                              padding: EdgeInsets.all(4),
                              selected: _valueRam == index,
                              selectedColor: Colors.amber,
                              onSelected: (bool selected) {
                                setState(() {
                                  _valueRam = (selected ? index : null)!;
                                  ramWidth = defaultRamWidth * (index + 1);
                                  print('ram width $ramWidth');
                                });
                              },
                            );
                          },
                        )),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      width: double.maxFinite,
                      child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Terimakasih Telah Berbelanja!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Text('Bayar')),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ]);
}
