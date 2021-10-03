package com.sulake.room.renderer.utils
{
   public class ObjectMouseData
   {
       
      
      private var var_1779:String = "";
      
      private var var_159:String = "";
      
      public function ObjectMouseData()
      {
         super();
      }
      
      public function set spriteTag(param1:String) : void
      {
         var_1779 = param1;
      }
      
      public function set objectId(param1:String) : void
      {
         var_159 = param1;
      }
      
      public function get spriteTag() : String
      {
         return var_1779;
      }
      
      public function get objectId() : String
      {
         return var_159;
      }
   }
}
