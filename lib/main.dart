import 'package:cosmos_epub/Model/book_progress_model.dart';
import 'package:cosmos_epub/cosmos_epub.dart';
import 'package:cosmos_epub_example/e_pub_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initializer and methods return a bool
  var _initialized = await CosmosEpub.initialize();

  if (_initialized) {
    // Use BookProgressModel model instance anywhere in your app to access current book progress of specific book
    BookProgressModel bookProgress = CosmosEpub.getBookProgress('bookId');
    await CosmosEpub.setCurrentPageIndex('bookId', 1);
    await CosmosEpub.setCurrentChapterIndex('bookId', 2);
    await CosmosEpub.deleteBookProgress('bookId');
    await CosmosEpub.deleteAllBooksProgress();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff0a0e21),
        ),
        scaffoldBackgroundColor: Color(0xff0a0e21),
      ),
      home: EpubWidget(),
    );
  }
}
