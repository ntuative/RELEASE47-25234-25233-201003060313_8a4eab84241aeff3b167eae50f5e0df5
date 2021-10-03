package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1774:Boolean = false;
      
      private var var_1777:Boolean = false;
      
      private var var_1779:String = "";
      
      private var _type:String = "";
      
      private var var_1782:Boolean = false;
      
      private var var_1780:Number = 0;
      
      private var var_1775:Number = 0;
      
      private var var_1781:Number = 0;
      
      private var var_1773:String = "";
      
      private var var_1776:Number = 0;
      
      private var var_1778:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_1773 = param2;
         var_1779 = param3;
         var_1775 = param4;
         var_1781 = param5;
         var_1780 = param6;
         var_1776 = param7;
         var_1778 = param8;
         var_1777 = param9;
         var_1782 = param10;
         var_1774 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1778;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1774;
      }
      
      public function get localX() : Number
      {
         return var_1780;
      }
      
      public function get localY() : Number
      {
         return var_1776;
      }
      
      public function get canvasId() : String
      {
         return var_1773;
      }
      
      public function get altKey() : Boolean
      {
         return var_1777;
      }
      
      public function get spriteTag() : String
      {
         return var_1779;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_1775;
      }
      
      public function get screenY() : Number
      {
         return var_1781;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1782;
      }
   }
}
