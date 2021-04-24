import 'package:flutter/material.dart';
import 'package:flutter_localization/l10n/l10n.dart';
import 'package:flutter_localization/language_picker/viewmodel/language_picker_viewmodel.dart';
import 'package:stacked/stacked.dart';

class LanguagePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LanguagePickerViewModel>.reactive(
        disposeViewModel: false,
        builder: (context, model, child) => DropdownButtonHideUnderline(
              child: DropdownButton(
                value: model.locale ?? Locale('en'),
                icon: Container(width: 12),
                items: L10n.all.map(
                  (locale) {
                    final flag = L10n.getFlag(locale.languageCode);
                    return DropdownMenuItem(
                      child: Center(
                        child: Text(
                          flag,
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                      value: locale,
                      onTap: () {
                        model.setLocale(locale);
                      },
                    );
                  },
                ).toList(),
                onChanged: (_) {},
              ),
            ),
        viewModelBuilder: () => LanguagePickerViewModel());
  }
}
