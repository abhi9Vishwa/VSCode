import 'dart:convert';

import 'package:http/http.dart';

class RateConverter {
  String baseCurrency;
  String baseCrypto;

  RateConverter({required this.baseCrypto, required this.baseCurrency});

  Future<String> getConvertedRates() async {
    try {
      print('$baseCrypto $baseCurrency');
      String urlLink =
          'https://rest.coinapi.io/v1/exchangerate/$baseCrypto/$baseCurrency?apiKey=1EEA1906-3329-45ED-B7D9-27765029AF9A';
      print(urlLink);
      Response response = await get(Uri.parse(urlLink));
      if (response.statusCode == 200) {
        String data = await response.body;
        print(data);
        double exchangeRate = jsonDecode(response.body)['rate'];
        int exchangeRateInt = exchangeRate.toInt();
        return exchangeRateInt.toString();
      } else {
        return ('the error code is ${response.statusCode}');
      }
    } catch (e) {
      return '$e';
    }
  }
}
