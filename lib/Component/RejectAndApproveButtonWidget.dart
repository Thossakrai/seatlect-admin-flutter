import 'package:flutter/material.dart';

class RejectAndApproveButtonWidget extends StatelessWidget {
  RejectAndApproveButtonWidget(this._handleReject, this._handleApprove);
  Function _handleReject;
  Function _handleApprove;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          OutlinedButton(
            onPressed: _handleReject,
            child: Text("Reject"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
          ),
          Container(
            padding: EdgeInsets.all(5),
          ),
          OutlinedButton(
            onPressed: _handleApprove,
            child: Text("Approve"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
          )
        ],
      ),
    );
  }
}
