package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_626:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_198:String;
      
      private var var_643:String;
      
      private var var_1426:String;
      
      private var var_159:int = -1;
      
      private var var_12:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_159 = param2;
         var_1426 = param3;
         var_198 = param4;
         var_643 = param5;
         var_12 = param6;
      }
      
      public function get objectType() : String
      {
         return var_1426;
      }
      
      public function get colorHex() : String
      {
         return var_643;
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
