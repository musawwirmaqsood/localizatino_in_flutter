import 'package:flutter/material.dart';
import 'package:flutter_localization/l10n/l10n.dart';
import 'package:flutter_localization/language_picker/viewmodel/language_picker_viewmodel.dart';
import 'package:flutter_localization/widgets/language_picker_dropdown_widget.dart';
import 'package:flutter_localization/widgets/language_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LanguagePickerViewModel>.reactive(
        disposeViewModel: false,
        builder: (context, languagePickerModel, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: languagePickerModel.locale,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: L10n.all,
              theme: ThemeData(
                textTheme: GoogleFonts.latoTextTheme(
                  Theme.of(context).textTheme,
                ),
                primarySwatch: Colors.blueGrey,
              ),
              home: MyHomePage(title: 'Counting App'),
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

Widget buildNumberWidger(String number) {
  return Container(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      number,
      style: TextStyle(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
    ),
  );
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [LanguagePickerWidget()],
      ),
      body: Stack(
        children: [
          Container(
            color: Color.fromRGBO(131, 149, 167, 1),
          ),
          Container(
            padding: EdgeInsets.all(32),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Text(
                          'Counting 1-10',
                          style: TextStyle(
                              fontSize: 26,
                              color: Color.fromRGBO(34, 47, 62, 1.0),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  buildNumberWidger(AppLocalizations.of(context).one),
                  buildNumberWidger(AppLocalizations.of(context).two),
                  buildNumberWidger(AppLocalizations.of(context).three),
                  buildNumberWidger(AppLocalizations.of(context).four),
                  buildNumberWidger(AppLocalizations.of(context).five),
                  buildNumberWidger(AppLocalizations.of(context).six),
                  buildNumberWidger(AppLocalizations.of(context).seven),
                  buildNumberWidger(AppLocalizations.of(context).eight),
                  buildNumberWidger(AppLocalizations.of(context).nine),
                  buildNumberWidger(AppLocalizations.of(context).ten),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
