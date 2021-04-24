import 'package:flutter/material.dart';
import 'package:flutter_localization/l10n/l10n.dart';
import 'package:flutter_localization/language_picker/viewmodel/language_picker_viewmodel.dart';
import 'package:flutter_localization/widgets/language_picker_dropdown_widget.dart';
import 'package:flutter_localization/widgets/language_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stacked/stacked.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LanguagePickerViewModel>.reactive(
        disposeViewModel: false,
        builder: (context, languagePickerModel, child) => MaterialApp(
              title: 'Flutter Demo',
              locale: languagePickerModel.locale,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: L10n.all,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: MyHomePage(title: 'Flutter Demo Home Page'),
            ),
        viewModelBuilder: () => LanguagePickerViewModel());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [LanguagePickerWidget()],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LanguageWidget(),
            Text(
              AppLocalizations.of(context).helloWorld,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              AppLocalizations.of(context).name,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
