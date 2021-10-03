package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer
   {
      
      public static const const_853:String = "price_type_none";
      
      public static const const_468:String = "pricing_model_multi";
      
      public static const const_479:String = "price_type_credits";
      
      public static const const_443:String = "price_type_credits_and_pixels";
      
      public static const const_478:String = "pricing_model_bundle";
      
      public static const const_446:String = "pricing_model_single";
      
      public static const const_700:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1262:String = "pricing_model_unknown";
      
      public static const const_421:String = "price_type_pixels";
       
      
      private var var_826:int;
      
      private var _offerId:int;
      
      private var var_825:int;
      
      private var var_403:String;
      
      private var var_562:String;
      
      private var var_1866:int;
      
      private var var_569:ICatalogPage;
      
      private var var_1217:String;
      
      private var var_402:IProductContainer;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1217 = param1.localizationId;
         var_826 = param1.priceInCredits;
         var_825 = param1.priceInPixels;
         var_569 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_403;
      }
      
      public function get page() : ICatalogPage
      {
         return var_569;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_1866 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_402;
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
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1217 = "";
         var_826 = 0;
         var_825 = 0;
         var_569 = null;
         if(var_402 != null)
         {
            var_402.dispose();
            var_402 = null;
         }
      }
      
      public function get priceType() : String
      {
         return var_562;
      }
      
      public function get previewCallbackId() : int
      {
         return var_1866;
      }
      
      public function get priceInCredits() : int
      {
         return var_826;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_403 = const_446;
            }
            else
            {
               var_403 = const_468;
            }
         }
         else if(param1.length > 1)
         {
            var_403 = const_478;
         }
         else
         {
            var_403 = const_1262;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_403)
         {
            case const_446:
               var_402 = new SingleProductContainer(this,param1);
               break;
            case const_468:
               var_402 = new MultiProductContainer(this,param1);
               break;
            case const_478:
               var_402 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_403);
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_826 > 0 && var_825 > 0)
         {
            var_562 = const_443;
         }
         else if(var_826 > 0)
         {
            var_562 = const_479;
         }
         else if(var_825 > 0)
         {
            var_562 = const_421;
         }
         else
         {
            var_562 = const_853;
         }
      }
   }
}
