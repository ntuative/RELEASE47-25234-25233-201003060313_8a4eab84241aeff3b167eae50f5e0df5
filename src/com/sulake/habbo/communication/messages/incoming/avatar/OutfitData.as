package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1744:String;
      
      private var var_1015:String;
      
      private var var_1745:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1745 = param1.readInteger();
         var_1744 = param1.readString();
         var_1015 = param1.readString();
      }
      
      public function get gender() : String
      {
         return var_1015;
      }
      
      public function get figureString() : String
      {
         return var_1744;
      }
      
      public function get slotId() : int
      {
         return var_1745;
      }
   }
}
