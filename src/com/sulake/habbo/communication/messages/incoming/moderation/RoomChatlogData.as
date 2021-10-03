package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomChatlogData
   {
       
      
      private var var_676:String;
      
      private var var_1451:Array;
      
      private var var_1452:Boolean;
      
      private var _roomId:int;
      
      public function RoomChatlogData(param1:IMessageDataWrapper)
      {
         var_1451 = new Array();
         super();
         var_1452 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_676 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_1451.push(new ChatlineData(param1));
            _loc3_++;
         }
         Logger.log("READ ROOMCHATLOGDATA: " + var_1452 + ", " + _roomId + ", " + var_676 + ", " + chatlog.length);
      }
      
      public function get isPublic() : Boolean
      {
         return var_1452;
      }
      
      public function get roomName() : String
      {
         return var_676;
      }
      
      public function get chatlog() : Array
      {
         return var_1451;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
