package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LagWarningReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2163:int;
      
      private var var_2164:int;
      
      public function LagWarningReportMessageComposer(param1:int, param2:int)
      {
         super();
         var_2163 = param1;
         var_2164 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_2163,var_2164];
      }
   }
}
