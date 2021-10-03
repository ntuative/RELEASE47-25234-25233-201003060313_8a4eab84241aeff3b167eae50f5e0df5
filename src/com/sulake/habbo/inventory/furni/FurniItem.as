package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_2097:int;
      
      private var var_2116:Boolean;
      
      private var var_1609:int;
      
      private var var_1370:String;
      
      private var var_2250:Boolean = false;
      
      private var var_2120:int;
      
      private var var_445:int;
      
      private var var_1005:String;
      
      private var var_1745:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1210:int;
      
      private var var_2117:Boolean;
      
      private var var_2251:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_2097 = param1;
         var_1005 = param2;
         _objId = param3;
         var_1210 = param4;
         var_1370 = param5;
         var_2116 = param6;
         var_2117 = param7;
         var_2120 = param8;
         var_1745 = param9;
         var_1609 = param10;
         var_445 = -1;
      }
      
      public function get songId() : int
      {
         return var_1609;
      }
      
      public function get iconCallbackId() : int
      {
         return var_445;
      }
      
      public function get expiryTime() : int
      {
         return var_2120;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_2251 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_2250 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_445 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2117;
      }
      
      public function get slotId() : String
      {
         return var_1745;
      }
      
      public function get classId() : int
      {
         return var_1210;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2116;
      }
      
      public function get stuffData() : String
      {
         return var_1370;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_2097;
      }
      
      public function get isLocked() : Boolean
      {
         return var_2250;
      }
      
      public function get prevCallbackId() : int
      {
         return var_2251;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1005;
      }
   }
}
