package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_131;
         param1["bound_to_parent_rect"] = const_85;
         param1["child_window"] = const_852;
         param1["embedded_controller"] = const_325;
         param1["resize_to_accommodate_children"] = const_65;
         param1["input_event_processor"] = const_50;
         param1["internal_event_handling"] = const_525;
         param1["mouse_dragging_target"] = const_225;
         param1["mouse_dragging_trigger"] = const_330;
         param1["mouse_scaling_target"] = const_251;
         param1["mouse_scaling_trigger"] = const_383;
         param1["horizontal_mouse_scaling_trigger"] = const_197;
         param1["vertical_mouse_scaling_trigger"] = const_208;
         param1["observe_parent_input_events"] = const_813;
         param1["optimize_region_to_layout_size"] = const_387;
         param1["parent_window"] = const_1007;
         param1["relative_horizontal_scale_center"] = const_163;
         param1["relative_horizontal_scale_fixed"] = const_123;
         param1["relative_horizontal_scale_move"] = const_316;
         param1["relative_horizontal_scale_strech"] = const_267;
         param1["relative_scale_center"] = const_982;
         param1["relative_scale_fixed"] = const_690;
         param1["relative_scale_move"] = const_886;
         param1["relative_scale_strech"] = const_806;
         param1["relative_vertical_scale_center"] = const_166;
         param1["relative_vertical_scale_fixed"] = const_116;
         param1["relative_vertical_scale_move"] = const_323;
         param1["relative_vertical_scale_strech"] = const_271;
         param1["on_resize_align_left"] = const_551;
         param1["on_resize_align_right"] = const_433;
         param1["on_resize_align_center"] = const_394;
         param1["on_resize_align_top"] = const_672;
         param1["on_resize_align_bottom"] = const_396;
         param1["on_resize_align_middle"] = const_415;
         param1["on_accommodate_align_left"] = const_981;
         param1["on_accommodate_align_right"] = const_397;
         param1["on_accommodate_align_center"] = const_596;
         param1["on_accommodate_align_top"] = const_887;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_597;
         param1["route_input_events_to_parent"] = const_371;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_983;
         param1["scalable_with_mouse"] = const_867;
         param1["reflect_horizontal_resize_to_parent"] = const_364;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_241;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
