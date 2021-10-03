package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1250:String = "WN_CREATED";
      
      public static const const_974:String = "WN_DISABLE";
      
      public static const const_992:String = "WN_DEACTIVATED";
      
      public static const const_916:String = "WN_OPENED";
      
      public static const const_821:String = "WN_CLOSED";
      
      public static const const_923:String = "WN_DESTROY";
      
      public static const const_1595:String = "WN_ARRANGED";
      
      public static const const_467:String = "WN_PARENT_RESIZED";
      
      public static const const_991:String = "WN_ENABLE";
      
      public static const const_975:String = "WN_RELOCATE";
      
      public static const const_885:String = "WN_FOCUS";
      
      public static const const_801:String = "WN_PARENT_RELOCATED";
      
      public static const const_390:String = "WN_PARAM_UPDATED";
      
      public static const const_719:String = "WN_PARENT_ACTIVATED";
      
      public static const const_227:String = "WN_RESIZED";
      
      public static const const_989:String = "WN_CLOSE";
      
      public static const const_966:String = "WN_PARENT_REMOVED";
      
      public static const const_263:String = "WN_CHILD_RELOCATED";
      
      public static const const_510:String = "WN_ENABLED";
      
      public static const const_277:String = "WN_CHILD_RESIZED";
      
      public static const const_1015:String = "WN_MINIMIZED";
      
      public static const const_543:String = "WN_DISABLED";
      
      public static const const_210:String = "WN_CHILD_ACTIVATED";
      
      public static const const_442:String = "WN_STATE_UPDATED";
      
      public static const const_541:String = "WN_UNSELECTED";
      
      public static const const_358:String = "WN_STYLE_UPDATED";
      
      public static const const_1582:String = "WN_UPDATE";
      
      public static const const_409:String = "WN_PARENT_ADDED";
      
      public static const const_571:String = "WN_RESIZE";
      
      public static const const_730:String = "WN_CHILD_REMOVED";
      
      public static const const_1586:String = "";
      
      public static const const_902:String = "WN_RESTORED";
      
      public static const const_313:String = "WN_SELECTED";
      
      public static const const_950:String = "WN_MINIMIZE";
      
      public static const const_802:String = "WN_FOCUSED";
      
      public static const const_1291:String = "WN_LOCK";
      
      public static const const_322:String = "WN_CHILD_ADDED";
      
      public static const const_859:String = "WN_UNFOCUSED";
      
      public static const const_373:String = "WN_RELOCATED";
      
      public static const const_925:String = "WN_DEACTIVATE";
      
      public static const const_1359:String = "WN_CRETAE";
      
      public static const const_833:String = "WN_RESTORE";
      
      public static const const_309:String = "WN_ACTVATED";
      
      public static const const_1157:String = "WN_LOCKED";
      
      public static const const_385:String = "WN_SELECT";
      
      public static const const_796:String = "WN_MAXIMIZE";
      
      public static const const_857:String = "WN_OPEN";
      
      public static const const_554:String = "WN_UNSELECT";
      
      public static const const_1597:String = "WN_ARRANGE";
      
      public static const const_1221:String = "WN_UNLOCKED";
      
      public static const const_1598:String = "WN_UPDATED";
      
      public static const const_877:String = "WN_ACTIVATE";
      
      public static const const_1161:String = "WN_UNLOCK";
      
      public static const const_971:String = "WN_MAXIMIZED";
      
      public static const const_843:String = "WN_DESTROYED";
      
      public static const const_995:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1594,cancelable);
      }
   }
}
