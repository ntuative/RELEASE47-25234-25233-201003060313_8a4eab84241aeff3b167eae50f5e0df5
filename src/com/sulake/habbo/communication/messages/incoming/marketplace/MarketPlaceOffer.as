package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1247:int;
      
      private var var_1939:int = -1;
      
      private var var_369:int;
      
      private var var_1941:int;
      
      private var var_1855:int;
      
      private var _offerId:int;
      
      private var var_1246:int;
      
      private var var_1854:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         _offerId = param1;
         var_1854 = param2;
         var_1855 = param3;
         var_1247 = param4;
         var_369 = param5;
         var_1939 = param6;
         var_1941 = param7;
         var_1246 = param8;
      }
      
      public function get status() : int
      {
         return var_369;
      }
      
      public function get price() : int
      {
         return var_1247;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_1939;
      }
      
      public function get offerCount() : int
      {
         return var_1246;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_1855;
      }
      
      public function get averagePrice() : int
      {
         return var_1941;
      }
      
      public function get furniId() : int
      {
         return var_1854;
      }
   }
}
