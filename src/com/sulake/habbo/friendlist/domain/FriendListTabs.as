package com.sulake.habbo.friendlist.domain
{
   import com.sulake.habbo.friendlist.FriendRequestsView;
   import com.sulake.habbo.friendlist.FriendsView;
   import com.sulake.habbo.friendlist.SearchView;
   
   public class FriendListTabs
   {
       
      
      private var var_2199:int = 200;
      
      private var var_732:int = 200;
      
      private var var_419:IFriendListTabsDeps;
      
      private var var_396:Array;
      
      private var var_1558:FriendListTab;
      
      private var var_1559:int = 200;
      
      public function FriendListTabs(param1:IFriendListTabsDeps)
      {
         var_396 = new Array();
         super();
         var_419 = param1;
         var_396.push(new FriendListTab(var_419.getFriendList(),FriendListTab.const_89,new FriendsView(),"${friendlist.friends}","friends_footer","hdr_friends"));
         var_396.push(new FriendListTab(var_419.getFriendList(),FriendListTab.const_88,new FriendRequestsView(),"${friendlist.tab.friendrequests}","friend_requests_footer","hdr_friend_requests"));
         var_396.push(new FriendListTab(var_419.getFriendList(),FriendListTab.const_289,new SearchView(),"${generic.search}","search_footer","hdr_search"));
         toggleSelected(null);
      }
      
      public function findSelectedTab() : FriendListTab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_396)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function get tabContentWidth() : int
      {
         return var_1559 - 2;
      }
      
      public function toggleSelected(param1:FriendListTab) : void
      {
         var _loc2_:FriendListTab = findSelectedTab();
         if(_loc2_ == null)
         {
            var_732 = var_2199;
            setSelected(determineDisplayedTab(param1),true);
         }
         else if(_loc2_ == param1 || param1 == null)
         {
            var_2199 = var_732;
            var_732 = 0;
            clearSelections();
         }
         else
         {
            setSelected(determineDisplayedTab(param1),true);
         }
      }
      
      public function clearSelections() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_396)
         {
            _loc1_.setSelected(false);
         }
      }
      
      public function set tabContentHeight(param1:int) : void
      {
         var_732 = param1;
      }
      
      public function findTab(param1:int) : FriendListTab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_396)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function setSelected(param1:FriendListTab, param2:Boolean) : void
      {
         var _loc3_:FriendListTab = findSelectedTab();
         clearSelections();
         param1.setSelected(param2);
         if(param2)
         {
            var_1558 = param1;
         }
      }
      
      private function determineDisplayedTab(param1:FriendListTab) : FriendListTab
      {
         if(param1 != null)
         {
            return param1;
         }
         if(var_1558 != null)
         {
            return var_1558;
         }
         return var_396[0];
      }
      
      public function get tabContentHeight() : int
      {
         return var_732;
      }
      
      public function set windowWidth(param1:int) : void
      {
         var_1559 = param1;
      }
      
      public function getTabs() : Array
      {
         return var_396;
      }
      
      public function get windowWidth() : int
      {
         return var_1559;
      }
   }
}
