package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_618:int = 6;
      
      public static const const_196:int = 5;
      
      public static const const_708:int = 2;
      
      public static const const_303:int = 9;
      
      public static const const_298:int = 4;
      
      public static const const_265:int = 2;
      
      public static const const_673:int = 4;
      
      public static const const_211:int = 8;
      
      public static const const_578:int = 7;
      
      public static const const_256:int = 3;
      
      public static const const_339:int = 1;
      
      public static const const_223:int = 5;
      
      public static const const_447:int = 12;
      
      public static const const_296:int = 1;
      
      public static const const_505:int = 11;
      
      public static const const_502:int = 3;
      
      public static const const_1546:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_396:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_396 = new Array();
         var_396.push(new Tab(_navigator,const_339,const_447,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_477));
         var_396.push(new Tab(_navigator,const_265,const_296,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_477));
         var_396.push(new Tab(_navigator,const_298,const_505,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_827));
         var_396.push(new Tab(_navigator,const_256,const_196,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_477));
         var_396.push(new Tab(_navigator,const_223,const_211,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_526));
         setSelectedTab(const_339);
      }
      
      public function getSelected() : Tab
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
      
      public function getTab(param1:int) : Tab
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
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_396)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_298;
      }
      
      public function get tabs() : Array
      {
         return var_396;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
