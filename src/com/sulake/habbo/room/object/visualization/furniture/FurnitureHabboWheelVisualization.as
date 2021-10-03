package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1063:int = 31;
      
      private static const const_1060:int = 32;
      
      private static const const_756:int = 10;
      
      private static const const_491:int = 20;
       
      
      private var var_570:Boolean = false;
      
      private var var_215:Array;
      
      public function FurnitureHabboWheelVisualization()
      {
         var_215 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_570 = true;
            var_215 = new Array();
            var_215.push(const_1063);
            var_215.push(const_1060);
            return;
         }
         if(param1 > 0 && param1 <= const_756)
         {
            if(var_570)
            {
               var_570 = false;
               var_215 = new Array();
               var_215.push(const_756 + param1);
               var_215.push(const_491 + param1);
               var_215.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
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
