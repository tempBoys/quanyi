import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/SearchScreen/screens/search_screen.dart';
import 'package:quanyi/UploadScreen/upload.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/utils/api_helper.dart';
import 'package:quanyi/models/utils/fav_storage.dart';
import 'package:quanyi/widgets/kdivider.dart';
import 'package:quanyi/widgets/normal_appbar.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'components/product_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final favStroage = Get.put(FavStorage());

  var productData = [];

  int lastProductId = 0;

  final int increment = 10;
  bool isLoading = false;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    _loadMore();
    super.initState();
  }

  Future _loadMore() async {
    // 현재 로딩중으로 바뀐다
    setState(() {
      isLoading = true;
    });
    var tempData =
        await apiHelper.getRecentProducts(lastProductId: lastProductId);
    productData.addAll(tempData);
    lastProductId = tempData.last["id"];
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: NormalAppbar(
        title: "主页",
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.search),
            onPressed: () => Get.to(() => SearchScreen()),
          ),
          IconButton(icon: Icon(CupertinoIcons.bell), onPressed: () {})
        ],
      ),
      body: SmartRefresher(
        enablePullDown: true,
        header: WaterDropHeader(),
        controller: _refreshController,
        onRefresh: onRefresh,
        onLoading: onLoading,
        child: LazyLoadScrollView(
          isLoading: isLoading,
          onEndOfPage: () => _loadMore(),
          child: ListView.separated(
              itemCount: productData.length,
              itemBuilder: (BuildContext ctx, int index) {
                return Padding(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                    child: ProductList(simpleData: productData[index]));
              },
              separatorBuilder: (BuildContext ctx, int index) {
                return KDivider(height: 5);
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "上传我的货",
        backgroundColor: kAccentColor,
        elevation: 1,
        child: Icon(Icons.add_outlined, size: 30),
        onPressed: () async {
          Get.to(() => UploadScreen());
        },
      ),
    );
  }
}

class HomeController extends GetxController {}
