import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],

        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          elevation: 0,
          title: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0,30,0.0,0.0),
              child: Text(

                    'Crypto World',
                    style: GoogleFonts.raleway(fontSize: 30,color: Colors.blueGrey[900]),
              ),
            ),
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(height: 10,),
            CoinCard(
              imageurl: 'https://bitcoin.org/img/icons/opengraph.png?1651392467',
              name:'Bitcoin',
              symbol: 'BTC',
              price: 3000,
              change: -125 ,
              changepercentage: -2.5,
            )
          ],
        ),
      ),
    );
  }
}

class CoinCard extends StatelessWidget {
  CoinCard({
    required this.name,
    required this.symbol,
    required this.imageurl,
    required this.price,
    required this.change,
    required this.changepercentage,

  });
  String name;
  String symbol;
  String imageurl;
  double price;
  double change;
  double changepercentage;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(4,4),
              blurRadius: 15,
              spreadRadius: 1
            ),
            BoxShadow(
                color: Colors.white,
                offset: Offset(-4,-4),
                blurRadius: 15,
                spreadRadius: 1
            ),
          ]
        ),
        child: Row(
          children: [
            Container(
              height: 65,
              width: 65,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15,0,0,0),
                child: Image.network(imageurl),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,0,0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                           name,
                          style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold ,color: Colors.grey[900])
                        ),
                      Text(
                          symbol,
                          style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.bold ,color: Colors.grey[500])
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                        price.toDouble().toString(),
                        style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold ,color: Colors.grey[900])
                    ),
                    Text(
                        change.toDouble() < 0
                            ?  change.toDouble().toString()
                            :  '+'+ '' + change.toDouble().toString() ,
                        style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.bold ,color: change.toDouble() < 0 ? Colors.red : Colors.green)
                    ),
                    Text(
                        changepercentage.toDouble() < 0
                        ? changepercentage.toDouble().toString() + '%'
                        :  '+'+ '' + changepercentage.toDouble().toString() + '%',
                        style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.bold ,color: changepercentage.toDouble() < 0 ? Colors.red : Colors.green)
                    ),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
