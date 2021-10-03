package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1005:String;
      
      private var var_1707:int;
      
      private var var_1709:int;
      
      private var var_1424:int;
      
      private var var_1708:int;
      
      private var _category:int;
      
      private var var_2355:int;
      
      private var var_1713:int;
      
      private var var_1711:int;
      
      private var var_1712:int;
      
      private var var_1714:int;
      
      private var var_1710:Boolean;
      
      private var var_1370:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_1707 = param1;
         var_1005 = param2;
         var_1709 = param3;
         var_1712 = param4;
         _category = param5;
         var_1370 = param6;
         var_1424 = param7;
         var_1711 = param8;
         var_1713 = param9;
         var_1714 = param10;
         var_1708 = param11;
         var_1710 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1712;
      }
      
      public function get extra() : int
      {
         return var_1424;
      }
      
      public function get stuffData() : String
      {
         return var_1370;
      }
      
      public function get groupable() : Boolean
      {
         return var_1710;
      }
      
      public function get creationMonth() : int
      {
         return var_1714;
      }
      
      public function get roomItemID() : int
      {
         return var_1709;
      }
      
      public function get itemType() : String
      {
         return var_1005;
      }
      
      public function get itemID() : int
      {
         return var_1707;
      }
      
      public function get songID() : int
      {
         return var_1424;
      }
      
      public function get timeToExpiration() : int
      {
         return var_1711;
      }
      
      public function get creationYear() : int
      {
         return var_1708;
      }
      
      public function get creationDay() : int
      {
         return var_1713;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
