package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1904:int;
      
      private var var_1364:String;
      
      private var var_1907:int;
      
      private var var_1903:int;
      
      private var var_1906:int;
      
      private var var_1905:Boolean;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function get productName() : String
      {
         return var_1364;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_1905;
      }
      
      public function get responseType() : int
      {
         return var_1903;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_1907;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1364 = param1.readString();
         var_1907 = param1.readInteger();
         var_1904 = param1.readInteger();
         var_1906 = param1.readInteger();
         var_1903 = param1.readInteger();
         var_1905 = param1.readBoolean();
         return true;
      }
      
      public function get memberPeriods() : int
      {
         return var_1904;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_1906;
      }
   }
}
