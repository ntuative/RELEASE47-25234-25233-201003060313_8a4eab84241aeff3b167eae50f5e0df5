package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_676:String;
      
      private var var_2185:int;
      
      private var var_1452:Boolean;
      
      private var _roomId:int;
      
      private var var_2184:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1452 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_676 = param1.readString();
         var_2184 = param1.readInteger();
         var_2185 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1452;
      }
      
      public function get roomName() : String
      {
         return var_676;
      }
      
      public function get enterMinute() : int
      {
         return var_2185;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_2184;
      }
   }
}
