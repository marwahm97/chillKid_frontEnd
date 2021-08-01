
import 'package:chill_kid_intership/adminInterface/accueil_admin/models/Informations.dart';
import 'package:flutter/material.dart';



import '../../constants.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    Key key,
    this.info,
  }) : super(key: key);

  final Information info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

            ],
          ),
          Text(
            info.title,
            overflow: TextOverflow.ellipsis,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${info.number} ",
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Colors.white70, ),
              ),

            ],
          )
        ],
      ),
    );
  }
}


