package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCreatedMessageParser implements IMessageParser
   {
       
      
      private var var_2221:String;
      
      private var var_386:int;
      
      public function FlatCreatedMessageParser()
      {
         super();
      }
      
      public function get flatName() : String
      {
         return var_2221;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_386 = param1.readInteger();
         this.var_2221 = param1.readString();
         Logger.log("FLAT CREATED: " + this.var_386 + ", " + this.var_2221);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get flatId() : int
      {
         return var_386;
      }
   }
}
