package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_557:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_1857:BitmapData;
      
      private var var_1856:String;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_557,param3,param4);
         var_1856 = param1;
         var_1857 = param2;
      }
      
      public function get badgeImage() : BitmapData
      {
         return var_1857;
      }
      
      public function get badgeID() : String
      {
         return var_1856;
      }
   }
}
