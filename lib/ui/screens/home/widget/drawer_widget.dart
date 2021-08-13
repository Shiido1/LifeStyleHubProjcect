import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

Container getDrawer(BuildContext context) {
  return Container(
    width: getDeviceWidth(context) / 1.1,
    child: Drawer(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 23),
        children: [
          SizedBox(
            height: getDeviceHeight(context) / 10,
          ),
          Align(
              alignment: Alignment.topRight,
              child: ImageLoader(
                path: 'assets/svgs/x.svg',
                onTap: () => PageRouter.goBack(context),
              )),
          Row(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: ImageLoader(
                      isCircular: true,
                      radius: 40,
                      path:
                          'https://images.unsplash.com/photo-1558185348-fe8fa4cf631f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text:
                          'Abdul Obi TaiwoTaiwoTaiwoTaiwoTaiwoTaiwoTaiwoTaiwoTaiwoTaiwoTaiwoTaiwo ',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Pallets.grey700,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TextView(
                      text: 'Open notification',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Pallets.orange500,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Pallets.red500),
                  child: Center(
                    child: TextView(
                      text: '2',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Pallets.white,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 69,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            selectedTileColor: Pallets.orange500,
            leading: ImageLoader(
              path: 'assets/svgs/square_box.svg',
              height: 20,
              dColor: Pallets.grey400,
            ),
            title: TextView(
              text: 'Dashboard',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Pallets.grey400,
              textAlign: TextAlign.left,
            ),
            onTap: () => PageRouter.goBack(context),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ImageLoader(
              path: 'assets/svgs/marketing.svg',
              height: 20,
              dColor: Pallets.grey400,
            ),
            title: TextView(
              text: 'Marketting tools',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Pallets.grey400,
              textAlign: TextAlign.left,
            ),
            onTap: () => PageRouter.goBack(context),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ImageLoader(
              path: 'assets/svgs/network.svg',
              height: 20,
              dColor: Pallets.grey400,
            ),
            title: TextView(
              text: 'My network',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Pallets.grey400,
              textAlign: TextAlign.left,
            ),
            onTap: () => PageRouter.goBack(context),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ImageLoader(
              path: 'assets/svgs/stack.svg',
              height: 20,
              dColor: Pallets.grey400,
            ),
            title: TextView(
              text: 'My commission',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Pallets.grey400,
              textAlign: TextAlign.left,
            ),
            onTap: () => PageRouter.goBack(context),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ImageLoader(
              path: 'assets/svgs/trophy.svg',
              height: 20,
              dColor: Pallets.grey400,
            ),
            title: TextView(
              text: 'Contest & Reward',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Pallets.grey400,
              textAlign: TextAlign.left,
            ),
            onTap: () => PageRouter.goBack(context),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ImageLoader(
              path: 'assets/svgs/report.svg',
              height: 20,
              dColor: Pallets.grey400,
            ),
            title: TextView(
              text: 'Report',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Pallets.grey400,
              textAlign: TextAlign.left,
            ),
            onTap: () => PageRouter.goBack(context),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ImageLoader(
              path: 'assets/svgs/wallet.svg',
              height: 20,
              dColor: Pallets.grey400,
            ),
            title: TextView(
              text: 'Wallet',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Pallets.grey400,
              textAlign: TextAlign.left,
            ),
            onTap: () => PageRouter.goBack(context),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ImageLoader(
              path: 'assets/svgs/point.svg',
              height: 20,
              dColor: Pallets.grey400,
            ),
            title: TextView(
              text: 'Integrated point',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Pallets.grey400,
              textAlign: TextAlign.left,
            ),
            onTap: () => PageRouter.goBack(context),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ImageLoader(
              path: 'assets/svgs/messaging.svg',
              height: 20,
              dColor: Pallets.grey400,
            ),
            title: TextView(
              text: 'Messaging',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Pallets.grey400,
              textAlign: TextAlign.left,
            ),
            onTap: () => PageRouter.goBack(context),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ImageLoader(
              path: 'assets/svgs/ticketing.svg',
              height: 20,
              dColor: Pallets.grey400,
            ),
            title: TextView(
              text: 'Ticketing',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Pallets.grey400,
              textAlign: TextAlign.left,
            ),
            onTap: () => PageRouter.goBack(context),
          ),
        ],
      ),
    ),
  );
}
