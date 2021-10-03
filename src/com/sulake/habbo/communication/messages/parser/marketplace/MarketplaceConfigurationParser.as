package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1750:int;
      
      private var var_1523:int;
      
      private var var_1751:int;
      
      private var var_1749:int;
      
      private var var_1748:int;
      
      private var var_1522:int;
      
      private var var_1663:int;
      
      private var var_1723:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1750;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1523;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1663;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1749;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1748;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1522;
      }
      
      public function get commission() : int
      {
         return var_1751;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1723 = param1.readBoolean();
         var_1751 = param1.readInteger();
         var_1523 = param1.readInteger();
         var_1522 = param1.readInteger();
         var_1749 = param1.readInteger();
         var_1750 = param1.readInteger();
         var_1748 = param1.readInteger();
         var_1663 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1723;
      }
   }
}
