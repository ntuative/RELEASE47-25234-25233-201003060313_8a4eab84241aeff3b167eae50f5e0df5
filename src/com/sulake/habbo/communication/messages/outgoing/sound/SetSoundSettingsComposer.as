package com.sulake.habbo.communication.messages.outgoing.sound
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class SetSoundSettingsComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_31:Array;
      
      public function SetSoundSettingsComposer(param1:int)
      {
         var_31 = new Array();
         super();
         var_31.push(param1);
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         return var_31;
      }
      
      public function dispose() : void
      {
         var_31 = null;
      }
   }
}
