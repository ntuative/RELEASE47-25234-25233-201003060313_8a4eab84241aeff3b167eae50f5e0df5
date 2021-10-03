package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_906:String = "select_outfit";
       
      
      private var var_1649:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_906);
         var_1649 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_1649;
      }
   }
}
