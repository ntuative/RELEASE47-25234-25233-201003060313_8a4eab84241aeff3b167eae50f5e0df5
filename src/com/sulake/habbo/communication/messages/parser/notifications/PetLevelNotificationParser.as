package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_605:String;
      
      private var var_1616:int;
      
      private var var_2021:String;
      
      private var var_1090:int;
      
      private var var_1255:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1255;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1255 = param1.readInteger();
         var_2021 = param1.readString();
         var_1616 = param1.readInteger();
         var_605 = param1.readString();
         var_1090 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_2021;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_605;
      }
      
      public function get petType() : int
      {
         return var_1090;
      }
      
      public function get level() : int
      {
         return var_1616;
      }
   }
}
