package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1602:int;
      
      private var var_387:Boolean;
      
      private var var_1603:Boolean;
      
      private var var_757:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1603 = param1.readBoolean();
         if(var_1603)
         {
            var_1602 = param1.readInteger();
            var_387 = param1.readBoolean();
         }
         else
         {
            var_757 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_757 != null)
         {
            var_757.dispose();
            var_757 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_1602;
      }
      
      public function get owner() : Boolean
      {
         return var_387;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_1603;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_757;
      }
   }
}
