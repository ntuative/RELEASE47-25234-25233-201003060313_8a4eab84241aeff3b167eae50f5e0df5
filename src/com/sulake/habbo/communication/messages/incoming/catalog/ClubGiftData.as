package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_2059:int;
      
      private var var_2058:Boolean;
      
      private var _offerId:int;
      
      private var var_1995:Boolean;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_2058 = param1.readBoolean();
         var_2059 = param1.readInteger();
         var_1995 = param1.readBoolean();
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1995;
      }
      
      public function get monthsRequired() : int
      {
         return var_2059;
      }
      
      public function get isVip() : Boolean
      {
         return var_2058;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
   }
}
