package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class TextFieldManager
   {
       
      
      private var var_2292:Boolean;
      
      private var var_1448:int;
      
      private var var_2294:String = "";
      
      private var var_71:ITextFieldWindow;
      
      private var var_2293:uint;
      
      private var _orgTextBackgroundColor:uint;
      
      private var _navigator:HabboNavigator;
      
      private var var_1142:String = "";
      
      private var var_154:IWindowContainer;
      
      private var var_302:Boolean;
      
      private var var_1202:Function;
      
      public function TextFieldManager(param1:HabboNavigator, param2:ITextFieldWindow, param3:int = 1000, param4:Function = null, param5:String = null)
      {
         super();
         _navigator = param1;
         var_71 = param2;
         var_1448 = param3;
         var_1202 = param4;
         if(param5 != null)
         {
            var_302 = true;
            var_1142 = param5;
            var_71.text = param5;
         }
         Util.setProcDirectly(var_71,onInputClick);
         var_71.addEventListener(WindowKeyboardEvent.const_156,checkEnterPress);
         var_71.addEventListener(WindowEvent.const_145,checkMaxLen);
         this.var_2292 = var_71.textBackground;
         this._orgTextBackgroundColor = var_71.textBackgroundColor;
         this.var_2293 = var_71.textColor;
      }
      
      private function checkEnterPress(param1:Event) : void
      {
         var _loc2_:IWindow = IWindow(param1.target);
         if(!(param1 is WindowKeyboardEvent))
         {
            return;
         }
         var _loc3_:WindowKeyboardEvent = WindowKeyboardEvent(param1);
         if(_loc3_.charCode == Keyboard.ENTER)
         {
            if(var_1202 != null)
            {
               var_1202();
            }
         }
      }
      
      public function goBackToInitialState() : void
      {
         clearErrors();
         if(var_1142 != null)
         {
            var_71.text = var_1142;
            var_302 = true;
         }
         else
         {
            var_71.text = "";
            var_302 = false;
         }
      }
      
      public function get input() : ITextFieldWindow
      {
         return var_71;
      }
      
      public function restoreBackground() : void
      {
         var_71.textBackground = this.var_2292;
         var_71.textBackgroundColor = this._orgTextBackgroundColor;
         var_71.textColor = this.var_2293;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_229)
         {
            return;
         }
         if(!var_302)
         {
            return;
         }
         var_71.text = var_2294;
         var_302 = false;
         this.restoreBackground();
      }
      
      public function clearErrors() : void
      {
         this.restoreBackground();
         if(this.var_154 != null)
         {
            var_154.visible = false;
         }
      }
      
      public function displayError(param1:String) : void
      {
         var_71.textBackground = true;
         var_71.textBackgroundColor = 4294021019;
         var_71.textColor = 4278190080;
         if(this.var_154 == null)
         {
            this.var_154 = IWindowContainer(_navigator.getXmlWindow("nav_error_popup"));
            _navigator.refreshButton(this.var_154,"popup_arrow_down",true,null,0);
            IWindowContainer(var_71.parent).addChild(this.var_154);
         }
         var _loc2_:ITextWindow = ITextWindow(this.var_154.findChildByName("error_text"));
         _loc2_.text = param1;
         _loc2_.width = _loc2_.textWidth + 5;
         var_154.findChildByName("border").width = _loc2_.width + 15;
         var_154.width = _loc2_.width + 15;
         var _loc3_:Point = new Point();
         var_71.getLocalPosition(_loc3_);
         this.var_154.x = _loc3_.x;
         this.var_154.y = _loc3_.y - this.var_154.height + 3;
         var _loc4_:IWindow = var_154.findChildByName("popup_arrow_down");
         _loc4_.x = this.var_154.width / 2 - _loc4_.width / 2;
         var_154.x += (0 - 0) / 2;
         this.var_154.visible = true;
      }
      
      public function getText() : String
      {
         if(var_302)
         {
            return var_2294;
         }
         return var_71.text;
      }
      
      private function isInputValid() : Boolean
      {
         return !var_302 && Util.trim(getText()).length > 2;
      }
      
      public function setText(param1:String) : void
      {
         var_302 = false;
         var_71.text = param1;
      }
      
      public function checkMandatory(param1:String) : Boolean
      {
         if(!isInputValid())
         {
            displayError(param1);
            return false;
         }
         restoreBackground();
         return true;
      }
      
      private function checkMaxLen(param1:Event) : void
      {
         var _loc2_:String = "null";
         if(_loc2_.length > var_1448)
         {
            var_71.text = _loc2_.substring(0,var_1448);
         }
      }
   }
}
