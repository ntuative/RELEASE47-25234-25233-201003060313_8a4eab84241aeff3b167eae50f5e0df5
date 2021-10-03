package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1169:int = 4;
      
      public static const const_677:int = 3;
      
      public static const const_718:int = 2;
      
      public static const const_795:int = 1;
       
      
      private var var_2241:String;
      
      private var _disposed:Boolean;
      
      private var var_1694:int;
      
      private var var_2243:Boolean;
      
      private var var_887:String;
      
      private var var_917:PublicRoomData;
      
      private var var_2239:int;
      
      private var _index:int;
      
      private var var_2242:String;
      
      private var _type:int;
      
      private var var_1766:String;
      
      private var var_918:GuestRoomData;
      
      private var var_2240:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_2241 = param1.readString();
         var_2240 = param1.readString();
         var_2243 = param1.readInteger() == 1;
         var_2242 = param1.readString();
         var_887 = param1.readString();
         var_2239 = param1.readInteger();
         var_1694 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_795)
         {
            var_1766 = param1.readString();
         }
         else if(_type == const_677)
         {
            var_917 = new PublicRoomData(param1);
         }
         else if(_type == const_718)
         {
            var_918 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_2239;
      }
      
      public function get popupCaption() : String
      {
         return var_2241;
      }
      
      public function get userCount() : int
      {
         return var_1694;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_2243;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_795)
         {
            return 0;
         }
         if(this.type == const_718)
         {
            return this.var_918.maxUserCount;
         }
         if(this.type == const_677)
         {
            return this.var_917.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_2240;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_918 != null)
         {
            this.var_918.dispose();
            this.var_918 = null;
         }
         if(this.var_917 != null)
         {
            this.var_917.dispose();
            this.var_917 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_918;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_2242;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_917;
      }
      
      public function get picRef() : String
      {
         return var_887;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1766;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
