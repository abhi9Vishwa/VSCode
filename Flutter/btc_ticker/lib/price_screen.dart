import 'package:btc_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'dart:io' show Platform;
import 'converter.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

// coinapi key = 1EEA1906-3329-45ED-B7D9-27765029AF9A
class _PriceScreenState extends State<PriceScreen> {
  String seletedCurrency = 'USD';
  var ans = '???';
  var ansBTC = '???';
  var ansETH = '???';
  var ansLTC = '???';

  getDropDownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String currencyValue = currenciesList[i];
      var newItem = DropdownMenuItem(
        child: Text(currencyValue),
        value: currencyValue,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: seletedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          seletedCurrency = value!;
          convertedRates('BTC', seletedCurrency).then((value) {
            ansBTC = value;
            print(ansBTC);
          });
          convertedRates('ETH', seletedCurrency).then((value) {
            ansETH = value;
            print(ansETH);
          });
          convertedRates('LTC', seletedCurrency).then((value) {
            ansLTC = value;
            print(ansLTC);
          });
        });
      },
    );
  }

  getPickerItem() {
    List<Widget> pickerItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String optionValue = currenciesList[i];
      var newPicker = Text(optionValue);
      pickerItems.add(newPicker);
    }
    return CupertinoPicker(
      itemExtent: 33,
      onSelectedItemChanged: (selectedIndex) {
        // print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  convertedRates(String crypto, String realCurr) async {
    RateConverter rateConverter =
        await RateConverter(baseCrypto: crypto, baseCurrency: realCurr);
    String receivedRate = await rateConverter.getConvertedRates();
    setState(() {
      ans = receivedRate.toString();
    });
    print(ans);
    return ans;
    // print(ans);
  }

  // Widget getPlatform() {
  //   if (Platform.isIOS) {
  //     return getPickerItem();
  //   } else {
  //     return getDropDownItems();
  //   }
  // }
  @override
  void initState() {
    super.initState();
    // convertedRates('BTC', 'USD').then((value) {
    //   ansBTC = value;
    //   print(ansBTC);
    // });
    // convertedRates('ETH', 'USD').then((value) {
    //   ansETH = value;
    //   print(ansETH);
    // });
    // convertedRates('LTC', 'USD').then((value) {
    //   ansLTC = value;
    //   print(ansLTC);
    // });
    setState(() {
      // ansBTC = convertedRates('BTC', 'USD');
      convertedRates('BTC', 'USD').then((value) {
        ansBTC = value;
        print(ansBTC);
      });
      convertedRates('ETH', 'USD').then((value) {
        ansETH = value;
        print(ansETH);
      });
      convertedRates('LTC', 'USD').then((value) {
        ansLTC = value;
        print(ansLTC);
      });
      // ansETH = convertedRates('ETH', 'USD');
      // ansLTC = convertedRates('LTC', 'USD');
    });
  }

  @override
  Widget build(BuildContext context) {
    var dispCurr = seletedCurrency;
    setState(() {
      dispCurr = seletedCurrency;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.lightBlueAccent,
                    elevation: 5.0,
                    margin: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 28.0),
                      child: Text(
                        '1 BTC = $ansBTC $dispCurr ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.lightBlueAccent,
                    elevation: 5.0,
                    margin: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 28.0),
                      child: Text(
                        '1 ETH = $ansETH $dispCurr ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.lightBlueAccent,
                    elevation: 5.0,
                    margin: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 28.0),
                      child: Text(
                        '1 LTC = $ansLTC $dispCurr',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Color.fromARGB(255, 0, 95, 139),
            child: getDropDownItems(),
          ),
        ],
      ),
    );
  }
}
