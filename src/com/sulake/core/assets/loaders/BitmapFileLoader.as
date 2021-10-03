package com.sulake.core.assets.loaders
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   
   public class BitmapFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_18:Loader;
      
      protected var var_927:String;
      
      protected var _type:String;
      
      protected var var_1099:LoaderContext;
      
      public function BitmapFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_927 = param2 == null ? "" : param2.url;
         _type = param1;
         var_18 = new Loader();
         var_1099 = new LoaderContext();
         var_1099.checkPolicyFile = true;
         var_18.contentLoaderInfo.addEventListener(Event.COMPLETE,loadEventHandler);
         var_18.contentLoaderInfo.addEventListener(Event.UNLOAD,loadEventHandler);
         var_18.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_18.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_18.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_18.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null && param2.url != null)
         {
            var_18.load(param2,var_1099);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return var_18.contentLoaderInfo.bytesTotal;
      }
      
      public function load(param1:URLRequest) : void
      {
         var_927 = param1.url;
         var_18.load(param1,var_1099);
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_18.contentLoaderInfo.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_18.contentLoaderInfo.removeEventListener(Event.UNLOAD,loadEventHandler);
            var_18.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_18.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_18.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_18.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            try
            {
               var_18.close();
            }
            catch(e:*)
            {
            }
            var_18.unload();
            var_18 = null;
            _type = null;
            var_927 = null;
         }
      }
      
      public function get mimeType() : String
      {
         return _type;
      }
      
      public function get url() : String
      {
         return var_927;
      }
      
      public function get bytesLoaded() : uint
      {
         return var_18.contentLoaderInfo.bytesLoaded;
      }
      
      public function get content() : Object
      {
         return var_18.content;
      }
      
      public function get loaderContext() : LoaderContext
      {
         return var_1099;
      }
   }
}
