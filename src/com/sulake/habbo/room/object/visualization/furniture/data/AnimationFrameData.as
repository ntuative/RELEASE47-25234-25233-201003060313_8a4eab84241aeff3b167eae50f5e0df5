package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrameData
   {
       
      
      private var _id:int = 0;
      
      private var var_2112:int = 0;
      
      private var var_2111:int = 0;
      
      private var var_87:int = 0;
      
      private var _y:int = 0;
      
      public function AnimationFrameData(param1:int, param2:int, param3:int, param4:int, param5:int)
      {
         super();
         _id = param1;
         var_87 = param2;
         _y = param3;
         var_2112 = param4;
         var_2111 = param5;
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function get randomX() : int
      {
         return var_2112;
      }
      
      public function get x() : int
      {
         return var_87;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get randomY() : int
      {
         return var_2111;
      }
   }
}
