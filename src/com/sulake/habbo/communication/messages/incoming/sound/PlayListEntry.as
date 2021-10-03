package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1609:int;
      
      private var var_1611:int = 0;
      
      private var var_1608:String;
      
      private var var_1612:int;
      
      private var var_1610:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1609 = param1;
         var_1612 = param2;
         var_1610 = param3;
         var_1608 = param4;
      }
      
      public function get length() : int
      {
         return var_1612;
      }
      
      public function get name() : String
      {
         return var_1610;
      }
      
      public function get creator() : String
      {
         return var_1608;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_1611;
      }
      
      public function get id() : int
      {
         return var_1609;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_1611 = param1;
      }
   }
}
