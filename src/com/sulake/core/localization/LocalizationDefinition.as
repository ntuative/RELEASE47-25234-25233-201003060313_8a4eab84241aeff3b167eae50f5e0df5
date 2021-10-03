package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1406:String;
      
      private var var_927:String;
      
      private var var_1404:String;
      
      private var var_1405:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1405 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1406 = _loc5_[0];
         var_1404 = _loc5_[1];
         _name = param2;
         var_927 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1406;
      }
      
      public function get languageCode() : String
      {
         return var_1405;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_927;
      }
      
      public function get encoding() : String
      {
         return var_1404;
      }
      
      public function get id() : String
      {
         return var_1405 + "_" + var_1406 + "." + var_1404;
      }
   }
}
