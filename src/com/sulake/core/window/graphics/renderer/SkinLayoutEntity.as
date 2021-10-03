package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_238:uint = 1;
      
      public static const const_435:uint = 0;
      
      public static const const_952:uint = 8;
      
      public static const const_276:uint = 4;
      
      public static const const_382:uint = 2;
       
      
      private var var_388:uint;
      
      private var var_2114:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_2115:uint;
      
      private var var_98:Rectangle;
      
      private var var_618:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         _id = param1;
         _name = param2;
         var_98 = param3;
         _color = param4;
         var_388 = param5;
         var_2114 = param6;
         var_2115 = param7;
         var_618 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return var_2114;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get blend() : uint
      {
         return var_388;
      }
      
      public function get scaleV() : uint
      {
         return var_2115;
      }
      
      public function get tags() : Array
      {
         return var_618;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var_98 = null;
         var_618 = null;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get region() : Rectangle
      {
         return var_98;
      }
   }
}
