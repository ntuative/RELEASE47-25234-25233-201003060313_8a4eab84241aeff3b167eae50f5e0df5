package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_513;
         param1["bitmap"] = const_732;
         param1["border"] = const_685;
         param1["border_notify"] = const_1276;
         param1["button"] = const_377;
         param1["button_thick"] = const_566;
         param1["button_icon"] = const_1229;
         param1["button_group_left"] = const_532;
         param1["button_group_center"] = const_689;
         param1["button_group_right"] = const_645;
         param1["canvas"] = const_687;
         param1["checkbox"] = const_695;
         param1["closebutton"] = const_1010;
         param1["container"] = const_329;
         param1["container_button"] = const_574;
         param1["display_object_wrapper"] = const_621;
         param1["dropmenu"] = const_450;
         param1["dropmenu_item"] = const_452;
         param1["frame"] = const_310;
         param1["frame_notify"] = const_1367;
         param1["header"] = const_603;
         param1["icon"] = const_858;
         param1["itemgrid"] = const_937;
         param1["itemgrid_horizontal"] = const_429;
         param1["itemgrid_vertical"] = const_542;
         param1["itemlist"] = const_896;
         param1["itemlist_horizontal"] = const_283;
         param1["itemlist_vertical"] = const_326;
         param1["maximizebox"] = const_1380;
         param1["menu"] = const_1387;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_985;
         param1["minimizebox"] = const_1252;
         param1["notify"] = const_1351;
         param1["null"] = const_598;
         param1["password"] = const_633;
         param1["radiobutton"] = const_740;
         param1["region"] = const_448;
         param1["restorebox"] = const_1244;
         param1["scaler"] = const_799;
         param1["scaler_horizontal"] = const_1295;
         param1["scaler_vertical"] = const_1333;
         param1["scrollbar_horizontal"] = const_412;
         param1["scrollbar_vertical"] = const_724;
         param1["scrollbar_slider_button_up"] = const_965;
         param1["scrollbar_slider_button_down"] = const_962;
         param1["scrollbar_slider_button_left"] = const_1009;
         param1["scrollbar_slider_button_right"] = const_864;
         param1["scrollbar_slider_bar_horizontal"] = const_817;
         param1["scrollbar_slider_bar_vertical"] = const_810;
         param1["scrollbar_slider_track_horizontal"] = const_815;
         param1["scrollbar_slider_track_vertical"] = const_805;
         param1["scrollable_itemlist"] = const_1179;
         param1["scrollable_itemlist_vertical"] = const_484;
         param1["scrollable_itemlist_horizontal"] = const_987;
         param1["selector"] = const_616;
         param1["selector_list"] = const_590;
         param1["submenu"] = const_985;
         param1["tab_button"] = const_560;
         param1["tab_container_button"] = const_899;
         param1["tab_context"] = const_392;
         param1["tab_content"] = const_997;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_665;
         param1["input"] = const_547;
         param1["toolbar"] = const_1362;
         param1["tooltip"] = const_290;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
