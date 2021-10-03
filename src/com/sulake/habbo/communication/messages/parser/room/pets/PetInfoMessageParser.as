package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1621:int;
      
      private var var_605:String;
      
      private var var_1616:int;
      
      private var var_1796:int;
      
      private var var_1620:int;
      
      private var var_1989:int;
      
      private var _nutrition:int;
      
      private var var_1255:int;
      
      private var var_1990:int;
      
      private var var_1987:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1623:int;
      
      private var var_1988:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1616;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_1989;
      }
      
      public function flush() : Boolean
      {
         var_1255 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_1990;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_1987;
      }
      
      public function get maxNutrition() : int
      {
         return var_1988;
      }
      
      public function get figure() : String
      {
         return var_605;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1796;
      }
      
      public function get petId() : int
      {
         return var_1255;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1255 = param1.readInteger();
         _name = param1.readString();
         var_1616 = param1.readInteger();
         var_1990 = param1.readInteger();
         var_1620 = param1.readInteger();
         var_1987 = param1.readInteger();
         _energy = param1.readInteger();
         var_1989 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_1988 = param1.readInteger();
         var_605 = param1.readString();
         var_1796 = param1.readInteger();
         var_1623 = param1.readInteger();
         var_1621 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1620;
      }
      
      public function get ownerId() : int
      {
         return var_1623;
      }
      
      public function get age() : int
      {
         return var_1621;
      }
   }
}
