import 'package:flutter/material.dart';

class BuyerSearchWidget extends StatelessWidget {
  const BuyerSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 15),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: const Color(0xFFAEAEAE),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
