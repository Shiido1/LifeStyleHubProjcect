import 'package:flutter/material.dart';
import '../../model/view_account_network_response.dart';
import '../../viewmodel/network_viewmodel.dart';
import '../../../../../../../utils/pallets.dart';

import '../../../../../../../helper/helper_handler.dart';
import '../../model/generation_model.dart';

class MatrixDisplayWidget extends StatelessWidget {
  final Me? me;
  final ViewAccountNetworkResponse? network;
  final NetworkViewModel? networkViewModel;

  const MatrixDisplayWidget(
      {Key? key,
      this.me,
      required this.network,
      required this.networkViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: Pallets.orange300,
          child: Center(
            child: Text(
              network?.name?[0] ?? '',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.only(left: getDeviceWidth(context) * .05),
          width: getDeviceWidth(context) * .001,
          decoration: BoxDecoration(
              border:
                  Border(left: BorderSide(width: 1, color: Pallets.grey400))),
        ),
        ListView.builder(
            itemCount: network?.children?.length ?? 0,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, int index) {
              final _data = network?.children?[index];
              return Container(
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: _data?.id != 0
                                        ? Pallets.orange300
                                        : Pallets.grey300,
                                    child: Center(
                                      child: _data?.id != 0
                                          ? GestureDetector(
                                              onTap: () => networkViewModel!
                                                  .getNetworkAccountDetails(
                                                      _data!.id!),
                                              child: Text(
                                                '${_data?.name?[0]}',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            )
                                          : Icon(Icons.add,
                                              color: Pallets.grey400),
                                    ),
                                  ),
                                  // Container(
                                  //   height: getDeviceHeight(context) * .010,
                                  //   margin: EdgeInsets.only(
                                  //       left: getDeviceWidth(context) * .05),
                                  //   width: getDeviceWidth(context) * .001,
                                  //   decoration: BoxDecoration(
                                  //       border: Border(
                                  //           left: BorderSide(
                                  //               width: 1,
                                  //               color: Pallets.grey400))),
                                  // ),
                                ],
                              ),
                              Expanded(
                                  flex: 7,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 20),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Pallets.grey400))),
                                  )),
                              Expanded(flex: 1, child: SizedBox())
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: getDeviceHeight(context) * .08,
                              margin: EdgeInsets.only(
                                  left: getDeviceWidth(context) * .05),
                              width: getDeviceWidth(context) * .2,
                              decoration: BoxDecoration(
                                  border: Border(
                                      left: BorderSide(
                                          width: 1, color: Pallets.grey400))),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Container(
                                height: 45,
                                child: Row(children: [
                                  ..._data!.children!
                                      .map((grandChild) => Expanded(
                                          flex: 1,
                                          child: Container(
                                              child: Stack(
                                            children: [
                                              Container(
                                                // height:
                                                //     getDeviceHeight(context) *
                                                //         0.8,
                                                transform:
                                                    Matrix4.translationValues(
                                                        40, -35, 0),
                                                width: 1,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Pallets.grey400,
                                                      width: 1),
                                                ),
                                              ),
                                              CircleAvatar(
                                                radius: 40,
                                                backgroundColor:
                                                    grandChild.id != 0
                                                        ? Pallets.orange300
                                                        : Pallets.grey300,
                                                child: Center(
                                                    child: grandChild.id != 0
                                                        ? Text(
                                                            grandChild.name![0],
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          )
                                                        : Icon(Icons.add,
                                                            color: Pallets
                                                                .grey400)),
                                              ),
                                            ],
                                          ))))
                                      .toList()
                                ])),
                          )
                        ],
                      )
                    ]),
              );
            })
      ],
    );
  }
}
