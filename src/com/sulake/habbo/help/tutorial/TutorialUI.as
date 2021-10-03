package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.CheckUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.avatar.ChangeUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.avatar.CheckUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.avatar.CheckUserNameResultMessageParser;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.help.INameChangeUI;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class TutorialUI implements INameChangeUI
   {
      
      public static const const_242:String = "TUI_NAME_VIEW";
      
      public static const const_86:String = "TUI_MAIN_VIEW";
      
      public static const const_320:String = "TUI_CLOTHES_VIEW";
      
      public static const const_386:String = "TUI_GUIDEBOT_VIEW";
       
      
      private var var_1088:Boolean = false;
      
      private var var_1086:Boolean = false;
      
      private var _window:IWindowContainer;
      
      private var var_1422:int = 0;
      
      private var _main:HabboHelp;
      
      private var var_1087:Boolean = false;
      
      private var var_1338:Boolean = false;
      
      private var var_1421:int = 0;
      
      private var var_32:ITutorialUIView;
      
      public function TutorialUI(param1:HabboHelp)
      {
         super();
         _main = param1;
         _main.events.addEventListener(HabboHelpTutorialEvent.const_568,onTaskDoneEvent);
         _main.events.addEventListener(HabboHelpTutorialEvent.const_712,onTaskDoneEvent);
         _main.events.addEventListener(HabboHelpTutorialEvent.const_727,onTaskDoneEvent);
      }
      
      public function prepareForTutorial() : void
      {
         if(_main == null || true)
         {
            return;
         }
         _main.hideUI();
         _main.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_101));
      }
      
      public function get help() : HabboHelp
      {
         return _main;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1088;
      }
      
      public function update(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         var_1087 = param1;
         var_1086 = param2;
         var_1088 = param3;
         if(var_32 == null || var_32.id == const_86)
         {
            prepareForTutorial();
            showView(const_86);
         }
      }
      
      public function setRoomSessionStatus(param1:Boolean) : void
      {
         if(param1 == false)
         {
            disposeView();
         }
      }
      
      public function onUserNameChanged(param1:String) : void
      {
         var name:String = param1;
         var_1086 = true;
         if(var_32 != null && (var_32.id == const_242 || var_32.id == const_86))
         {
            showView(const_86);
         }
         _main.localization.registerParameter("help.tutorial.name.changed","name",name);
         _main.windowManager.alert("${generic.notice}","${help.tutorial.name.changed}",0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
      
      public function showView(param1:String) : void
      {
         var _loc2_:* = null;
         if(hasTasksDone)
         {
            dispose();
            return;
         }
         var _loc3_:Boolean = false;
         if(_window == null)
         {
            _window = buildXmlWindow("tutorial_frame") as IWindowContainer;
            if(_window == null)
            {
               return;
            }
            _window.procedure = windowProcedure;
            _loc2_ = _window.findChildByName("content_list") as IItemListWindow;
            if(_loc2_ == null)
            {
               return;
            }
            var_1421 = 0 - _loc2_.width;
            var_1422 = _window.height;
            _loc3_ = true;
         }
         _loc2_ = _window.findChildByName("content_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.destroyListItems();
         _loc2_.height = 0;
         if(var_32 != null)
         {
            var_32.dispose();
         }
         switch(param1)
         {
            case const_86:
               var_32 = new TutorialMainView(_loc2_,this);
               break;
            case const_242:
               var_32 = new TutorialNameChangeView(this);
               _loc2_.addListItem(var_32.view);
               prepareForTutorial();
               break;
            case const_320:
               var_32 = new TutorialClothesChangeView(_loc2_,this);
               break;
            case const_386:
               var_32 = new TutorialCallGuideBotView(_loc2_,this);
         }
         _window.height = _loc2_.height + var_1422;
         _window.width = _loc2_.width + var_1421;
         if(_loc3_)
         {
            if(_window == null)
            {
               return;
            }
            _window.x = _window.context.getDesktopWindow().width / 2 - 0;
            _window.y = 0;
         }
      }
      
      public function get assets() : IAssetLibrary
      {
         return _main.assets;
      }
      
      public function onChangeUserNameResult(param1:ChangeUserNameResultMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:ChangeUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode != ChangeUserNameResultMessageEvent.var_617)
         {
            showView(const_242);
            (var_32 as TutorialNameChangeView).setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return _main.localization;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1087;
      }
      
      public function dispose() : void
      {
         disposeView();
         _main = null;
      }
      
      public function changeName(param1:String) : void
      {
         disposeWindow();
         _main.sendMessage(new ChangeUserNameMessageComposer(param1));
      }
      
      public function onTaskDoneEvent(param1:HabboHelpTutorialEvent) : void
      {
         switch(param1.type)
         {
            case HabboHelpTutorialEvent.const_568:
               var_1088 = true;
               if(var_32 != null && var_32.id == const_386)
               {
                  showView(const_86);
               }
               break;
            case HabboHelpTutorialEvent.const_712:
               if(var_32 != null && var_32.id == const_320)
               {
                  var_1338 = true;
                  disposeWindow();
               }
               break;
            case HabboHelpTutorialEvent.const_727:
               if(var_1338)
               {
                  var_1338 = false;
                  showView(const_86);
               }
         }
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1086;
      }
      
      public function get myName() : String
      {
         return _main.ownUserName;
      }
      
      public function onCheckUserNameResult(param1:CheckUserNameResultMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:CheckUserNameResultMessageParser = param1.getParser();
         showView(const_242);
         var _loc3_:TutorialNameChangeView = var_32 as TutorialNameChangeView;
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_617)
         {
            _loc3_.checkedName = _loc2_.name;
         }
         else
         {
            _loc3_.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      private function disposeView() : void
      {
         if(var_32 != null)
         {
            var_32.dispose();
            var_32 = null;
         }
         disposeWindow();
      }
      
      public function onUserChanged() : void
      {
         var_1087 = true;
         if(var_32 != null && (var_32.id == const_320 || var_32.id == const_86))
         {
            showView(const_86);
         }
      }
      
      private function disposeWindow(param1:WindowEvent = null) : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function buildXmlWindow(param1:String, param2:uint = 1) : IWindow
      {
         if(_main == null || true)
         {
            return null;
         }
         var _loc3_:XmlAsset = XmlAsset(_main.assets.getAssetByName(param1 + "_xml"));
         if(_loc3_ == null || true)
         {
            return null;
         }
         var _loc4_:ICoreWindowManager = ICoreWindowManager(_main.windowManager);
         return _loc4_.buildFromXML(XML(_loc3_.content),param2);
      }
      
      public function checkName(param1:String) : void
      {
         disposeWindow();
         _main.sendMessage(new CheckUserNameMessageComposer(param1));
      }
      
      public function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(param2.name == "header_button_close")
               {
                  disposeView();
               }
         }
      }
      
      public function get hasTasksDone() : Boolean
      {
         return var_1087 && var_1086 && var_1088;
      }
   }
}
