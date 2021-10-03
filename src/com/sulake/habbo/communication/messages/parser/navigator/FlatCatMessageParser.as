package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCatMessageParser implements IMessageParser
   {
       
      
      private var var_386:int;
      
      private var var_1113:int;
      
      public function FlatCatMessageParser()
      {
         super();
      }
      
      public function get flatId() : int
      {
         return var_386;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_386 = param1.readInteger();
         var_1113 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         var_386 = 0;
         var_1113 = 0;
         return true;
      }
      
      public function get nodeId() : int
      {
         return var_1113;
      }
   }
}
