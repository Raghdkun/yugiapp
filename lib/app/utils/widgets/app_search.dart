import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yugiapp/app/themes/app_colors.dart';


class CustomSearch extends StatelessWidget {
  final TextEditingController? mycontroller;
  final String myText;
  final void Function(String)? onChanged;
  final void Function()? onSearch;
  final void Function()? onCloseSearch;

  const CustomSearch(
      {super.key,
      required this.myText,
      this.onChanged,
      this.mycontroller,
      this.onCloseSearch,
      this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: TextFormField(

                    controller: mycontroller,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                        suffixIcon: !mycontroller!.text.isNotEmpty && mycontroller!.text == "" ? null : IconButton(
                            icon: Icon(Icons.close, ), onPressed: onCloseSearch),
                        // prefixIcon: const Icon(Icons.search),
                        hintText: myText,
                        hintStyle: const TextStyle(
                          fontSize: 18,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(30)),
                        filled: true,
                        ),
                  ),);
  }
}
