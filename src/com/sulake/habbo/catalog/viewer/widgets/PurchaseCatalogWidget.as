package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2025:XML;
      
      private var var_1512:ITextWindow;
      
      private var var_1514:ITextWindow;
      
      private var var_2026:XML;
      
      private var var_851:IWindowContainer;
      
      private var var_2309:ITextWindow;
      
      private var var_2024:String = "";
      
      private var var_2372:IButtonWindow;
      
      private var var_2027:XML;
      
      private var var_1513:ITextWindow;
      
      private var var_2023:XML;
      
      private var var_850:IButtonWindow;
      
      private var var_80:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_479:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2026) as IWindowContainer;
               break;
            case Offer.const_421:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2023) as IWindowContainer;
               break;
            case Offer.const_443:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2025) as IWindowContainer;
               break;
            case Offer.const_700:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2027) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_851 != null)
            {
               _window.removeChild(var_851);
               var_851.dispose();
            }
            var_851 = _loc2_;
            _window.addChild(_loc2_);
            var_851.x = 0;
            var_851.y = 0;
         }
         var_1513 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1514 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1512 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2309 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_850 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_850 != null)
         {
            var_850.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_850.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_80 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_80,page,var_2024);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_2026 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_2023 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_2025 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_2027 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_890,onSetParameter);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_2024 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_80 = param1.offer;
         attachStub(var_80.priceType);
         if(var_1513 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_80.priceInCredits));
            var_1513.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1514 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_80.priceInPixels));
            var_1514.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1512 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_80.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_80.priceInPixels));
            var_1512.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_850 != null)
         {
            var_850.enable();
         }
      }
   }
}
