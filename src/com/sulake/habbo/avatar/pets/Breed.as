package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_1015:String;
      
      private var _id:int;
      
      private var var_2236:String = "";
      
      private var var_2237:int;
      
      private var var_2238:String;
      
      private var var_2082:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_2237 = parseInt(param1.@pattern);
         var_1015 = String(param1.@gender);
         var_2082 = Boolean(parseInt(param1.@colorable));
         var_2236 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_2236;
      }
      
      public function get isColorable() : Boolean
      {
         return var_2082;
      }
      
      public function get gender() : String
      {
         return var_1015;
      }
      
      public function get patternId() : int
      {
         return var_2237;
      }
      
      public function get avatarFigureString() : String
      {
         return var_2238;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_2238 = param1;
      }
   }
}
