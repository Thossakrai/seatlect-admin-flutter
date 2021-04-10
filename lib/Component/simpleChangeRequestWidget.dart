import 'package:flutter/material.dart';

class SimpleChangeRequestWidget extends StatelessWidget {
  SimpleChangeRequestWidget(
      this.sectionTitle, this.oldRequest, this.newRequest);

  var sectionTitle;
  var oldRequest;
  var newRequest;

  @override
  Widget build(BuildContext context) {
    var customTextTheme = Theme.of(context).textTheme;
    bool isSimilar = oldRequest == newRequest;
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(sectionTitle, style: customTextTheme.headline3)),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(2),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 2,
                          color: isSimilar ? Colors.white : Colors.red)),
                  width: MediaQuery.of(context).size.width / 2.15,
                  child: Text(
                    oldRequest,
                    style: customTextTheme.bodyText1,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 2,
                          color: isSimilar ? Colors.white : Colors.green)),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: MediaQuery.of(context).size.width / 2.15,
                  child: Text(
                    newRequest,
                    style: customTextTheme.bodyText1,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
