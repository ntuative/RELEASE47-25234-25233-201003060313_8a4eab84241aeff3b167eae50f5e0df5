package com.sulake.core.window
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.utils.IRectLimiter;
   import com.sulake.core.window.utils.WindowRectLimits;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowModel implements IDisposable
   {
       
      
      protected var _disposed:Boolean = false;
      
      protected var var_367:Rectangle;
      
      protected var var_16:uint;
      
      protected var var_145:Rectangle;
      
      protected var _type:uint;
      
      protected var var_1101:Boolean = true;
      
      protected var var_146:Rectangle;
      
      protected var var_619:uint = 16777215;
      
      protected var var_37:uint;
      
      protected var var_81:uint;
      
      protected var var_331:Boolean = true;
      
      protected var var_322:String = "";
      
      protected var var_75:WindowRectLimits;
      
      protected var var_1369:uint;
      
      protected var var_750:Boolean = false;
      
      protected var var_388:Number = 1;
      
      protected var var_56:Rectangle;
      
      protected var _id:uint;
      
      protected var _name:String;
      
      protected var var_7:Rectangle;
      
      protected var _context:WindowContext;
      
      protected var var_618:Array;
      
      public function WindowModel(param1:uint, param2:String, param3:uint, param4:uint, param5:uint, param6:WindowContext, param7:Rectangle, param8:Array = null)
      {
         super();
         _id = param1;
         _name = param2;
         _type = param3;
         var_16 = param5;
         var_37 = WindowState.const_84;
         var_81 = param4;
         var_618 = param8 == null ? new Array() : param8;
         _context = param6;
         var_7 = param7.clone();
         var_367 = param7.clone();
         var_56 = param7.clone();
         var_146 = new Rectangle();
         var_145 = null;
         var_75 = new WindowRectLimits(this as IWindow);
      }
      
      public function getMinHeight() : int
      {
         return var_75.minHeight;
      }
      
      public function testTypeFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (_type & param2 ^ param1) == 0;
         }
         return (_type & param1) == param1;
      }
      
      public function getMinWidth() : int
      {
         return var_75.minWidth;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get param() : uint
      {
         return var_16;
      }
      
      public function get state() : uint
      {
         return var_37;
      }
      
      public function getMaximizedWidth() : int
      {
         return var_145.width;
      }
      
      public function getMinimizedHeight() : int
      {
         return var_146.height;
      }
      
      public function get limits() : IRectLimiter
      {
         return var_75;
      }
      
      public function get tags() : Array
      {
         return var_618;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function testStateFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (var_37 & param2 ^ param1) == 0;
         }
         return (var_37 & param1) == param1;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            var_7 = null;
            var_37 = WindowState.const_370;
            _disposed = true;
            var_618 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get height() : int
      {
         return var_7.height;
      }
      
      public function get position() : Point
      {
         return var_7.topLeft;
      }
      
      public function get background() : Boolean
      {
         return var_750;
      }
      
      public function get context() : IWindowContext
      {
         return _context;
      }
      
      public function getMaximizedHeight() : int
      {
         return var_145.height;
      }
      
      public function get style() : uint
      {
         return var_81;
      }
      
      public function getMaxWidth() : int
      {
         return var_75.maxWidth;
      }
      
      public function invalidate(param1:Rectangle = null) : void
      {
      }
      
      public function testStyleFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (var_81 & param2 ^ param1) == 0;
         }
         return (var_81 & param1) == param1;
      }
      
      public function testParamFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (var_16 & param2 ^ param1) == 0;
         }
         return (var_16 & param1) == param1;
      }
      
      public function hasMaxHeight() : Boolean
      {
         return false;
      }
      
      public function get type() : uint
      {
         return _type;
      }
      
      public function get clipping() : Boolean
      {
         return var_1101;
      }
      
      public function setMinWidth(param1:int) : int
      {
         var _loc2_:int = 0;
         var_75.minWidth = param1;
         return _loc2_;
      }
      
      public function get width() : int
      {
         return var_7.width;
      }
      
      public function hasMinHeight() : Boolean
      {
         return false;
      }
      
      public function get blend() : Number
      {
         return var_388;
      }
      
      public function getInitialHeight() : int
      {
         return var_367.height;
      }
      
      public function getMinimizedWidth() : int
      {
         return var_146.width;
      }
      
      public function setMinHeight(param1:int) : int
      {
         var _loc2_:int = 0;
         var_75.minHeight = param1;
         return _loc2_;
      }
      
      public function getInitialWidth() : int
      {
         return var_367.width;
      }
      
      public function getPreviousWidth() : int
      {
         return var_56.width;
      }
      
      public function hasMinWidth() : Boolean
      {
         return false;
      }
      
      public function get color() : uint
      {
         return var_619;
      }
      
      public function get caption() : String
      {
         return var_322;
      }
      
      public function setMaxHeight(param1:int) : int
      {
         var _loc2_:int = 0;
         var_75.maxHeight = param1;
         return _loc2_;
      }
      
      public function get rectangle() : Rectangle
      {
         return var_7;
      }
      
      public function setMaxWidth(param1:int) : int
      {
         var _loc2_:int = 0;
         var_75.maxWidth = param1;
         return _loc2_;
      }
      
      public function get visible() : Boolean
      {
         return var_331;
      }
      
      public function getMaxHeight() : int
      {
         return var_75.maxHeight;
      }
      
      public function get x() : int
      {
         return var_7.x;
      }
      
      public function get y() : int
      {
         return var_7.y;
      }
      
      public function getPreviousHeight() : int
      {
         return var_56.height;
      }
      
      public function hasMaxWidth() : Boolean
      {
         return false;
      }
   }
}
