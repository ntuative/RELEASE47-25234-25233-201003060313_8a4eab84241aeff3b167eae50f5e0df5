package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_444:int = 0;
      
      public static const const_133:int = 2;
      
      public static const const_160:int = 1;
      
      public static const const_582:Array = ["open","closed","password"];
       
      
      private var _name:String;
      
      private var var_1738:Boolean;
      
      private var var_1740:Boolean;
      
      private var var_1787:int;
      
      private var var_1742:Array;
      
      private var var_1788:int;
      
      private var var_1743:Boolean;
      
      private var var_1209:String;
      
      private var var_1741:int;
      
      private var var_1739:int;
      
      private var var_1208:int;
      
      private var _roomId:int;
      
      private var var_618:Array;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get maximumVisitors() : int
      {
         return var_1741;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1741 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_618;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1743;
      }
      
      public function set controllerCount(param1:int) : void
      {
         var_1788 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1742 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_618 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_1738;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1740;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return var_1787;
      }
      
      public function get categoryId() : int
      {
         return var_1208;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1743 = param1;
      }
      
      public function get controllerCount() : int
      {
         return var_1788;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1742;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1739 = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_1738 = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1740 = param1;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         var_1787 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1739;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1208 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1209 = param1;
      }
      
      public function get description() : String
      {
         return var_1209;
      }
   }
}
