package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_351:Number = 0.5;
      
      private static const const_787:int = 3;
      
      private static const const_1114:Number = 1;
       
      
      private var var_2156:Boolean = false;
      
      private var var_2150:Boolean = false;
      
      private var var_1057:int = 0;
      
      private var var_269:Vector3d = null;
      
      private var var_2154:int = 0;
      
      private var var_2157:int = 0;
      
      private var var_2153:Boolean = false;
      
      private var var_2155:int = -2;
      
      private var var_2151:Boolean = false;
      
      private var var_2152:int = 0;
      
      private var var_2148:int = -1;
      
      private var var_426:Vector3d = null;
      
      private var var_2149:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_2154;
      }
      
      public function get targetId() : int
      {
         return var_2148;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_2152 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_2154 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_2156 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_2148 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_2150 = param1;
      }
      
      public function dispose() : void
      {
         var_426 = null;
         var_269 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_426 == null)
         {
            var_426 = new Vector3d();
         }
         var_426.assign(param1);
         var_1057 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_2155;
      }
      
      public function get screenHt() : int
      {
         return var_2149;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_2157 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_269;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_2149 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_2152;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_2156;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_2150;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_426 != null && var_269 != null)
         {
            ++var_1057;
            _loc2_ = Vector3d.dif(var_426,var_269);
            if(_loc2_.length <= const_351)
            {
               var_269 = var_426;
               var_426 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_351 * (const_787 + 1))
               {
                  _loc2_.mul(const_351);
               }
               else if(var_1057 <= const_787)
               {
                  _loc2_.mul(const_351);
               }
               else
               {
                  _loc2_.mul(const_1114);
               }
               var_269 = Vector3d.sum(var_269,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_2153 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_2157;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_2151 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_2155 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_269 != null)
         {
            return;
         }
         var_269 = new Vector3d();
         var_269.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_2153;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_2151;
      }
   }
}
