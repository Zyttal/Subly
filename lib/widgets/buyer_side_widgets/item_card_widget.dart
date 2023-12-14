import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget({
    super.key,
    required this.imgURL,
    required this.itemName,
    required this.itemPrice,
    required this.itemStore,
  });

  final String imgURL, itemName, itemStore;
  final double itemPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 120,
          width: 160,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(50, 0, 0, 0),
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                )
              ],
            ),
            child: Container(
              color: Colors.white,
              child: Image.network(
                imgURL,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    itemName,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "₱$itemPrice",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              Text(
                "from $itemStore",
                style: TextStyle(
                  fontSize: 8,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
