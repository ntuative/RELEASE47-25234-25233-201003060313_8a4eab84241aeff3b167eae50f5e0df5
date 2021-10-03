package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1241:int;
      
      private var var_1138:int;
      
      private var var_1240:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return var_1241;
      }
      
      public function flush() : Boolean
      {
         var_1138 = 0;
         var_1241 = 0;
         var_1240 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1138;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1241 = param1.readInteger();
         var_1138 = param1.readInteger();
         var_1240 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return var_1240;
      }
   }
}
