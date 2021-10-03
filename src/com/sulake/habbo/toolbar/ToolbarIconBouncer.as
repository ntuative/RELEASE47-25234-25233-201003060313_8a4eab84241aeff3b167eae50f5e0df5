package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2248:Number;
      
      private var var_615:Number = 0;
      
      private var var_2247:Number;
      
      private var var_614:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_2248 = param1;
         var_2247 = param2;
      }
      
      public function update() : void
      {
         var_614 += var_2247;
         var_615 += var_614;
         if(var_615 > 0)
         {
            var_615 = 0;
            var_614 = var_2248 * -1 * var_614;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_614 = param1;
         var_615 = 0;
      }
      
      public function get location() : Number
      {
         return var_615;
      }
   }
}
