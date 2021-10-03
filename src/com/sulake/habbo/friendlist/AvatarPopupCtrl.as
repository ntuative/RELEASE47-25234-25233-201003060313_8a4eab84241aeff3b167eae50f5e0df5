package com.sulake.habbo.friendlist
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   
   public class AvatarPopupCtrl extends PopupCtrl
   {
       
      
      private var var_1294:String;
      
      private var var_1505:String;
      
      private var var_1296:String;
      
      private var var_1992:String;
      
      private var var_694:Boolean;
      
      private var var_1993:String;
      
      public function AvatarPopupCtrl(param1:HabboFriendList)
      {
         super(param1,5,-5,"avatar_popup");
      }
      
      public function setData(param1:Boolean, param2:String, param3:String, param4:String, param5:String, param6:String = "") : void
      {
         var_694 = param1;
         var_1505 = param2;
         var_1992 = param3;
         var_1993 = param4;
         var_1294 = param5;
         var_1296 = param6;
      }
      
      override public function refreshContent(param1:IWindowContainer) : void
      {
         Util.hideChildren(param1);
         if(var_1296 != "")
         {
            friendList.refreshText(param1,"name_text_online",var_694,var_1296);
         }
         else
         {
            friendList.refreshText(param1,"name_text_online",var_694,var_1505);
         }
         friendList.refreshText(param1,"name_text_offline",!var_694,var_1505);
         friendList.refreshText(param1,"motto_text",var_694,var_1992);
         friendList.refreshButton(param1,"offline",!var_694,null,0);
         if(var_694)
         {
            refreshFigure(param1,var_1993);
            param1.findChildByName("online_text").visible = true;
         }
         else
         {
            param1.findChildByName("last_access_text").visible = true;
            friendList.registerParameter("friendlist.avatarpopup.lastaccess","last_access",var_1294 == null ? "" : var_1294);
         }
         param1.height = Util.getLowestPoint(param1) + 10;
      }
      
      private function refreshFigure(param1:IWindowContainer, param2:String) : void
      {
         var _loc3_:IBitmapWrapperWindow = param1.getChildByName(HabboFriendList.const_164) as IBitmapWrapperWindow;
         if(param2 == null || param2 == "")
         {
            _loc3_.visible = false;
         }
         else
         {
            _loc3_.bitmap = friendList.getAvatarFaceBitmap(param2);
            _loc3_.width = _loc3_.bitmap.width;
            _loc3_.height = _loc3_.bitmap.height;
            _loc3_.visible = true;
         }
      }
   }
}
