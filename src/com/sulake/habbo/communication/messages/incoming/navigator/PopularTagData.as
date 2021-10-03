package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PopularTagData
   {
       
      
      private var var_1694:int;
      
      private var var_1789:String;
      
      public function PopularTagData(param1:IMessageDataWrapper)
      {
         super();
         var_1789 = param1.readString();
         var_1694 = param1.readInteger();
      }
      
      public function get tagName() : String
      {
         return var_1789;
      }
      
      public function get userCount() : int
      {
         return var_1694;
      }
   }
}
