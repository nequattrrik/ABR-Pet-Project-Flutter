import 'package:flutter/material.dart';

void showLanguageSelectionBottomSheet(
  BuildContext context, 
  String selectedLanguage, 
  Function(String) onLanguageSelected) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.black,
    builder: (BuildContext context) {
      Map<String, String> languages = {
        'Казахский': 'Kazakh',
        'Русский': 'Russian',
        'English': 'English'
      };

      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Выберите язык интерфейса',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Divider(color: Colors.grey[800]),
            ...languages.keys.map((String key) {
              return RadioListTile<String>(
                title: Text(key, style: const TextStyle(color: Colors.white)),
                activeColor: Colors.white,
                value: languages[key]!,
                groupValue: selectedLanguage,
                onChanged: (String? value) {
                  if (value != null) {
                    onLanguageSelected(value);
                    Navigator.pop(context);
                  }
                },
              );
            }).toList(),
          ],
        ),
      );
    },
  );
}
