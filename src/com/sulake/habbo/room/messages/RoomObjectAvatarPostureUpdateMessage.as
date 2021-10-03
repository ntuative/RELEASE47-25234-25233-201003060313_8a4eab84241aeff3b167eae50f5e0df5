package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1786:String;
      
      private var var_814:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_1786 = param1;
         var_814 = param2;
      }
      
      public function get postureType() : String
      {
         return var_1786;
      }
      
      public function get parameter() : String
      {
         return var_814;
      }
   }
}
