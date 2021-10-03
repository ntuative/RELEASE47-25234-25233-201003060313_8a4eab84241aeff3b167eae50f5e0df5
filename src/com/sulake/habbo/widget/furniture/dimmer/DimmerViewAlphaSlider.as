package com.sulake.habbo.widget.furniture.dimmer
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class DimmerViewAlphaSlider
   {
       
      
      private var _view:DimmerView;
      
      private var var_2362:int;
      
      private var var_553:BitmapData;
      
      private var var_987:int = 255;
      
      private var var_1441:int;
      
      private var var_656:int = 0;
      
      private var _sliderContainer:IWindowContainer;
      
      private var var_554:BitmapData;
      
      public function DimmerViewAlphaSlider(param1:DimmerView, param2:IWindowContainer, param3:IAssetLibrary, param4:int = 0, param5:int = 255)
      {
         super();
         _view = param1;
         _sliderContainer = param2;
         var_656 = param4;
         var_987 = param5;
         storeAssets(param3);
         displaySlider();
      }
      
      private function buttonProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.const_97 && param1.type != WindowMouseEvent.const_430)
         {
            return;
         }
         _view.selectedBrightness = getValue(param2.x);
      }
      
      private function displaySlider() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_sliderContainer == null)
         {
            return;
         }
         _loc2_ = _sliderContainer.findChildByName("slider_base") as IBitmapWrapperWindow;
         if(_loc2_ != null && var_554 != null)
         {
            _loc2_.bitmap = new BitmapData(var_554.width,var_554.height,true,16777215);
            _loc2_.bitmap.copyPixels(var_554,var_554.rect,new Point(0,0),null,null,true);
         }
         _loc1_ = _sliderContainer.findChildByName("slider_movement_area") as IWindowContainer;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.findChildByName("slider_button") as IBitmapWrapperWindow;
            if(_loc2_ != null && var_553 != null)
            {
               _loc2_.bitmap = new BitmapData(var_553.width,var_553.height,true,16777215);
               _loc2_.bitmap.copyPixels(var_553,var_553.rect,new Point(0,0),null,null,true);
               _loc2_.procedure = buttonProcedure;
               var_1441 = _loc1_.width - _loc2_.width;
            }
         }
      }
      
      private function storeAssets(param1:IAssetLibrary) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return;
         }
         _loc2_ = BitmapDataAsset(param1.getAssetByName("dimmer_slider_base"));
         var_554 = BitmapData(_loc2_.content);
         _loc2_ = BitmapDataAsset(param1.getAssetByName("dimmer_slider_button"));
         var_553 = BitmapData(_loc2_.content);
      }
      
      public function set max(param1:Number) : void
      {
         var_987 = param1;
         setValue(_view.selectedBrightness);
      }
      
      public function dispose() : void
      {
         _view = null;
         _sliderContainer = null;
         var_554 = null;
         var_553 = null;
      }
      
      private function getSliderPosition(param1:int) : int
      {
         return int(var_1441 * (Number(param1 - var_656) / (var_987 - var_656)));
      }
      
      public function set min(param1:Number) : void
      {
         var_656 = param1;
         setValue(_view.selectedBrightness);
      }
      
      public function setValue(param1:int) : void
      {
         if(_sliderContainer == null)
         {
            return;
         }
         var _loc2_:IWindow = _sliderContainer.findChildByName("slider_button");
         if(_loc2_ != null)
         {
            _loc2_.x = getSliderPosition(param1);
         }
      }
      
      private function getValue(param1:Number) : int
      {
         return int(param1 / var_1441 * (var_987 - var_656)) + var_656;
      }
   }
}
