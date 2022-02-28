import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/sizeconfig.dart';
import '../../../provider/notif_provider.dart';
import '../../../provider/them_provider.dart';

class AppContainerProfileWidget extends StatelessWidget {
  const AppContainerProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;

    return Padding(
      padding: EdgeInsets.only(top: he(35),left: wi(15),right: wi(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Profile",
            style: TextStyle(
                color: textColor, fontFamily: "poppins", fontSize: 22),
          ),
          IconButton(
            onPressed: () {
              context.read<NotifProvider>().tap();
            },
            icon: Icon(
              context.watch<NotifProvider>().notifification == true
                  ? Icons.notifications_none_outlined
                  : Icons.notifications_off_outlined,
              size: 38,
              color: const Color.fromRGBO(12, 114, 100, 1),
            ),
          ),
        ],
      ),
    );
  }
}
