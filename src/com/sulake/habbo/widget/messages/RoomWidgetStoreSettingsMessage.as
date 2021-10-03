package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStoreSettingsMessage extends RoomWidgetMessage
   {
      
      public static const const_710:String = "RWSSM_STORE_SOUND";
      
      public static const const_563:String = "RWSSM_PREVIEW_SOUND";
      
      public static const const_1383:String = "RWSSM_STORE_SETTINGS";
       
      
      private var var_687:Number;
      
      public function RoomWidgetStoreSettingsMessage(param1:String)
      {
         super(param1);
      }
      
      public function set volume(param1:Number) : void
      {
         var_687 = param1;
      }
      
      public function get volume() : Number
      {
         return var_687;
      }
   }
}
