package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1415:int = 10;
       
      
      private var var_1420:NavigatorSettingsMessageParser;
      
      private var var_1144:int;
      
      private var var_1691:int;
      
      private var var_1692:Boolean;
      
      private var var_958:Array;
      
      private var var_777:Dictionary;
      
      private var var_957:Array;
      
      private var var_2285:int;
      
      private var var_1693:int;
      
      private var var_1689:int;
      
      private var var_1688:int;
      
      private var var_539:PublicRoomShortData;
      
      private var var_379:RoomEventData;
      
      private var var_124:MsgWithRequestId;
      
      private var var_1687:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_1690:Boolean;
      
      private var var_185:GuestRoomData;
      
      private var var_641:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_958 = new Array();
         var_957 = new Array();
         var_777 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_1691;
      }
      
      public function get eventMod() : Boolean
      {
         return var_1690;
      }
      
      public function startLoading() : void
      {
         this.var_641 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_1690 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_379 != null)
         {
            var_379.dispose();
         }
         var_379 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_124 != null && var_124 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_124 != null && var_124 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_124 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_185;
      }
      
      public function get allCategories() : Array
      {
         return var_958;
      }
      
      public function onRoomExit() : void
      {
         if(var_379 != null)
         {
            var_379.dispose();
            var_379 = null;
         }
         if(var_539 != null)
         {
            var_539.dispose();
            var_539 = null;
         }
         if(var_185 != null)
         {
            var_185.dispose();
            var_185 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_124 = param1;
         var_641 = false;
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1420;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_124 = param1;
         var_641 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_539 = null;
         var_185 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_539 = param1.publicSpace;
            var_379 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2285 = param1.limit;
         this.var_1144 = param1.favouriteRoomIds.length;
         this.var_777 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_777[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_124 as PopularRoomTagsData;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_539;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_1692;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_124 = param1;
         var_641 = false;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1689 = param1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_185 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_641;
      }
      
      public function get visibleCategories() : Array
      {
         return var_957;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         var_958 = param1;
         var_957 = new Array();
         for each(_loc2_ in var_958)
         {
            if(_loc2_.visible)
            {
               var_957.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return var_1693;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_1688;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1420 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_124 == null)
         {
            return;
         }
         var_124.dispose();
         var_124 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_379;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_777[param1] = !!param2 ? "yes" : null;
         var_1144 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_124 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_1689;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_124 != null && var_124 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_1692 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_1693 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_1687 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_185 != null)
         {
            var_185.dispose();
         }
         var_185 = param1;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_185 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1420.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1144 >= var_2285;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_1688 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_1687;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_185 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_1691 = param1;
      }
   }
}
