package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1895:int;
      
      private var var_999:int;
      
      private var var_1954:int;
      
      private var var_1490:int;
      
      private var var_117:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1490 = param1.readInteger();
         var_1954 = param1.readInteger();
         var_999 = param1.readInteger();
         var_1895 = param1.readInteger();
         var_117 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1490);
      }
      
      public function get chatRecordId() : int
      {
         return var_1895;
      }
      
      public function get reportedUserId() : int
      {
         return var_999;
      }
      
      public function get method_12() : int
      {
         return var_1954;
      }
      
      public function get callId() : int
      {
         return var_1490;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_117;
      }
   }
}
