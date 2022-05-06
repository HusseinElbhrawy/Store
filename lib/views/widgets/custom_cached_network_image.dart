import 'package:flutter/material.dart';

Widget cachedNetworkImageErrorWidget(context, url, error) => const Icon(
      Icons.error,
      color: Colors.blue,
    );

Widget cachedNetworkImageLoadingWidget(context, url, downloadProgress) {
  return Center(
    child: CircularProgressIndicator(
      value: downloadProgress.progress,
    ),
  );
}
