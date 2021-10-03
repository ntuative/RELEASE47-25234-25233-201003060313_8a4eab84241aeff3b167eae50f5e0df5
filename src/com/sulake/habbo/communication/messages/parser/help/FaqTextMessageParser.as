package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FaqTextMessageParser implements IMessageParser
   {
       
      
      private var var_1220:int;
      
      private var var_1221:String;
      
      public function FaqTextMessageParser()
      {
         super();
      }
      
      public function get questionId() : int
      {
         return var_1220;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1220 = param1.readInteger();
         var_1221 = param1.readString();
         return true;
      }
      
      public function get answerText() : String
      {
         return var_1221;
      }
      
      public function flush() : Boolean
      {
         var_1220 = -1;
         var_1221 = null;
         return true;
      }
   }
}
