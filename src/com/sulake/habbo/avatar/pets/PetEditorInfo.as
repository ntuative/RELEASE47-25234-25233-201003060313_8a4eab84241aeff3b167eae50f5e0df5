package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_1994:Boolean;
      
      private var var_1995:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_1994 = Boolean(parseInt(param1.@club));
         var_1995 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_1994;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1995;
      }
   }
}
