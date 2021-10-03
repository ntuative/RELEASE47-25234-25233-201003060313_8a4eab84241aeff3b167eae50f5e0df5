package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.ClubGiftData;
   
   public class ClubGiftInfoParser implements IMessageParser
   {
       
      
      private var var_1807:int;
      
      private var var_991:int;
      
      private var var_607:Array;
      
      private var var_1460:Map;
      
      public function ClubGiftInfoParser()
      {
         super();
      }
      
      public function get giftData() : Map
      {
         return var_1460;
      }
      
      public function get giftsAvailable() : int
      {
         return var_991;
      }
      
      public function flush() : Boolean
      {
         var_607 = [];
         return true;
      }
      
      public function get daysUntilNextGift() : int
      {
         return var_1807;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var_1807 = param1.readInteger();
         var_991 = param1.readInteger();
         var_607 = new Array();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_607.push(new CatalogPageMessageOfferData(param1));
            _loc3_++;
         }
         var_1460 = new Map();
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new ClubGiftData(param1);
            var_1460.add(_loc4_.offerId,_loc4_);
            _loc3_++;
         }
         return true;
      }
      
      public function get offers() : Array
      {
         return var_607;
      }
   }
}
