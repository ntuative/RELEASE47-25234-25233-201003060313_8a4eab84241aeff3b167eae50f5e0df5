package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRedeemClubPromoMessage extends RoomWidgetMessage
   {
      
      public static const const_583:String = "rwrcp_redeem_club_promo";
       
      
      private var var_1938:String;
      
      private var var_1937:Boolean;
      
      public function RoomWidgetRedeemClubPromoMessage(param1:String, param2:String, param3:Boolean)
      {
         super(param1);
         var_1938 = param2;
         var_1937 = param3;
      }
      
      public function get code() : String
      {
         return var_1938;
      }
      
      public function get isTrial() : Boolean
      {
         return var_1937;
      }
   }
}
