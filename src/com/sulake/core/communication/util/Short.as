package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_666:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_666 = new ByteArray();
         var_666.writeShort(param1);
         var_666.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_666.position = 0;
         if(false)
         {
            _loc1_ = var_666.readShort();
            var_666.position = 0;
         }
         return _loc1_;
      }
   }
}
