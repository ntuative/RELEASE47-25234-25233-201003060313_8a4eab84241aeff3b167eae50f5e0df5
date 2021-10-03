package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetEcotronBoxDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_79:String = "RWEBDUE_CONTENTS";
      
      public static const const_64:String = "RWEBDUE_PACKAGEINFO";
       
      
      private var var_198:String;
      
      private var var_1746:BitmapData;
      
      private var var_159:int = -1;
      
      private var var_12:Boolean;
      
      public function RoomWidgetEcotronBoxDataUpdateEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:BitmapData = null, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_159 = param2;
         var_198 = param3;
         var_12 = param4;
         var_1746 = param5;
      }
      
      public function get iconBitmapData() : BitmapData
      {
         return var_1746;
      }
      
      public function get text() : String
      {
         return var_198;
      }
      
      public function get objectId() : int
      {
         return var_159;
      }
      
      public function get controller() : Boolean
      {
         return var_12;
      }
   }
}
