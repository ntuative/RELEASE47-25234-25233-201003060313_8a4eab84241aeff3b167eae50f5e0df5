package com.sulake.habbo.room.events
{
   public class RoomEngineRoomColorEvent extends RoomEngineEvent
   {
      
      public static const const_533:String = "REE_ROOM_COLOR";
       
      
      private var var_2105:uint;
      
      private var var_1669:Boolean;
      
      private var _color:uint;
      
      public function RoomEngineRoomColorEvent(param1:int, param2:int, param3:uint, param4:uint, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_533,param1,param2,param6,param7);
         _color = param3;
         var_2105 = param4;
         var_1669 = param5;
      }
      
      public function get brightness() : uint
      {
         return var_2105;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get bgOnly() : Boolean
      {
         return var_1669;
      }
   }
}
