package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_1928:Number = 0;
      
      private var var_1927:Number = 0;
      
      private var var_1926:Number = 0;
      
      private var var_1929:Number = 0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1927 = param1;
         var_1926 = param2;
         var_1928 = param3;
         var_1929 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1927;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1928;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1926;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1929;
      }
   }
}
