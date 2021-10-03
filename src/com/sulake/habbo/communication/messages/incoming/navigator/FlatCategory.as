package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_331:Boolean;
      
      private var var_1113:int;
      
      private var var_1508:String;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         var_1113 = param1.readInteger();
         var_1508 = param1.readString();
         var_331 = param1.readBoolean();
      }
      
      public function get visible() : Boolean
      {
         return var_331;
      }
      
      public function get nodeName() : String
      {
         return var_1508;
      }
      
      public function get nodeId() : int
      {
         return var_1113;
      }
   }
}
