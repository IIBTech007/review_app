
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:review_app/Controllers/FeedbackController.dart';
import 'package:review_app/Controllers/OverallReportController.dart';
import 'package:review_app/Utils/Utils.dart';

class BusinessReport extends StatefulWidget {
  int businessId;

  BusinessReport(this.businessId);

  @override
  _BusinessReportState createState() => _BusinessReportState();
}

class _BusinessReportState extends State<BusinessReport> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final _reportController = Get.put(OverallReportController());
  Map<String, double> dataMap = {
    "Positive Rating": 0,
    "Negetive Rating": 0,
  };
  List<Color> colorList = [
    Colors.red,
    Colors.yellow,
    Colors.green,
  ];
  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Overall Report")),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: ()async{
          return Utils.check_connectivity().then((isConnected){
            if(isConnected){
              _reportController.getOverallReport(widget.businessId, 30, context);
            }
          });
      },
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child:Obx((){
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Monthly Report",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Visibility(
                          visible: _reportController.dataMap!=null,
                            child: PieChart(
                              dataMap: _reportController.dataMap!=null&&_reportController.dataMap.isNotEmpty?_reportController.dataMap:dataMap,
                              chartType: ChartType.disc,
                              animationDuration: Duration(milliseconds: 800),
                              chartLegendSpacing: 20,
                              chartRadius: MediaQuery.of(context).size.width / 2.7,
                              colorList: colorList,
                              initialAngleInDegree: 0,
                              ringStrokeWidth: 32,
                              legendOptions: LegendOptions(
                                showLegendsInRow: false,
                                legendPosition: LegendPosition.right,
                                showLegends: true,
                                legendTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              chartValuesOptions: ChartValuesOptions(
                                showChartValueBackground: true,
                                showChartValues: true,
                                showChartValuesInPercentage: true,
                                showChartValuesOutside: false,
                                decimalPlaces: 1,
                              ),
                            ),
                          ),
                            ],
                          ) ;
                        })
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
