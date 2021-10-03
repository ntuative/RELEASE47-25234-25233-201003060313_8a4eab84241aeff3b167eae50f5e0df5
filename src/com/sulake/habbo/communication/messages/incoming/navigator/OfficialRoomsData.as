package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomsData implements IDisposable, MsgWithRequestId
   {
       
      
      private var var_689:Array;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomsData(param1:IMessageDataWrapper)
      {
         var_689 = new Array();
         super();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_689.push(new OfficialRoomEntryData(param1));
            _loc3_++;
         }
      }
      
      public function get entries() : Array
      {
         return var_689;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_689 != null)
         {
            for each(_loc1_ in var_689)
            {
               _loc1_.dispose();
            }
         }
         var_689 = null;
      }
   }
}
