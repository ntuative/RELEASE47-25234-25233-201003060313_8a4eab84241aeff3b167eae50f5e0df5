package com.sulake.core.utils
{
   import deng.fzip.FZip;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   
   public class ZipLoader extends LibraryLoader
   {
       
      
      private var var_400:FZip;
      
      private var var_1212:Array;
      
      private var var_1853:uint = 0;
      
      private var var_823:int = 0;
      
      private var var_2365:Array;
      
      public function ZipLoader(param1:Boolean)
      {
         super(param1);
         var_1212 = new Array();
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log(param1.text);
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,0));
      }
      
      public function get resources() : Array
      {
         return var_1212;
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var _loc2_:LoaderInfo = param1.target as LoaderInfo;
         var _loc3_:String = getQualifiedClassName(var_18.content);
         var_1212.push(var_18.contentLoaderInfo.applicationDomain.getDefinition(_loc3_));
         ++var_823;
         if(var_1212.length == var_1853)
         {
            var_18.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoaderComplete);
            var_18.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,0));
         }
         else
         {
            var_18.loadBytes(var_400.getFileAt(var_823).content);
         }
      }
      
      override public function load(param1:URLRequest, param2:LoaderContext = null, param3:int = 1) : void
      {
         var_324 = param1;
         if(var_400)
         {
            var_400.close();
         }
         var_400 = new FZip();
         var_400.addEventListener(Event.COMPLETE,onComplete);
         var_400.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_400.addEventListener(ProgressEvent.PROGRESS,onProgress);
         var_400.load(var_324);
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,0));
      }
      
      private function onComplete(param1:Event) : void
      {
         var_823 = 0;
         var_1853 = var_400.getFileCount();
         removeEventListeners();
         var_18.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
         var_18.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_18.loadBytes(var_400.getFileAt(var_823).content);
      }
   }
}
