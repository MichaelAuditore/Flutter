import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../utilities/constants.dart';

class Networking {
  Map<String, int> cryptoPrices = {};

  Future getCoinData(String coinSelected) async {
    for (String crypto in cryptoList) {
      String url =
          'https://apiv2.bitcoinaverage.com/indices/global/ticker/$crypto$coinSelected';
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var decodeData = convert.jsonDecode(response.body);
        var coinValue = decodeData['last'];
        cryptoPrices[crypto] = coinValue.toInt();
      } else
        print(response.statusCode);
    }
    return cryptoPrices;
  }
}
