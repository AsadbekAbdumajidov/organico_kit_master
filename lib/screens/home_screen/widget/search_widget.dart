import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/sizeconfig.dart';
import '../../../provider/them_provider.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: wi(20)),
      child: Container(
        height: he(48),
        width: wi(374),
        decoration: BoxDecoration(
          border: Border.all(color: textColor,width: 0.5),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: wi(20)),
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: textColor,
              ),
              Padding(
                padding: EdgeInsets.only(left: wi(20)),
                child: Text(
                  "Search anything here",
                  style: TextStyle(color: textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
