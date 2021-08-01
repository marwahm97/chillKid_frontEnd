import 'package:flutter/material.dart';
import '../../constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StarageDetails extends StatelessWidget {
  const StarageDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Session Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          StorageInfoCard(
            title: "Fitness",
            amountOfFiles: "100",

          ),
          StorageInfoCard(
            title: "Musculation",
            amountOfFiles: "90",

          ),
          StorageInfoCard(
            title: "Natation",
            amountOfFiles: "80",

          ),
          StorageInfoCard(
            title: "Karaté",
            amountOfFiles: "50",

          ),
        ],
      ),
    );
  }
}
