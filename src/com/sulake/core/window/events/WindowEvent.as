package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_293:String = "WE_CHILD_RESIZED";
      
      public static const const_1251:String = "WE_CLOSE";
      
      public static const const_1338:String = "WE_DESTROY";
      
      public static const const_145:String = "WE_CHANGE";
      
      public static const const_1198:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1557:String = "WE_PARENT_RESIZE";
      
      public static const const_92:String = "WE_UPDATE";
      
      public static const const_1322:String = "WE_MAXIMIZE";
      
      public static const const_420:String = "WE_DESTROYED";
      
      public static const const_914:String = "WE_UNSELECT";
      
      public static const const_1219:String = "WE_MAXIMIZED";
      
      public static const const_1525:String = "WE_UNLOCKED";
      
      public static const const_379:String = "WE_CHILD_REMOVED";
      
      public static const const_178:String = "WE_OK";
      
      public static const const_45:String = "WE_RESIZED";
      
      public static const const_1382:String = "WE_ACTIVATE";
      
      public static const const_273:String = "WE_ENABLED";
      
      public static const const_458:String = "WE_CHILD_RELOCATED";
      
      public static const const_1218:String = "WE_CREATE";
      
      public static const const_614:String = "WE_SELECT";
      
      public static const const_161:String = "";
      
      public static const const_1613:String = "WE_LOCKED";
      
      public static const const_1566:String = "WE_PARENT_RELOCATE";
      
      public static const const_1452:String = "WE_CHILD_REMOVE";
      
      public static const const_1518:String = "WE_CHILD_RELOCATE";
      
      public static const const_1531:String = "WE_LOCK";
      
      public static const const_229:String = "WE_FOCUSED";
      
      public static const const_637:String = "WE_UNSELECTED";
      
      public static const const_964:String = "WE_DEACTIVATED";
      
      public static const const_1195:String = "WE_MINIMIZED";
      
      public static const const_1503:String = "WE_ARRANGED";
      
      public static const const_1446:String = "WE_UNLOCK";
      
      public static const const_1509:String = "WE_ATTACH";
      
      public static const const_1268:String = "WE_OPEN";
      
      public static const const_1160:String = "WE_RESTORE";
      
      public static const const_1549:String = "WE_PARENT_RELOCATED";
      
      public static const const_1202:String = "WE_RELOCATE";
      
      public static const const_1473:String = "WE_CHILD_RESIZE";
      
      public static const const_1542:String = "WE_ARRANGE";
      
      public static const const_1331:String = "WE_OPENED";
      
      public static const const_1394:String = "WE_CLOSED";
      
      public static const const_1551:String = "WE_DETACHED";
      
      public static const const_1616:String = "WE_UPDATED";
      
      public static const const_1182:String = "WE_UNFOCUSED";
      
      public static const const_369:String = "WE_RELOCATED";
      
      public static const const_1177:String = "WE_DEACTIVATE";
      
      public static const const_228:String = "WE_DISABLED";
      
      public static const const_714:String = "WE_CANCEL";
      
      public static const const_737:String = "WE_ENABLE";
      
      public static const const_1286:String = "WE_ACTIVATED";
      
      public static const const_1280:String = "WE_FOCUS";
      
      public static const const_1453:String = "WE_DETACH";
      
      public static const const_1168:String = "WE_RESTORED";
      
      public static const const_1343:String = "WE_UNFOCUS";
      
      public static const const_52:String = "WE_SELECTED";
      
      public static const const_1232:String = "WE_PARENT_RESIZED";
      
      public static const const_1375:String = "WE_CREATED";
      
      public static const const_1507:String = "WE_ATTACHED";
      
      public static const const_1397:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1594:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1368:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1594 = param3;
         var_1368 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1368;
      }
      
      public function get related() : IWindow
      {
         return var_1594;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1368 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
