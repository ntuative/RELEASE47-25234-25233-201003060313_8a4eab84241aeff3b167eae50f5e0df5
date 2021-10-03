package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_254:String = "RWFAM_MOVE";
      
      public static const const_604:String = "RWFUAM_ROTATE";
      
      public static const const_586:String = "RWFAM_PICKUP";
       
      
      private var var_1854:int = 0;
      
      private var var_2135:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         var_1854 = param2;
         var_2135 = param3;
      }
      
      public function get furniId() : int
      {
         return var_1854;
      }
      
      public function get furniCategory() : int
      {
         return var_2135;
      }
   }
}
