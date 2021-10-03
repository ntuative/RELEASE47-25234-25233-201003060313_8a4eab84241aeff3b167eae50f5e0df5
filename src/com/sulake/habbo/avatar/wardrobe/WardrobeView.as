package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryView;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.Event;
   
   public class WardrobeView implements IAvatarEditorCategoryView
   {
       
      
      private var var_1551:IWindowContainer;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _window:IWindowContainer;
      
      private var var_729:IItemListWindow;
      
      private var var_601:IItemListWindow;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_895:IItemListWindow;
      
      private var _model:WardrobeModel;
      
      private var var_896:int = 0;
      
      private var var_600:Array;
      
      public function WardrobeView(param1:WardrobeModel, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         var_600 = [];
         super();
         _model = param1;
         _assetLibrary = param3;
         _windowManager = param2;
         var _loc4_:XmlAsset = _assetLibrary.getAssetByName("avatareditor_wardrobe_base") as XmlAsset;
         _window = IWindowContainer(_windowManager.buildFromXML(_loc4_.content as XML));
         var_729 = _window.findChildByName("mylooks") as IItemListWindow;
         var_601 = _window.findChildByName("hotlooks") as IItemListWindow;
         var_895 = _window.findChildByName("selector") as IItemListWindow;
         var_1551 = _window.findChildByName("habboClubNotificationContainer") as IWindowContainer;
         _window.findChildByName("hotlooksMore").alphaTreshold = 0;
         _window.findChildByName("habboClubLink").alphaTreshold = 0;
         _window.visible = false;
         _window.procedure = windowEventProc;
         initSelector();
      }
      
      private function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "hotlooksMore":
                  Logger.log("More hot looks");
                  ++var_896;
                  updateHotLooks();
                  break;
               case "habboClubLink":
                  Logger.log("Open Catalog Habbo Club");
                  _model.controller.catalog.openCatalogPage(CatalogPageName.const_272,true);
            }
         }
         else if(param1.type == WindowEvent.const_52)
         {
         }
      }
      
      private function myLooksEventProc(param1:Event, param2:IWindow = null) : void
      {
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            _model.selectMyLook(var_729.getListItemIndex(param2.parent));
         }
      }
      
      private function initSelector() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_600)
         {
            var_895.removeListItem(_loc1_.window);
            _loc1_.dispose();
         }
         var_600 = [];
         while(true)
         {
            _loc1_ = new Selector(_model.controller);
            var_895.addListItem(_loc1_.window);
            _loc1_.window.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,myLooksSelectorEventProc);
            var_600.push(_loc1_);
         }
      }
      
      public function updateHotLooks() : void
      {
         var _loc3_:* = null;
         while(false)
         {
            var_601.removeListItemAt(0);
         }
         var _loc1_:int = 0;
         if(_model.hotLooks.length < 8)
         {
            _loc1_ = 0;
         }
         else
         {
            _loc1_ = var_896 * 8;
         }
         if(_loc1_ > _model.hotLooks.length)
         {
            var_896 = 0;
            _loc1_ = 0;
         }
         var _loc2_:int = 0;
         for each(_loc3_ in _model.hotLooks)
         {
            if(_loc2_ >= _loc1_ && true)
            {
               var_601.addListItem(_loc3_.view.window);
               _loc3_.view.window.procedure = hotLooksEventProc;
            }
            _loc2_++;
         }
      }
      
      public function updateMyLooks(param1:int) : void
      {
         var _loc2_:* = null;
         if(!_model.controller.clubMemberLevel > 0)
         {
            var_1551.visible = true;
            _window.findChildByName("myLooksContainer").visible = false;
            _window.findChildByName("myLooksChooser").visible = false;
         }
         else
         {
            var_1551.visible = false;
            _window.findChildByName("myLooksContainer").visible = true;
            _window.findChildByName("myLooksChooser").visible = true;
            while(false)
            {
               var_729.removeListItemAt(0);
            }
            for each(_loc2_ in _model.myLooks)
            {
               var_729.addListItem(_loc2_.view.window);
               _loc2_.view.window.procedure = myLooksEventProc;
            }
         }
      }
      
      private function myLooksSelectorEventProc(param1:Event, param2:IWindow = null) : void
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            _loc3_ = var_895.getListItemIndex(param2);
            _model.storeNewMyLook(_loc3_);
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_600)
         {
            var_895.removeListItem(_loc1_.window);
            _loc1_.dispose();
         }
         var_600 = [];
         while(false)
         {
            var_729.removeListItemAt(0);
         }
         while(false)
         {
            var_601.removeListItemAt(0);
         }
         _window.dispose();
         _window = null;
      }
      
      private function hotLooksEventProc(param1:Event, param2:IWindow = null) : void
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            _loc3_ = var_896 * 8 + var_601.getListItemIndex(param2.parent);
            _model.selectHotLook(_loc3_);
         }
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return _window;
      }
   }
}
