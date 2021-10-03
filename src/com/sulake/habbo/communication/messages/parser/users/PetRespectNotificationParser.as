package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1796:int;
      
      private var var_1195:PetData;
      
      private var var_1795:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1796;
      }
      
      public function get petData() : PetData
      {
         return var_1195;
      }
      
      public function flush() : Boolean
      {
         var_1195 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1795;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1796 = param1.readInteger();
         var_1795 = param1.readInteger();
         var_1195 = new PetData(param1);
         return true;
      }
   }
}
