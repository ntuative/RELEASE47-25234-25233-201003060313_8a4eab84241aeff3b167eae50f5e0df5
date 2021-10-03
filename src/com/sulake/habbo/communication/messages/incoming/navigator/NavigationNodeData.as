package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1113:int;
      
      private var var_1508:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1113 = param1;
         var_1508 = param2;
         Logger.log("READ NODE: " + var_1113 + ", " + var_1508);
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
