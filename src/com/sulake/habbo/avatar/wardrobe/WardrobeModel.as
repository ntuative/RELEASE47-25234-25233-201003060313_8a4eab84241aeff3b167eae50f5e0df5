package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.common.CategoryBaseModel;
   import com.sulake.habbo.avatar.common.CategoryData;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.communication.messages.incoming.avatar.OutfitData;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   
   public class WardrobeModel extends CategoryBaseModel implements IAvatarEditorCategoryModel
   {
      
      public static const const_1450:String = "hot_looks";
      
      public static const const_1505:String = "my_looks";
       
      
      private var _view:WardrobeView;
      
      private var var_612:Dictionary;
      
      private var var_808:Boolean = false;
      
      private var var_914:Boolean = true;
      
      private var var_1015:String;
      
      private var var_160:Array;
      
      public function WardrobeModel(param1:HabboAvatarEditor, param2:String = "")
      {
         super(param1);
         var_1015 = param2;
         var_160 = new Array();
         var_612 = new Dictionary();
         var_612["null"] = new Array();
         var_612["null"] = new Array();
         var_612["undefined.index"] = 0;
         var_612["undefined.index"] = 0;
         initMyLooks();
         requestHotLooks();
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         if(!var_808)
         {
            init();
         }
         return _view.getWindowContainer();
      }
      
      private function requestHotLooks() : void
      {
         var _loc1_:String = var_12.configuration.getKey("avatareditor.promohabbos");
         var _loc2_:URLRequest = new URLRequest(_loc1_);
         var _loc3_:AssetLoaderStruct = var_12.assets.loadAssetFromFile("hotLooksConfiguration",_loc2_,"text/xml");
         _loc3_.addEventListener(AssetLoaderEvent.const_33,onHotLooksConfiguration);
      }
      
      public function toggleItemSelection(param1:String, param2:int) : void
      {
      }
      
      public function toggleColorLayerSelection(param1:String, param2:int) : void
      {
      }
      
      public function selectMyLook(param1:int) : void
      {
         var _loc2_:Outfit = var_160[param1];
         if(_loc2_ != null)
         {
            if(_loc2_.figure == "")
            {
               return;
            }
            var_12.loadAvatarInEditor(_loc2_.figure,_loc2_.gender,var_12.clubMemberLevel);
         }
      }
      
      public function closingEditorView() : void
      {
         reset();
      }
      
      private function init() : void
      {
         _view = new WardrobeView(this,controller.windowManager,controller.assets);
         updateView();
         var_808 = true;
      }
      
      override public function reset() : void
      {
         super.reset();
         if(var_914)
         {
            if(_view != null)
            {
               _view.dispose();
               _view = null;
            }
            var_808 = false;
         }
         var_914 = true;
      }
      
      public function categorySwitch(param1:String) : void
      {
      }
      
      public function toggleColorSelection(param1:String, param2:int) : void
      {
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         super.dispose();
         var_914 = true;
         reset();
         for each(_loc1_ in var_160)
         {
            _loc1_.dispose();
            _loc1_ = null;
         }
         var_160 = null;
      }
      
      public function get controller() : HabboAvatarEditor
      {
         return var_12;
      }
      
      public function getCategoryContent(param1:String) : CategoryData
      {
         return null;
      }
      
      public function get hotLooks() : Array
      {
         return var_612["null"];
      }
      
      private function resetMyLooks() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_160)
         {
            _loc1_.dispose();
         }
         var_160 = [];
      }
      
      public function updateMyLooks(param1:int, param2:Array) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         Logger.log("Got wardrobe in state: " + param1);
         resetMyLooks();
         initMyLooks();
         for each(_loc4_ in param2)
         {
            _loc5_ = var_160[_loc4_.slotId - 1];
            if(_loc5_ != null)
            {
               _loc5_.dispose();
            }
            _loc3_ = new Outfit(var_12,_loc4_.figureString,_loc4_.gender);
            var_160[_loc4_.slotId - 1] = _loc3_;
         }
         if(_view != null)
         {
            _view.updateMyLooks(param1);
         }
      }
      
      public function get myLooks() : Array
      {
         return var_160;
      }
      
      public function updateView() : void
      {
         if(_view != null)
         {
            _view.updateMyLooks(1);
            _view.updateHotLooks();
         }
      }
      
      private function onHotLooksConfiguration(param1:Event = null) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:XmlAsset = var_12.assets.getAssetByName("hotLooksConfiguration") as XmlAsset;
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.content as XML;
            for each(_loc5_ in _loc4_.habbo)
            {
               _loc6_ = new Outfit(var_12,_loc5_.@figure,_loc5_.@gender);
               (var_612[_loc6_.gender] as Array).push(_loc6_);
            }
         }
         else
         {
            Logger.log("Could not retrieve Hot Looks from the server.");
         }
      }
      
      public function storeNewMyLook(param1:int) : void
      {
         var _loc2_:Outfit = var_160[param1];
         if(_loc2_ != null)
         {
            _loc2_.dispose();
         }
         var _loc3_:Outfit = new Outfit(var_12,var_12.figureData.getFigureString(),var_12.gender);
         var_160[param1] = _loc3_;
         if(false)
         {
            var_12.handler.saveWardrobeOutfit(param1 + 1,_loc3_);
         }
         updateView();
      }
      
      private function initMyLooks() : void
      {
         var _loc1_:* = null;
         var_160 = [];
         while(true)
         {
            _loc1_ = new Outfit(var_12,"","");
            var_160.push(_loc1_);
         }
      }
      
      public function selectHotLook(param1:int) : void
      {
         var _loc2_:Array = var_612["null"];
         var _loc3_:Outfit = _loc2_[param1];
         var_914 = false;
         if(_loc3_ != null)
         {
            if(_loc3_.figure == "")
            {
               return;
            }
            var_12.loadAvatarInEditor(_loc3_.figure,_loc3_.gender,var_12.clubMemberLevel);
         }
      }
   }
}
