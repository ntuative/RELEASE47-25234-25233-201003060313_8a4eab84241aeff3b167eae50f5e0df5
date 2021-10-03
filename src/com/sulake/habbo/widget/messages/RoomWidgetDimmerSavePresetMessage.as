package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_692:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1798:int;
      
      private var var_1797:int;
      
      private var var_1799:Boolean;
      
      private var var_1070:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_692);
         var_1797 = param1;
         var_1798 = param2;
         _color = param3;
         var_1070 = param4;
         var_1799 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1798;
      }
      
      public function get presetNumber() : int
      {
         return var_1797;
      }
      
      public function get brightness() : int
      {
         return var_1070;
      }
      
      public function get apply() : Boolean
      {
         return var_1799;
      }
   }
}
