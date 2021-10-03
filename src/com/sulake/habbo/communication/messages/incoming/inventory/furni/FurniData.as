package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1370:String;
      
      private var var_1005:String;
      
      private var var_2118:Boolean;
      
      private var var_1424:int;
      
      private var var_2097:int;
      
      private var var_2119:Boolean;
      
      private var var_1745:String = "";
      
      private var var_2116:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1210:int;
      
      private var var_2117:Boolean;
      
      private var var_1609:int = -1;
      
      private var var_2120:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_2097 = param1;
         var_1005 = param2;
         _objId = param3;
         var_1210 = param4;
         _category = param5;
         var_1370 = param6;
         var_2118 = param7;
         var_2116 = param8;
         var_2117 = param9;
         var_2119 = param10;
         var_2120 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1745;
      }
      
      public function get extra() : int
      {
         return var_1424;
      }
      
      public function get classId() : int
      {
         return var_1210;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_2119;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_2118;
      }
      
      public function get stripId() : int
      {
         return var_2097;
      }
      
      public function get stuffData() : String
      {
         return var_1370;
      }
      
      public function get songId() : int
      {
         return var_1609;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1745 = param1;
         var_1424 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1005;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_2120;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2117;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2116;
      }
   }
}
