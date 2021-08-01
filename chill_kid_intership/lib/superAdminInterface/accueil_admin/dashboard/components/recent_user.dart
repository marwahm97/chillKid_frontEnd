
import 'package:chill_kid_intership/adminInterface/accueil_admin/models/RecentUser.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class recentUser extends StatelessWidget {
  const recentUser({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color:Colors.grey[200],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Member",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("Nom d'utilisateur"),
                ),
                DataColumn(
                  label: Text("Numéro deTéléphone"),
                ),

              ],
              rows: List.generate(
                demoRecentUser.length,
                (index) => recentFileDataRow(demoRecentUser[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(RecentUser userInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(userInfo.title),
            ),
          ],
        ),
      ),
      DataCell(Text(userInfo.date)),

    ],
  );
}
