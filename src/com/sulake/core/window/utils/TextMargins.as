package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   
   public class TextMargins implements IMargins, IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_769:int;
      
      private var _right:int;
      
      private var var_770:int;
      
      private var var_771:int;
      
      private var var_180:Function;
      
      public function TextMargins(param1:int, param2:int, param3:int, param4:int, param5:Function)
      {
         super();
         var_770 = param1;
         var_771 = param2;
         _right = param3;
         var_769 = param4;
         var_180 = param5 != null ? param5 : nullCallback;
      }
      
      public function set bottom(param1:int) : void
      {
         var_769 = param1;
         var_180(this);
      }
      
      public function get left() : int
      {
         return var_770;
      }
      
      public function get isZeroes() : Boolean
      {
         return var_770 == 0 && _right == 0 && var_771 == 0 && var_769 == 0;
      }
      
      public function get right() : int
      {
         return _right;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set top(param1:int) : void
      {
         var_771 = param1;
         var_180(this);
      }
      
      public function get top() : int
      {
         return var_771;
      }
      
      public function set left(param1:int) : void
      {
         var_770 = param1;
         var_180(this);
      }
      
      public function get bottom() : int
      {
         return var_769;
      }
      
      public function clone(param1:Function) : TextMargins
      {
         return new TextMargins(var_770,var_771,_right,var_769,param1);
      }
      
      public function dispose() : void
      {
         var_180 = null;
         _disposed = true;
      }
      
      public function set right(param1:int) : void
      {
         _right = param1;
         var_180(this);
      }
      
      private function nullCallback(param1:IMargins) : void
      {
      }
   }
}
