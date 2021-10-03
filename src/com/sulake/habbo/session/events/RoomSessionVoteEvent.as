package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_107:String = "RSPE_VOTE_RESULT";
      
      public static const const_117:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1196:int = 0;
      
      private var var_1061:String = "";
      
      private var var_680:Array;
      
      private var var_990:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_990 = [];
         var_680 = [];
         super(param1,param2,param7,param8);
         var_1061 = param3;
         var_990 = param4;
         var_680 = param5;
         if(var_680 == null)
         {
            var_680 = [];
         }
         var_1196 = param6;
      }
      
      public function get votes() : Array
      {
         return var_680.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1196;
      }
      
      public function get question() : String
      {
         return var_1061;
      }
      
      public function get choices() : Array
      {
         return var_990.slice();
      }
   }
}
