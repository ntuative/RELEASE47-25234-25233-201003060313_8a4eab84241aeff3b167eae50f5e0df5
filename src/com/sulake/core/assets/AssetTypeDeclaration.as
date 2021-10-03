package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_1814:Class;
      
      private var var_1813:Class;
      
      private var var_1815:String;
      
      private var var_1203:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_1815 = param1;
         var_1813 = param2;
         var_1814 = param3;
         if(rest == null)
         {
            var_1203 = new Array();
         }
         else
         {
            var_1203 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_1814;
      }
      
      public function get assetClass() : Class
      {
         return var_1813;
      }
      
      public function get mimeType() : String
      {
         return var_1815;
      }
      
      public function get fileTypes() : Array
      {
         return var_1203;
      }
   }
}
