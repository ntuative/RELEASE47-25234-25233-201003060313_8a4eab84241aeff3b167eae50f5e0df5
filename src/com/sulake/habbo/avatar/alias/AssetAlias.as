package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_961:Boolean;
      
      private var _name:String;
      
      private var var_1936:String;
      
      private var var_962:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_1936 = String(param1.@link);
         var_962 = Boolean(parseInt(param1.@fliph));
         var_961 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_962;
      }
      
      public function get flipV() : Boolean
      {
         return var_961;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_1936;
      }
   }
}
