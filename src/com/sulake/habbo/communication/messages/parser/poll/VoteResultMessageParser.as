package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1196:int;
      
      private var var_1061:String;
      
      private var var_680:Array;
      
      private var var_990:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_680.slice();
      }
      
      public function flush() : Boolean
      {
         var_1061 = "";
         var_990 = [];
         var_680 = [];
         var_1196 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1196;
      }
      
      public function get question() : String
      {
         return var_1061;
      }
      
      public function get choices() : Array
      {
         return var_990.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1061 = param1.readString();
         var_990 = [];
         var_680 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_990.push(param1.readString());
            var_680.push(param1.readInteger());
            _loc3_++;
         }
         var_1196 = param1.readInteger();
         return true;
      }
   }
}
