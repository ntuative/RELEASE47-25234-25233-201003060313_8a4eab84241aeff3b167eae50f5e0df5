package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2333:int;
      
      private var var_2330:int;
      
      private var var_2329:int;
      
      private var var_210:Array;
      
      private var var_2331:int;
      
      private var var_2332:int;
      
      private var var_15:Array;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_15 = new Array();
         this.var_210 = new Array();
         return true;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2333;
      }
      
      public function get friends() : Array
      {
         return this.var_210;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2329;
      }
      
      public function get categories() : Array
      {
         return this.var_15;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2330;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2332;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2332 = param1.readInteger();
         this.var_2329 = param1.readInteger();
         this.var_2333 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_15.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_210.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2330 = param1.readInteger();
         this.var_2331 = param1.readInteger();
         return true;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2331;
      }
   }
}
