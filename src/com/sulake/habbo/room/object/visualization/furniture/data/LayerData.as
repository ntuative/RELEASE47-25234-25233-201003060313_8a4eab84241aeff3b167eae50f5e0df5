package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_428:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_466:int = 0;
      
      public static const const_811:int = 2;
      
      public static const const_845:int = 1;
      
      public static const const_585:Boolean = false;
      
      public static const const_570:String = "";
      
      public static const const_356:int = 0;
      
      public static const const_475:int = 0;
      
      public static const const_378:int = 0;
       
      
      private var var_1768:int = 0;
      
      private var var_1766:String = "";
      
      private var var_1425:int = 0;
      
      private var var_1764:int = 0;
      
      private var var_1765:Number = 0;
      
      private var var_1763:int = 255;
      
      private var var_1767:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1768;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1425 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1765;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1764 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1768 = param1;
      }
      
      public function get tag() : String
      {
         return var_1766;
      }
      
      public function get alpha() : int
      {
         return var_1763;
      }
      
      public function get ink() : int
      {
         return var_1425;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1765 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1764;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1767 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1767;
      }
      
      public function set tag(param1:String) : void
      {
         var_1766 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1763 = param1;
      }
   }
}
