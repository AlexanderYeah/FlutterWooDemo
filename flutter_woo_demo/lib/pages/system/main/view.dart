import 'package:flutter/material.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _MainViewGetX();
  }
}

class _MainViewGetX extends GetView<MainController> {
  const _MainViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Text("data");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      id: "main",
      builder: (_) {
        return Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            onPageChanged: controller.onIndexChange,
            children: const [
              Center(
                child: Text(
                  "1",
                ),
              ),
              Center(child: Text("2")),
              Center(child: Text("3")),
              Center(child: Text("4")),
            ],
          ),
          // 返回自定义的底部导航栏
          bottomNavigationBar: GetBuilder<MainController>(
            id: "navigation",
            builder: (controller) {
              return BuildNavigation(
                currentIndex: controller.currentIdx,
                items: [
                  NavigationItemModel(
                    label: LocaleKeys.tabBarHome.tr,
                    icon: AssetsSvgs.navHomeSvg,
                  ),
                  NavigationItemModel(
                    label: LocaleKeys.tabBarCart.tr,
                    icon: AssetsSvgs.navCartSvg,
                    count: 3,
                  ),
                  NavigationItemModel(
                    label: LocaleKeys.tabBarMessage.tr,
                    icon: AssetsSvgs.navMessageSvg,
                    count: 9,
                  ),
                  NavigationItemModel(
                    label: LocaleKeys.tabBarProfile.tr,
                    icon: AssetsSvgs.navProfileSvg,
                  ),
                ],
                onTap: controller.onJumpToTap,
              );
            },
          ),
        );
      },
    );
  }
}
