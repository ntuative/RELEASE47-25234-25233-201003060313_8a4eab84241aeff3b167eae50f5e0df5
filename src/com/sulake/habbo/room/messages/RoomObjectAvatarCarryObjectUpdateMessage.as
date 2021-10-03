package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1005:int;
      
      private var var_1226:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_1005 = param1;
         var_1226 = param2;
      }
      
      public function get itemType() : int
      {
         return var_1005;
      }
      
      public function get itemName() : String
      {
         return var_1226;
      }
   }
}
