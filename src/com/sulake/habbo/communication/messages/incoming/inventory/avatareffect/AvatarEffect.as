package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
   public class AvatarEffect
   {
       
      
      private var var_1685:int;
      
      private var var_1190:int;
      
      private var _type:int;
      
      private var var_1684:int;
      
      public function AvatarEffect()
      {
         super();
      }
      
      public function get inactiveEffectsInInventory() : int
      {
         return var_1684;
      }
      
      public function set secondsLeftIfActive(param1:int) : void
      {
         var_1685 = param1;
      }
      
      public function get duration() : int
      {
         return var_1190;
      }
      
      public function set inactiveEffectsInInventory(param1:int) : void
      {
         var_1684 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1190 = param1;
      }
      
      public function get secondsLeftIfActive() : int
      {
         return var_1685;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
   }
}
