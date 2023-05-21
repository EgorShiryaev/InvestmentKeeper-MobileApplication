import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../cubits/accounts_cubit/accounts_cubit.dart';
import '../widgets/main_page/main_page_app_bar.dart';
import '../widgets/main_page/main_page_body.dart';

class MainPage extends HookWidget {
  static String routeName = '/';

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Get.find<AccountsCubit>().load();
    }, []);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) {
          return [
            const MainPageAppBar(),
          ];
        },
        body: const MainPageBody(),
      ),
    );
  }
}
