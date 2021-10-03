package com.sulake.habbo.messenger
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.SendMsgMessageComposer;
   import com.sulake.habbo.messenger.domain.Conversation;
   import com.sulake.habbo.messenger.domain.Message;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   
   public class MessengerView implements IDisposable
   {
       
      
      private var var_894:ConversationsTabView;
      
      private var _disposed:Boolean = false;
      
      private var var_144:HabboMessenger;
      
      private var var_1309:ConversationView;
      
      private var var_14:IFrameWindow;
      
      private var var_391:Timer;
      
      private var var_699:ITextFieldWindow;
      
      public function MessengerView(param1:HabboMessenger)
      {
         super();
         var_144 = param1;
         var_391 = new Timer(300,1);
         var_391.addEventListener(TimerEvent.TIMER,onResizeTimer);
      }
      
      public function addMsgToView(param1:Conversation, param2:Message) : void
      {
         if(var_14 == null)
         {
            return;
         }
         if(!param1.selected)
         {
            return;
         }
         var_1309.addMessage(param2);
      }
      
      private function onMessageInput(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:IWindow = IWindow(param1.target);
         if(!(param1 is WindowKeyboardEvent))
         {
            return;
         }
         var _loc3_:WindowKeyboardEvent = param1 as WindowKeyboardEvent;
         if(_loc3_.charCode == Keyboard.ENTER)
         {
            sendMsg();
         }
         else
         {
            _loc4_ = 120;
            _loc5_ = "null";
            if(_loc5_.length > _loc4_)
            {
               var_699.text = _loc5_.substring(0,_loc4_);
            }
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         var_14.visible = false;
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         Logger.log("XXX RESIZE XXX");
         this.var_1309.afterResize();
         this.var_894.refresh();
      }
      
      private function sendMsg() : void
      {
         var _loc1_:String = "null";
         Logger.log("Send msg: " + _loc1_);
         if(_loc1_ == "")
         {
            Logger.log("No text...");
            return;
         }
         var _loc2_:Conversation = var_144.conversations.findSelectedConversation();
         if(_loc2_ == null)
         {
            Logger.log("No conversation...");
            return;
         }
         var_144.send(new SendMsgMessageComposer(_loc2_.id,_loc1_));
         var_699.text = "";
         var_144.conversations.addMessageAndUpdateView(new Message(Message.const_649,_loc2_.id,_loc1_,Util.getFormattedNow()));
      }
      
      public function refresh(param1:Boolean) : void
      {
         if(var_14 == null)
         {
            return;
         }
         var _loc2_:Conversation = var_144.conversations.findSelectedConversation();
         var_14.caption = _loc2_ == null ? "" : _loc2_.name;
         var_894.refresh();
         var_1309.refresh();
         if(var_144.conversations.openConversations.length < 1)
         {
            var_14.visible = false;
            var_144.setHabboToolbarIcon(false,false);
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_391)
            {
               var_391.stop();
               var_391.removeEventListener(TimerEvent.TIMER,onResizeTimer);
               var_391 = null;
            }
            var_144 = null;
            _disposed = true;
         }
      }
      
      public function openMessenger() : void
      {
         if(var_144.conversations.openConversations.length < 1)
         {
            return;
         }
         if(var_14 == null)
         {
            prepareContent();
            refresh(true);
            var_144.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_46,HabboToolbarIconEnum.MESSENGER,var_14));
         }
         else
         {
            refresh(true);
            var_14.visible = true;
            var_14.activate();
         }
      }
      
      public function getTabCount() : int
      {
         return this.var_894 == null ? 7 : int(this.var_894.getTabCount());
      }
      
      public function isMessengerOpen() : Boolean
      {
         return var_14 != null && false;
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_45 || param2 != var_14)
         {
            return;
         }
         if(!this.var_391.running)
         {
            this.var_391.reset();
            this.var_391.start();
         }
      }
      
      public function close() : void
      {
         if(var_14 != null)
         {
            var_14.visible = false;
         }
      }
      
      private function prepareContent() : void
      {
         var_14 = IFrameWindow(var_144.getXmlWindow("main_window"));
         var _loc1_:IWindow = var_14.findChildByTag("close");
         _loc1_.procedure = onWindowClose;
         var_14.procedure = onWindow;
         var_14.title.color = 4294623744;
         var_14.title.textColor = 4287851525;
         var_894 = new ConversationsTabView(var_144,var_14);
         var_894.refresh();
         var_699 = ITextFieldWindow(var_14.findChildByName("message_input"));
         var_699.addEventListener(WindowKeyboardEvent.const_156,onMessageInput);
         var_1309 = new ConversationView(var_144,var_14);
         var_14.scaler.setParamFlag(HabboWindowParam.const_661,false);
         var_14.scaler.setParamFlag(HabboWindowParam.const_1006,true);
      }
   }
}
