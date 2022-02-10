import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:provider/provider.dart';

import '../screens/onboarding/tabs/model/country_model.dart';
import '../screens/onboarding/viewmodel/information_viewmodel.dart';

class CountryList extends StatefulWidget {
  final Function(CountryModel model) onTap;
  const CountryList({required this.onTap, Key? key}) : super(key: key);

  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  InformationViewModel? _informationViewModel;

  @override
  void initState() {
    _informationViewModel =
        Provider.of<InformationViewModel>(context, listen: false);
    _informationViewModel?.init(context);
    _informationViewModel?.getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<InformationViewModel>(builder: (_, provider, __) {
        if (provider.loading) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: [
            ...provider.countryModel
                .map((country) => ListTile(
                      onTap: () {
                        widget.onTap(country);
                        PageRouter.goBack(context);
                      },
                      title: Text(country.name ?? ''),
                    ))
                .toList()
          ],
        );
      }),
    );
  }
}
