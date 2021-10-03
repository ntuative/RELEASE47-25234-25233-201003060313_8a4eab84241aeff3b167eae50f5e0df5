package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStickieSendUpdateMessage extends RoomWidgetMessage
   {
      
      public static const const_413:String = "RWSUM_STICKIE_SEND_UPDATE";
      
      public static const const_734:String = "RWSUM_STICKIE_SEND_DELETE";
       
      
      private var var_643:String;
      
      private var var_159:int;
      
      private var var_198:String;
      
      public function RoomWidgetStickieSendUpdateMessage(param1:String, param2:int, param3:String = "", param4:String = "")
      {
         super(param1);
         var_159 = param2;
         var_198 = param3;
         var_643 = param4;
      }
      
      public function get objectId() : int
      {
         return var_159;
      }
      
      public function get text() : String
      {
         return var_198;
      }
      
      public function get colorHex() : String
      {
         return var_643;
      }
   }
}
