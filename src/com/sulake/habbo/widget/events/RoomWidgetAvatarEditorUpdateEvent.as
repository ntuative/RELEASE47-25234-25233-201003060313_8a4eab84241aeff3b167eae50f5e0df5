package com.sulake.habbo.widget.events
{
   public class RoomWidgetAvatarEditorUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_1019:String = "RWAEUE_HIDE_CLUB_PROMO";
      
      public static const const_545:String = "RWUE_AVATAR_EDITOR_CLOSED";
      
      public static const const_1311:String = "RWAEUE_MODE_TRIAL";
      
      public static const const_929:String = "RWAEUE_MODE_FULL";
      
      public static const const_353:String = "RWAEUE_SHOW_CLUB_PROMO";
       
      
      private var var_1790:String;
      
      private var var_1791:String;
      
      public function RoomWidgetAvatarEditorUpdateEvent(param1:String, param2:String = "", param3:String = "RWAEUE_MODE_FULL", param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         var_1790 = param2;
         var_1791 = param3;
      }
      
      public function get promoMode() : String
      {
         return var_1791;
      }
      
      public function get promoImageUrl() : String
      {
         return var_1790;
      }
   }
}
