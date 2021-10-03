package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_520:String = "RWOCM_CLUB_MAIN";
      
      public static const const_534:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1829:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_534);
         var_1829 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1829;
      }
   }
}
