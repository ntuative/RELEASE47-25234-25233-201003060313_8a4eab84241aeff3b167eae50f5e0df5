package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NewConsoleMessageMessageParser implements IMessageParser
   {
       
      
      private var var_1883:String;
      
      private var var_946:int;
      
      public function NewConsoleMessageMessageParser()
      {
         super();
      }
      
      public function get senderId() : int
      {
         return this.var_946;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_946 = param1.readInteger();
         this.var_1883 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get messageText() : String
      {
         return this.var_1883;
      }
   }
}
