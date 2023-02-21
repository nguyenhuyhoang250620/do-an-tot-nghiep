import 'package:get/get.dart';
import 'package:do_an_tot_nghiep/data/models/selectionPopupModel/selection_popup_model.dart';

class TimeAttendanceModel {
  // RxList<ListfrontItemModel> listfrontItemList =
  //     RxList.filled(2, ListfrontItemModel());
  RxList<SelectionPopupModel> dropdownTrackingArea = <SelectionPopupModel>[].obs;
  RxList<SelectionPopupModel> dropdownChooseCamera = <SelectionPopupModel>[
    SelectionPopupModel(
      id: 1,
      title: "List Camera",
      isSelected: true,
    ),
  ].obs;
  RxList<SelectionPopupModel> dropdownItemList = [
    SelectionPopupModel(
      id: 1,
      title: "All",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "test1",
    ),
    SelectionPopupModel(
      id: 3,
      title: "test2",
    )
  ].obs;
  RxList<SelectionPopupModel> dropdownHome = <SelectionPopupModel>[].obs;
  RxList<SelectionPopupModel> dropdownItemListTime = [
    SelectionPopupModel(
      id: 1,
      title: "All",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "1 tuần",
    ),
    SelectionPopupModel(
      id: 3,
      title: "1 tháng",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Khoảng thời gian",
    )
  ].obs;

  RxList<SelectionPopupModel> dropdownItemList2 = [
    SelectionPopupModel(
      id: 1,
      title: "test",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "test1",
    ),
    SelectionPopupModel(
      id: 3,
      title: "test2",
    )
  ].obs;

  //RxList<ListstarttimeItemModel> liststarttimeItemList = RxList.filled(2, ListstarttimeItemModel());
}
