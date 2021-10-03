package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPetCommandsUpdateEvent extends RoomSessionEvent
   {
      
      public static const const_143:String = "RSPIUE_ENABLED_PET_COMMANDS";
       
      
      private var var_1255:int;
      
      private var var_1627:Array;
      
      public function RoomSessionPetCommandsUpdateEvent(param1:IRoomSession, param2:int, param3:Array, param4:Boolean = false, param5:Boolean = false)
      {
         super(RoomSessionPetCommandsUpdateEvent.const_143,param1,param4,param5);
         var_1255 = param2;
         var_1627 = param3;
      }
      
      public function get enabledCommands() : Array
      {
         return var_1627;
      }
      
      public function get petId() : int
      {
         return var_1255;
      }
   }
}
