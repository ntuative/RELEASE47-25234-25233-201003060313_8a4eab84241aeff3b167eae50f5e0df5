package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_774:Array;
      
      private var var_826:int;
      
      private var var_1217:String;
      
      private var _offerId:int;
      
      private var var_825:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1217 = param1.readString();
         var_826 = param1.readInteger();
         var_825 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_774 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_774.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_774;
      }
      
      public function get priceInCredits() : int
      {
         return var_826;
      }
      
      public function get localizationId() : String
      {
         return var_1217;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_825;
      }
   }
}
