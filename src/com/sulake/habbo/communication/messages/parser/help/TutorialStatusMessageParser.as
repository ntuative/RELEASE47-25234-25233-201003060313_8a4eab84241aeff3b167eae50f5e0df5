package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1088:Boolean;
      
      private var var_1086:Boolean;
      
      private var var_1087:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1088;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1086;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1087 = param1.readBoolean();
         var_1086 = param1.readBoolean();
         var_1088 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1087;
      }
      
      public function flush() : Boolean
      {
         var_1087 = false;
         var_1086 = false;
         var_1088 = false;
         return true;
      }
   }
}
