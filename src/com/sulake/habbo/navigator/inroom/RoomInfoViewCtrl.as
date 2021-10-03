package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_735:IWindowContainer;
      
      private var var_1082:ITextWindow;
      
      private var var_202:RoomSettingsCtrl;
      
      private var var_1329:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var _hideInfoTimer:Timer;
      
      private var var_1325:ITextWindow;
      
      private var var_364:IWindowContainer;
      
      private var var_2206:IWindowContainer;
      
      private var var_2208:ITextWindow;
      
      private var var_904:IWindowContainer;
      
      private var var_1567:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_676:ITextWindow;
      
      private var var_1568:IWindowContainer;
      
      private var var_1326:IWindowContainer;
      
      private var var_902:ITextWindow;
      
      private var var_1083:ITextFieldWindow;
      
      private var var_315:IWindowContainer;
      
      private var var_901:ITextWindow;
      
      private var var_1564:IButtonWindow;
      
      private var var_1084:ITextWindow;
      
      private var var_2323:int;
      
      private var var_1331:IContainerButtonWindow;
      
      private var var_903:IWindowContainer;
      
      private var var_1328:ITextWindow;
      
      private var var_1330:IContainerButtonWindow;
      
      private var var_1565:ITextWindow;
      
      private var var_1566:IButtonWindow;
      
      private var var_911:TagRenderer;
      
      private var var_2031:ITextWindow;
      
      private var var_365:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_734:ITextWindow;
      
      private var var_276:RoomThumbnailCtrl;
      
      private var var_1327:IContainerButtonWindow;
      
      private var var_2207:IWindowContainer;
      
      private var var_275:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_365 = new RoomEventViewCtrl(_navigator);
         var_202 = new RoomSettingsCtrl(_navigator,this,true);
         var_276 = new RoomThumbnailCtrl(_navigator);
         var_911 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_202);
         _hideInfoTimer = new Timer(6000,1);
         _hideInfoTimer.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_202.active = true;
         this.var_365.active = false;
         this.var_276.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1567.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1566.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1568.visible = Util.hasVisibleChildren(var_1568);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_676.text = param1.roomName;
         var_676.height = NaN;
         _ownerName.text = param1.ownerName;
         var_902.text = param1.description;
         var_911.refreshTags(var_364,param1.tags);
         var_902.visible = false;
         if(param1.description != "")
         {
            var_902.height = NaN;
            var_902.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_364,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_364,"thumb_down",_loc3_,onThumbDown,0);
         var_2208.visible = _loc3_;
         var_901.visible = !_loc3_;
         var_1565.visible = !_loc3_;
         var_1565.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_364,"home",param2,null,0);
         _navigator.refreshButton(var_364,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_364,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_676.y,0);
         var_364.visible = true;
         var_364.height = Util.getLowestPoint(var_364);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function dispose() : void
      {
         if(_hideInfoTimer)
         {
            _hideInfoTimer.removeEventListener(TimerEvent.TIMER,hideInfo);
            _hideInfoTimer.reset();
            _hideInfoTimer = null;
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_398,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1564.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1329.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1327.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1331.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1330.visible = _navigator.data.canEditRoomSettings && param1;
         var_1326.visible = Util.hasVisibleChildren(var_1326);
      }
      
      public function open(param1:Boolean) : void
      {
         this._hideInfoTimer.reset();
         this.var_365.active = false;
         this.var_202.active = false;
         this.var_276.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_46,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this._hideInfoTimer.start();
         }
      }
      
      public function toggle() : void
      {
         this._hideInfoTimer.reset();
         this.var_365.active = false;
         this.var_202.active = false;
         this.var_276.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_46,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_398,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_315);
         var_315.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_202.refresh(var_315);
         this.var_276.refresh(var_315);
         Util.moveChildrenToColumn(var_315,["room_details","room_buttons"],0,2);
         var_315.height = Util.getLowestPoint(var_315);
         var_315.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_1083.setSelection(0,var_1083.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_275);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_365.refresh(var_275);
         if(Util.hasVisibleChildren(var_275) && !this.var_276.active)
         {
            Util.moveChildrenToColumn(var_275,["event_details","event_buttons"],0,2);
            var_275.height = Util.getLowestPoint(var_275);
            var_275.visible = true;
         }
         else
         {
            var_275.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_365.active = true;
         this.var_202.active = false;
         this.var_276.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         _hideInfoTimer.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_1082.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_1082.height = NaN;
         var_1325.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1325.height = NaN;
         Util.moveChildrenToColumn(var_735,["public_space_name","public_space_desc"],var_1082.y,0);
         var_735.visible = true;
         var_735.height = Math.max(86,Util.getLowestPoint(var_735));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","HabboNavigatorCom_hh_room_erics_png") == "true";
         if(_loc1_ && true && true && true)
         {
            var_903.visible = true;
            var_1083.text = this.getEmbedData();
         }
         else
         {
            var_903.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this._hideInfoTimer.reset();
         this.var_202.load(param1);
         this.var_202.active = true;
         this.var_365.active = false;
         this.var_276.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_202.active = false;
         this.var_365.active = false;
         this.var_276.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_67,false);
         _window.setParamFlag(HabboWindowParam.const_1324,true);
         _window.visible = false;
         var_315 = IWindowContainer(find("room_info"));
         var_364 = IWindowContainer(find("room_details"));
         var_735 = IWindowContainer(find("public_space_details"));
         var_2207 = IWindowContainer(find("owner_name_cont"));
         var_2206 = IWindowContainer(find("rating_cont"));
         var_1326 = IWindowContainer(find("room_buttons"));
         var_676 = ITextWindow(find("room_name"));
         var_1082 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_902 = ITextWindow(find("room_desc"));
         var_1325 = ITextWindow(find("public_space_desc"));
         var_1084 = ITextWindow(find("owner_caption"));
         var_901 = ITextWindow(find("rating_caption"));
         var_2208 = ITextWindow(find("rate_caption"));
         var_1565 = ITextWindow(find("rating_txt"));
         var_275 = IWindowContainer(find("event_info"));
         var_904 = IWindowContainer(find("event_details"));
         var_1568 = IWindowContainer(find("event_buttons"));
         var_2031 = ITextWindow(find("event_name"));
         var_734 = ITextWindow(find("event_desc"));
         var_1329 = IContainerButtonWindow(find("add_favourite_button"));
         var_1327 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1331 = IContainerButtonWindow(find("make_home_button"));
         var_1330 = IContainerButtonWindow(find("unmake_home_button"));
         var_1564 = IButtonWindow(find("room_settings_button"));
         var_1567 = IButtonWindow(find("create_event_button"));
         var_1566 = IButtonWindow(find("edit_event_button"));
         var_903 = IWindowContainer(find("embed_info"));
         var_1328 = ITextWindow(find("embed_info_txt"));
         var_1083 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1329,onAddFavouriteClick);
         Util.setProcDirectly(var_1327,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1564,onRoomSettingsClick);
         Util.setProcDirectly(var_1331,onMakeHomeClick);
         Util.setProcDirectly(var_1330,onUnmakeHomeClick);
         Util.setProcDirectly(var_1567,onEventSettingsClick);
         Util.setProcDirectly(var_1566,onEventSettingsClick);
         Util.setProcDirectly(var_1083,onEmbedSrcClick);
         _navigator.refreshButton(var_1329,"favourite",true,null,0);
         _navigator.refreshButton(var_1327,"favourite",true,null,0);
         _navigator.refreshButton(var_1331,"home",true,null,0);
         _navigator.refreshButton(var_1330,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_315,onHover);
         Util.setProcDirectly(var_275,onHover);
         var_1084.width = var_1084.textWidth;
         Util.moveChildrenToRow(var_2207,["owner_caption","owner_name"],var_1084.x,var_1084.y,3);
         var_901.width = var_901.textWidth;
         Util.moveChildrenToRow(var_2206,["rating_caption","rating_txt"],var_901.x,var_901.y,3);
         var_1328.height = NaN;
         Util.moveChildrenToColumn(var_903,["embed_info_txt","embed_src_txt"],var_1328.y,2);
         var_903.height = Util.getLowestPoint(var_903) + 5;
         var_2323 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_2031.text = param1.eventName;
         var_734.text = param1.eventDescription;
         var_911.refreshTags(var_904,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_734.visible = false;
         if(param1.eventDescription != "")
         {
            var_734.height = NaN;
            var_734.y = Util.getLowestPoint(var_904) + 2;
            var_734.visible = true;
         }
         var_904.visible = true;
         var_904.height = Util.getLowestPoint(var_904);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_996,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
