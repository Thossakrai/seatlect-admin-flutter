import 'package:flutter/material.dart';
import '../Model/requestItemModel.dart';

class RequestItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //mock data
    var item = RequestItem("Sawasdee Restaurant", ["thai"]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 10, left: 15),
            child: Text(
          "All request",
          style: Theme.of(context).textTheme.headline3,
        )),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                final snackBar = SnackBar(content: Text("Tap"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.amberAccent),
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(item.tags[0])),
                    Expanded(
                      child: Text(item.businessName),
                    ),
                    Text("DateTime"),
                    //TODO show right-arrow button when hover
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
