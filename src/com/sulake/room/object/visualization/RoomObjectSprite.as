package com.sulake.room.object.visualization
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public final class RoomObjectSprite implements IRoomObjectSprite
   {
      
      private static var var_1249:int = 0;
       
      
      private var _updateID:int = 0;
      
      private var var_1963:Boolean = false;
      
      private var var_1962:String = "normal";
      
      private var var_1223:String = "";
      
      private var _instanceId:int = 0;
      
      private var var_331:Boolean = true;
      
      private var _height:int = 0;
      
      private var var_1763:int = 255;
      
      private var _color:int = 16777215;
      
      private var var_962:Boolean = false;
      
      private var var_961:Boolean = false;
      
      private var var_1964:Boolean = false;
      
      private var _offset:Point;
      
      private var var_1961:Boolean = true;
      
      private var var_1028:Number = 0;
      
      private var _width:int = 0;
      
      private var var_1766:String = "";
      
      private var var_828:BitmapData = null;
      
      public function RoomObjectSprite()
      {
         _offset = new Point(0,0);
         super();
         _instanceId = var_1249++;
      }
      
      public function set flipV(param1:Boolean) : void
      {
         var_961 = param1;
         ++_updateID;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         var_1964 = param1;
         ++_updateID;
      }
      
      public function dispose() : void
      {
         var_828 = null;
         _width = 0;
         _height = 0;
      }
      
      public function get offsetX() : int
      {
         return _offset.x;
      }
      
      public function get offsetY() : int
      {
         return _offset.y;
      }
      
      public function get height() : int
      {
         return _height;
      }
      
      public function set blendMode(param1:String) : void
      {
         var_1962 = param1;
         ++_updateID;
      }
      
      public function set tag(param1:String) : void
      {
         var_1766 = param1;
         ++_updateID;
      }
      
      public function set assetName(param1:String) : void
      {
         var_1223 = param1;
         ++_updateID;
      }
      
      public function get varyingDepth() : Boolean
      {
         return var_1963;
      }
      
      public function set offsetX(param1:int) : void
      {
         _offset.x = param1;
         ++_updateID;
      }
      
      public function set offsetY(param1:int) : void
      {
         _offset.y = param1;
         ++_updateID;
      }
      
      public function get relativeDepth() : Number
      {
         return var_1028;
      }
      
      public function get color() : int
      {
         return _color;
      }
      
      public function get alpha() : int
      {
         return var_1763;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         var_1961 = param1;
         ++_updateID;
      }
      
      public function get visible() : Boolean
      {
         return var_331;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         var_1963 = param1;
         ++_updateID;
      }
      
      public function get flipH() : Boolean
      {
         return var_962;
      }
      
      public function get flipV() : Boolean
      {
         return var_961;
      }
      
      public function get clickHandling() : Boolean
      {
         return var_1964;
      }
      
      public function get blendMode() : String
      {
         return var_1962;
      }
      
      public function get instanceId() : int
      {
         return _instanceId;
      }
      
      public function get tag() : String
      {
         return var_1766;
      }
      
      public function get assetName() : String
      {
         return var_1223;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         var_1028 = param1;
         ++_updateID;
      }
      
      public function get capturesMouse() : Boolean
      {
         return var_1961;
      }
      
      public function set alpha(param1:int) : void
      {
         param1 &= 255;
         var_1763 = param1;
         ++_updateID;
      }
      
      public function get width() : int
      {
         return _width;
      }
      
      public function get updateId() : int
      {
         return _updateID;
      }
      
      public function set color(param1:int) : void
      {
         param1 &= 16777215;
         _color = param1;
         ++_updateID;
      }
      
      public function set asset(param1:BitmapData) : void
      {
         if(param1 != null)
         {
            _width = param1.width;
            _height = param1.height;
         }
         var_828 = param1;
         ++_updateID;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_331 = param1;
         ++_updateID;
      }
      
      public function get asset() : BitmapData
      {
         return var_828;
      }
      
      public function set flipH(param1:Boolean) : void
      {
         var_962 = param1;
         ++_updateID;
      }
   }
}
