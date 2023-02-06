import 'package:flutter/material.dart';
import '../../../constant/global_variable.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: GlobalVariable.appBarGradient,
        ),
      ),
      title: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Material(
                borderRadius: BorderRadius.circular(7),
                elevation: 1,
                child: TextFormField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.only(top: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black38,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                    hintText: 'Search TokoTalk',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 23,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            height: 42,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Icon(
              Icons.mic,
              color: Colors.black87,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
