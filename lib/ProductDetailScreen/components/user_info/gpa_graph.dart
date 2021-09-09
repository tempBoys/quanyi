import 'package:flutter/material.dart';
import 'package:quanyi/models/constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GpaGraph extends StatelessWidget {
  final String satisfication;
  final double percentage;
  GpaGraph({Key? key, required this.satisfication, required this.percentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Row(
        children: [
          Text(
            satisfication,
            textScaleFactor: 0.9,
            style: TextStyle(color: kTextColor),
          ),
          SizedBox(width: 5),
          Container(
            width: 80,
            child: SfLinearGauge(
                showTicks: false,
                showLabels: false,
                axisTrackStyle: LinearAxisTrackStyle(
                    thickness: 5, edgeStyle: LinearEdgeStyle.bothCurve),
                minimum: 0,
                maximum: 10,
                barPointers: [
                  LinearBarPointer(
                    value: percentage,
                    thickness: 5,
                    edgeStyle: LinearEdgeStyle.bothCurve,
                    color: Colors.redAccent[400],
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
