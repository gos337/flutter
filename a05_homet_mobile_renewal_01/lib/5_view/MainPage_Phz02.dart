import 'package:a05_homet_mobile_renewal_01/1_model/MainRes.dart';
import 'package:a05_homet_mobile_renewal_01/4_viewModel/VM_MainInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage_phz02 extends StatelessWidget {
  const MainPage_phz02({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<VM_MainInfo>(
      builder: (context, provider, widget) {
        print("MainPage.dart");
        print("${provider.mainRes}");

        return MainPageUI_phz02(vmMaininfo: provider);
      },
    );
  }

  Widget MainPageUI_phz02({required VM_MainInfo vmMaininfo}) {
    return Scaffold(
      backgroundColor: const Color(0xff292c33),
      body: SafeArea(
        child: Container(
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: vmMaininfo.getThemeModuleCount(),
            itemBuilder: (context, index) {
              return MakeThemeModule(vmMaininfo: vmMaininfo, index: index);
            },
            separatorBuilder: (context, index) => const SizedBox(width: 8),
          ),
        ),
      ),
    );
  }

  Widget MakeThemeModule({required VM_MainInfo vmMaininfo, required int index}) {
    DesignType? designType = vmMaininfo.getThemeModulType(index: index);
    Widget? widget;

    print(designType);

    switch (designType) {
      case DesignType.Banner:
        // MakeMainBanner(data);
        widget = makeDesignType_002();
        break;

      case DesignType.BannerTheme:
        // MakeBannerTheme(data);

        break;

      case DesignType.FavTheme:
        // MakeFavorateTheme(data);
        break;

      case DesignType.TrainerTheme:
        // MakeTrainerTheme(data);
        break;

      default:
        break;
    }

    if (widget != null) {
      return widget;
    }
    return const SizedBox();
  }

  /// 메인 배너                 //
  Widget makeDesignType_002() {
    return Container();
  }

  /// 배너 테마                 //
  Widget makeDesignType_004() {
    return Container();
  }

  /// 인기 테마                 //
  Widget makeDesignType_006() {
    return Container();
  }

  /// 트레이터 테마              //
  Widget makeDesignType_007() {
    return Container();
  }

  /// 컨텐츠 테마                //
  Widget makeDesignType_008() {
    return Container();
  }

  /// Top 10 테마              //
  Widget makeDesignType_011() {
    return Container();
  }
}
