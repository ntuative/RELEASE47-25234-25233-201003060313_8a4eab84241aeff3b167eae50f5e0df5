package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_232:String = "e";
      
      public static const const_77:String = "i";
      
      public static const const_83:String = "s";
       
      
      private var var_1046:String;
      
      private var var_1272:String;
      
      private var var_1273:int;
      
      private var var_1830:int;
      
      private var var_1045:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1272 = param1.readString();
         var_1830 = param1.readInteger();
         var_1046 = param1.readString();
         var_1045 = param1.readInteger();
         var_1273 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1045;
      }
      
      public function get productType() : String
      {
         return var_1272;
      }
      
      public function get expiration() : int
      {
         return var_1273;
      }
      
      public function get furniClassId() : int
      {
         return var_1830;
      }
      
      public function get extraParam() : String
      {
         return var_1046;
      }
   }
}
