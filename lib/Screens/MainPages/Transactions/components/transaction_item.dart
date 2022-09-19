import 'package:flutter/material.dart';
import 'package:instapay/Screens/MainPages/Transactions/transaction_details.dart';
import '../../../../components/constants.dart';

class TransactionItem extends StatelessWidget {
  final String fullName;
  final String status;
  final String imageUrl;
  final String amount;

  const TransactionItem(
      {Key? key,
      required this.fullName,
      required this.status,
      required this.imageUrl,
      required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TransactionsDetails(
                      color: kWeightBoldColor,
                      letter: "A",
                      price: "537.980",
                      subTitle: "subTitle",
                      title: "Anxowin")));
          /*
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TransactionPage(
                      color: kPrimaryColor,
                      letter: "A",
                      price: "1.909.378",
                      subTitle: "18/09/22 15:47",
                      title: "Anxowin")));
                      */
        },
        child: Row(children: [
          // Image du provider
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Expediteur et Date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nom complet de l'expéditeur
                Text(
                  fullName,
                  style: const TextStyle(
                    color: kBoldTextColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Date de la transaction
                Text(
                  "18/09/22  15:09",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Text(
            (status == "received" ? "+ " : "- ") + amount + " F",
            style: TextStyle(
              color: status == "received" ? Colors.green : Colors.red,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(Icons.keyboard_arrow_right),
        ]),
      ),
    );
  }
}
