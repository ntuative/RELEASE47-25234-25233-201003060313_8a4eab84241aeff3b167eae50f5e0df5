package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1078:int = 0;
      
      private var var_1135:int = 0;
      
      private var var_1656:String = "";
      
      private var var_1077:int = 0;
      
      private var var_1651:String = "";
      
      private var var_1655:int = 0;
      
      private var var_1549:String = "";
      
      private var var_1657:int = 0;
      
      private var var_1654:int = 0;
      
      private var var_1653:String = "";
      
      private var var_1652:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1657 = param1;
         var_1653 = param2;
         var_1549 = param3;
         var_1656 = param4;
         var_1651 = param5;
         if(param6)
         {
            var_1135 = 1;
         }
         else
         {
            var_1135 = 0;
         }
         var_1655 = param7;
         var_1654 = param8;
         var_1077 = param9;
         var_1652 = param10;
         var_1078 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1657,var_1653,var_1549,var_1656,var_1651,var_1135,var_1655,var_1654,var_1077,var_1652,var_1078];
      }
      
      public function dispose() : void
      {
      }
   }
}
