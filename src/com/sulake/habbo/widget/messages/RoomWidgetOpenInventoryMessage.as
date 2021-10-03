package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_873:String = "inventory_badges";
      
      public static const const_1358:String = "inventory_clothes";
      
      public static const const_1316:String = "inventory_furniture";
      
      public static const const_564:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_871:String = "inventory_effects";
       
      
      private var var_2244:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_564);
         var_2244 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_2244;
      }
   }
}
