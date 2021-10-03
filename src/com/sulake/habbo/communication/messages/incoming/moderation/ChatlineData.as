package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1504:String;
      
      private var var_1756:int;
      
      private var var_1758:int;
      
      private var var_1755:int;
      
      private var var_1757:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_1756 = param1.readInteger();
         var_1755 = param1.readInteger();
         var_1758 = param1.readInteger();
         var_1757 = param1.readString();
         var_1504 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1504;
      }
      
      public function get hour() : int
      {
         return var_1756;
      }
      
      public function get minute() : int
      {
         return var_1755;
      }
      
      public function get chatterName() : String
      {
         return var_1757;
      }
      
      public function get chatterId() : int
      {
         return var_1758;
      }
   }
}
