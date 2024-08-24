import 'package:cosmos_epub/cosmos_epub.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EpubWidget extends StatefulWidget {
  @override
  _EpubWidgetState createState() => _EpubWidgetState();
}

class _EpubWidgetState extends State<EpubWidget> {
  Future<void> readerFuture = Future.value(true);

  Future<void> _openEpubReader(BuildContext context) async {
    await CosmosEpub.openAssetBook(
        assetPath: 'assets/pg2701-images-3.epub',
        context: context,
        bookId: '3',
        onPageFlip: (int currentPage, int totalPages) {
          print(currentPage);
        },
        onLastPage: (int lastPageIndex) {
          print('We arrived to the last widget');
        });
  }

  lateFuture() {
    setState(() {
      readerFuture = _openEpubReader(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            lateFuture();
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.yellow),
              padding: MaterialStateProperty.all(EdgeInsets.all(20))),
          child: FutureBuilder<void>(
            future: readerFuture, // Set the future to the async operation
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  {
                    // While waiting for the future to complete, display a loading indicator.
                    return CupertinoActivityIndicator(
                      radius: 15,
                      color: Colors.black, // Adjust the radius as needed
                    );
                  }
                default:
                  // By default, show the button text
                  return Text(
                    'Open book  🚀',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
