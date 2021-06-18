import 'package:flutter/material.dart';

class CuntryDropdown extends StatelessWidget {
  final List<String> countries;
  final String country;
  final Function(String?) onValueChanged;

  const CuntryDropdown({
    required this.countries,
    required this.country,
    required this.onValueChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: country,
          items: countries
              .map((e) => DropdownMenuItem(
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 12.0,
                          child: Image.asset(
                            'assets/images/${e.toLowerCase()}_flag.png',
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          e,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    value: e,
                  ))
              .toList(),
          onChanged: onValueChanged,
        ),
      ),
    );
  }
}
