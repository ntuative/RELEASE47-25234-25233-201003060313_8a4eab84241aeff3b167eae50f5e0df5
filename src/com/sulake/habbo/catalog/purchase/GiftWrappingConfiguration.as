package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_583:Array;
      
      private var var_1247:int;
      
      private var var_1401:Array;
      
      private var var_582:Array;
      
      private var var_1723:Boolean = false;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_1723 = _loc2_.isWrappingEnabled;
         var_1247 = _loc2_.wrappingPrice;
         var_1401 = _loc2_.stuffTypes;
         var_582 = _loc2_.boxTypes;
         var_583 = _loc2_.ribbonTypes;
      }
      
      public function get ribbonTypes() : Array
      {
         return var_583;
      }
      
      public function get stuffTypes() : Array
      {
         return var_1401;
      }
      
      public function get price() : int
      {
         return var_1247;
      }
      
      public function get boxTypes() : Array
      {
         return var_582;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1723;
      }
   }
}
