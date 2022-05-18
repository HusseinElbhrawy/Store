import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/views/widgets/custom_elevated_button.dart';

class EmptyOrderScreen extends StatelessWidget {
  const EmptyOrderScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/nodate.svg',
            height: 220,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          const Divider(color: Colors.transparent),
          Text(
            'Your Orders Is Empty',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(
              'Looks like you haven\'t \n add any order !',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.grey,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const CustomElevatedButton(),
        ],
      ),
    );
  }
}
