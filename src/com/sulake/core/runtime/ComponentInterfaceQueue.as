package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1154:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_783:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1154 = param1;
         var_783 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_783;
      }
      
      public function get identifier() : IID
      {
         return var_1154;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1154 = null;
            while(false)
            {
               var_783.pop();
            }
            var_783 = null;
         }
      }
   }
}
