package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   
   public class TraxPreviewCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_1236:IButtonWindow;
      
      public function TraxPreviewCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
         var_1236 = _window.findChildByName("listen") as IButtonWindow;
         Logger.log("Trax listener found button: " + var_1236);
         if(var_1236 != null)
         {
            var_1236.disable();
         }
      }
      
      override public function init() : void
      {
         super.init();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
