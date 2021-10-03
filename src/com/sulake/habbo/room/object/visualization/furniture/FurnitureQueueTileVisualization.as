package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1099:int = 1;
      
      private static const const_1060:int = 3;
      
      private static const const_1100:int = 2;
      
      private static const const_1101:int = 15;
       
      
      private var var_848:int;
      
      private var var_215:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_215 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1100)
         {
            var_215 = new Array();
            var_215.push(const_1099);
            var_848 = const_1101;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_848 > 0)
         {
            --var_848;
         }
         if(var_848 == 0)
         {
            if(false)
            {
               super.setAnimation(var_215.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
