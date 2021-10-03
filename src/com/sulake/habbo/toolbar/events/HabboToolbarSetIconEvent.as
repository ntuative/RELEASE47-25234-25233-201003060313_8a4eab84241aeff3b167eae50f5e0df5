package com.sulake.habbo.toolbar.events
{
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class HabboToolbarSetIconEvent extends Event
   {
      
      public static const const_920:String = "HTIE_SET_TOOLBAR_ICON_BITMAP";
      
      public static const const_176:String = "HTIE_REMOVE_TOOLBAR_ICON";
      
      public static const const_128:String = "HTIE_SET_TOOLBAR_ICON";
      
      public static const const_171:String = "HTIE_SET_TOOLBAR_ICON_STATE";
       
      
      private var var_1878:String;
      
      private var var_723:String;
      
      private var var_1223:String;
      
      private var _bitmapData:BitmapData;
      
      public function HabboToolbarSetIconEvent(param1:String, param2:String, param3:String = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         var_723 = param2;
         var_1223 = param3;
      }
      
      public function set bitmapData(param1:BitmapData) : void
      {
         _bitmapData = param1;
      }
      
      public function get iconState() : String
      {
         return var_1878;
      }
      
      public function get iconId() : String
      {
         return var_723;
      }
      
      public function set assetName(param1:String) : void
      {
         var_1223 = param1;
      }
      
      public function set iconState(param1:String) : void
      {
         var_1878 = param1;
      }
      
      public function get bitmapData() : BitmapData
      {
         return _bitmapData;
      }
      
      public function get assetName() : String
      {
         return var_1223;
      }
   }
}
