package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1489:int = 2;
      
      public static const const_311:int = 4;
      
      public static const const_1194:int = 1;
      
      public static const const_1158:int = 3;
       
      
      private var var_989:int = 0;
      
      private var var_814:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_989;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_989 = param1.readInteger();
         if(var_989 == 3)
         {
            var_814 = param1.readString();
         }
         else
         {
            var_814 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_989 = 0;
         var_814 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_814;
      }
   }
}
