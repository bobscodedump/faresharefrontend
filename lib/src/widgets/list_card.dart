import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final double amount;

  const ListCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    var owes = "Amount owed:";
    if (amount < 0) {
      owes = "You are owed:";
    }
    String formattedNumber = amount.toStringAsFixed(2);
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Icon(icon),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(owes),
                Text(formattedNumber),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
