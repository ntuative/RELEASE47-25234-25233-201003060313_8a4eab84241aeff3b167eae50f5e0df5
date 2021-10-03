package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
   import flash.display.BitmapData;
   
   public class PlaneTextureBitmap
   {
      
      public static const const_49:Number = -1;
      
      public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;
       
      
      private var _normalMaxX:Number = 1;
      
      private var var_1606:Number = -1;
      
      private var var_1607:Number = -1;
      
      private var _bitmap:BitmapData = null;
      
      private var var_1605:Number = 1;
      
      public function PlaneTextureBitmap(param1:BitmapData, param2:Number = -1, param3:Number = 1, param4:Number = -1, param5:Number = 1)
      {
         super();
         var_1607 = param2;
         _normalMaxX = param3;
         var_1606 = param4;
         var_1605 = param5;
         _bitmap = param1;
      }
      
      public function get normalMaxX() : Number
      {
         return _normalMaxX;
      }
      
      public function get normalMaxY() : Number
      {
         return var_1605;
      }
      
      public function get normalMinX() : Number
      {
         return var_1607;
      }
      
      public function get bitmap() : BitmapData
      {
         return _bitmap;
      }
      
      public function get normalMinY() : Number
      {
         return var_1606;
      }
      
      public function dispose() : void
      {
         _bitmap = null;
      }
   }
}
