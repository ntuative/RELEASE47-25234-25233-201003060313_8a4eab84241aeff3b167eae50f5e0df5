package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1063:int = 31;
      
      private static const const_1060:int = 32;
      
      private static const const_492:int = 30;
      
      private static const const_756:int = 20;
      
      private static const const_491:int = 10;
       
      
      private var var_570:Boolean = false;
      
      private var var_215:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_215 = new Array();
         super();
         super.setAnimation(const_492);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            var_570 = true;
            var_215 = new Array();
            var_215.push(const_1063);
            var_215.push(const_1060);
            return;
         }
         if(param1 > 0 && param1 <= const_491)
         {
            if(var_570)
            {
               var_570 = false;
               var_215 = new Array();
               if(_direction == 2)
               {
                  var_215.push(const_756 + 5 - param1);
                  var_215.push(const_491 + 5 - param1);
               }
               else
               {
                  var_215.push(const_756 + param1);
                  var_215.push(const_491 + param1);
               }
               var_215.push(const_492);
               return;
            }
            super.setAnimation(const_492);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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
