import 'package:bitcoin_ticker/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:bitcoin_ticker/utilities/crypto_card.dart';
import 'dart:io' show Platform;

Networking coinData = Networking();

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = Platform.isIOS ? 'AUD' : 'USD';
  bool isWaiting = false;
  Map<String, int> coinValues = {};

  dynamic currencyValue = '?';
  @override
  void initState() {
    super.initState();
    updateCurrency();
  }

  void updateCurrency() async {
    isWaiting = true;
    try {
      var currencyData = await coinData.getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = currencyData;
      });
    } catch (e) {
      print(e);
    }
  }

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) async {
        selectedCurrency = value;
        updateCurrency();
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];

    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) async {
        selectedCurrency = currenciesList[selectedIndex];
        updateCurrency();
      },
      children: pickerItems,
    );
  }

  List<CryptoCard> generateCards() {
    List<CryptoCard> cards = [];
    for (String crypto in cryptoList) {
      CryptoCard cryptoCard = CryptoCard(
        value: isWaiting ? '?' : coinValues[crypto],
        selectedCurrency: selectedCurrency,
        cryptoCurrency: crypto,
      );
      cards.add(cryptoCard);
    }
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: generateCards(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}
