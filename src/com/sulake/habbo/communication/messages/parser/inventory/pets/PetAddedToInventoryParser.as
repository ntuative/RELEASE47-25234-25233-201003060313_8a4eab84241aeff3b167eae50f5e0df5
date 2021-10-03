package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetAddedToInventoryParser implements IMessageParser
   {
       
      
      private var var_1080:PetData;
      
      private var var_1771:Boolean;
      
      public function PetAddedToInventoryParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_1080 = null;
         return true;
      }
      
      public function get purchased() : Boolean
      {
         return var_1771;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1080 = new PetData(param1);
         var_1771 = param1.readBoolean();
         return true;
      }
      
      public function get pet() : PetData
      {
         return var_1080;
      }
   }
}
