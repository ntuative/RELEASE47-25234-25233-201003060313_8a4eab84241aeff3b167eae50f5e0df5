package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_1985:UserRegistry;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_136:TutorialUI;
      
      private var var_693:IHabboLocalizationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_60:HelpUI;
      
      private var var_692:IHabboConfigurationManager;
      
      private var var_200:IHabboToolbar;
      
      private var var_580:HotelMergeUI;
      
      private var var_312:IHabboCommunicationManager;
      
      private var var_847:FaqIndex;
      
      private var var_1986:String = "";
      
      private var var_978:IncomingMessages;
      
      private var var_1253:CallForHelpData;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1253 = new CallForHelpData();
         var_1985 = new UserRegistry();
         super(param1,param2,param3);
         _assetLibrary = param3;
         var_847 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return var_200;
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(var_60 != null)
         {
            var_60.tellUI(param1,param2);
         }
      }
      
      private function toggleHelpUI() : void
      {
         if(var_60 == null)
         {
            if(!createHelpUI())
            {
               return;
            }
         }
         var_60.toggleUI();
      }
      
      private function removeTutorialUI() : void
      {
         if(var_136 != null)
         {
            var_136.dispose();
            var_136 = null;
         }
      }
      
      public function get ownUserName() : String
      {
         return var_1986;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      override public function dispose() : void
      {
         if(var_60 != null)
         {
            var_60.dispose();
            var_60 = null;
         }
         if(var_136 != null)
         {
            var_136.dispose();
            var_136 = null;
         }
         if(var_580)
         {
            var_580.dispose();
            var_580 = null;
         }
         if(var_847 != null)
         {
            var_847.dispose();
            var_847 = null;
         }
         var_978 = null;
         if(var_200)
         {
            var_200.release(new IIDHabboToolbar());
            var_200 = null;
         }
         if(var_693)
         {
            var_693.release(new IIDHabboLocalizationManager());
            var_693 = null;
         }
         if(var_312)
         {
            var_312.release(new IIDHabboCommunicationManager());
            var_312 = null;
         }
         if(var_692)
         {
            var_692.release(new IIDHabboConfigurationManager());
            var_692 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         super.dispose();
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_693;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_94:
               if(var_60 != null)
               {
                  var_60.setRoomSessionStatus(true);
               }
               if(var_136 != null)
               {
                  var_136.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_102:
               if(var_60 != null)
               {
                  var_60.setRoomSessionStatus(false);
               }
               if(var_136 != null)
               {
                  var_136.setRoomSessionStatus(false);
               }
               userRegistry.unregisterRoom();
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(var_60 != null)
         {
            var_60.updateCallForGuideBotUI(true);
         }
      }
      
      public function get userRegistry() : UserRegistry
      {
         return var_1985;
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(var_60 != null)
         {
            var_60.showCallForHelpResult(param1);
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!var_580)
         {
            var_580 = new HotelMergeUI(this);
         }
         var_580.startNameChange();
      }
      
      private function createTutorialUI() : Boolean
      {
         if(var_136 == null && _assetLibrary != null && _windowManager != null)
         {
            var_136 = new TutorialUI(this);
         }
         return var_136 != null;
      }
      
      private function createHelpUI() : Boolean
      {
         if(var_60 == null && _assetLibrary != null && _windowManager != null)
         {
            var_60 = new HelpUI(this,_assetLibrary,_windowManager,var_693,var_200);
         }
         return var_60 != null;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return var_1253;
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         var_1253.reportedUserId = param1;
         var_1253.reportedUserName = param2;
         var_60.showUI(HabboHelpViewEnum.const_299);
      }
      
      public function set ownUserName(param1:String) : void
      {
         var_1986 = param1;
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(var_200 != null)
         {
            var_200.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_128,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_693 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            removeTutorialUI();
            return;
         }
         if(var_136 == null)
         {
            if(!createTutorialUI())
            {
               return;
            }
         }
         var_136.update(param1,param2,param3);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_312 = IHabboCommunicationManager(param2);
         var_978 = new IncomingMessages(this,var_312);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      public function showUI(param1:String = null) : void
      {
         if(var_60 != null)
         {
            var_60.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(var_60 != null)
         {
            var_60.hideUI();
         }
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(var_312 != null && param1 != null)
         {
            var_312.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return var_847;
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(var_60 != null)
         {
            var_60.updateCallForGuideBotUI(false);
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_200 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_692 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return var_136;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_87)
         {
            setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_59)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               toggleHelpUI();
               return;
            }
         }
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return var_580;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_94,onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_102,onRoomSessionEvent);
         var_200.events.addEventListener(HabboToolbarEvent.const_87,onHabboToolbarEvent);
         var_200.events.addEventListener(HabboToolbarEvent.const_59,onHabboToolbarEvent);
         createHelpUI();
         setHabboToolbarIcon();
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(var_60 != null)
         {
            var_60.showCallForHelpReply(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(var_692 == null)
         {
            return param1;
         }
         return var_692.getKey(param1,param2,param3);
      }
   }
}
