package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_696:IAssetLoader;
      
      private var var_1223:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1223 = param1;
         var_696 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_696;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_696 != null)
            {
               if(true)
               {
                  var_696.dispose();
                  var_696 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1223;
      }
   }
}
