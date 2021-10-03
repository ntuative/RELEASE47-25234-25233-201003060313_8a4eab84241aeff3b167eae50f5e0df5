package com.sulake.habbo.communication
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.ICoreCommunicationManager;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.connection.IConnectionStateListener;
   import com.sulake.core.communication.enum.ConnectionType;
   import com.sulake.core.communication.messages.IMessageConfiguration;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.protocol.IProtocol;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.habbo.communication.enum.HabboConnectionType;
   import com.sulake.habbo.communication.enum.HabboProtocolType;
   import com.sulake.habbo.communication.protocol.WedgieProtocol;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.habbo.tracking.HabboErrorVariableEnum;
   import com.sulake.iid.IIDCoreCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class HabboCommunicationManager extends Component implements IHabboCommunicationManager, IConnectionStateListener
   {
       
      
      private var var_698:int = 0;
      
      private var var_36:String = "";
      
      private var var_1268:Timer;
      
      private var var_263:Array;
      
      private var var_2072:Boolean = false;
      
      private var var_88:String = "";
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var var_1007:IMessageConfiguration;
      
      private const const_1641:int = 5;
      
      private var var_353:int = -1;
      
      private var var_312:ICoreCommunicationManager;
      
      private var var_854:int = 1;
      
      private var var_2071:Boolean = false;
      
      private var var_2073:Boolean = false;
      
      private var _connection:IConnection;
      
      public function HabboCommunicationManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1007 = new HabboMessages();
         var_263 = [];
         var_1268 = new Timer(100,1);
         super(param1,param2,param3);
         this.queueInterface(new IIDCoreCommunicationManager(),onCoreCommunicationManagerInit);
         this.queueInterface(new IIDHabboConfigurationManager(),onHabboConfigurationInit);
      }
      
      public function get port() : int
      {
         if(var_353 < 0 || var_353 >= var_263.length)
         {
            return 0;
         }
         return var_263[var_353];
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] Security Error: " + param1.text);
         ErrorReportStorage.addDebugData("Communication Security Error","SecurityError on connect: " + param1.text + ". Port was " + var_263[var_353]);
         tryNextPort();
      }
      
      private function onConnect(param1:Event) : void
      {
         ErrorReportStorage.addDebugData("Connection","Connected with " + var_854 + " attempts");
      }
      
      private function onConfigurationReady(param1:Event = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         Logger.log("Habbo Communication Manager: init based on configuration: " + _habboConfiguration);
         if(_habboConfiguration == null)
         {
            Core.crash("Received configuration ready event but configuration was null",Core.const_818);
         }
         else
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Ready");
            var_263 = [];
            var_36 = _habboConfiguration.getKey("connection.info.host","fused37-public-proxy-1.hotel.varoke.net");
            _loc2_ = _habboConfiguration.getKey("connection.info.port","25001");
            _loc3_ = _loc2_.split(",");
            for each(_loc4_ in _loc3_)
            {
               var_263.push(parseInt(_loc4_.replace(" ","")));
            }
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Host: " + var_36);
            Logger.log("Connection Host: " + var_36);
            Logger.log("Connection Ports: " + var_263);
            Logger.log("Habbo Connection Info:" + _connection);
            var_2071 = true;
            if(var_2073)
            {
               nextPort();
            }
         }
      }
      
      public function messageReceived(param1:String, param2:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1231,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1205,param1 + " " + param2);
         if(false)
         {
            var_88 += ",R:" + param1;
         }
         else
         {
            var_88 = "R:" + param1;
         }
         if(false)
         {
            var_88 = var_88.substring(-150);
         }
         ErrorReportStorage.addDebugData("MESSAGE_QUEUE",var_88);
      }
      
      private function nextPort() : void
      {
         ++var_353;
         if(var_353 >= var_263.length)
         {
            ++var_854;
            ErrorReportStorage.addDebugData("ConnectionRetry","Connection attempt " + var_854);
            if(var_854 > const_1641)
            {
               if(var_2072)
               {
                  return;
               }
               var_2072 = true;
               Core.error("Connection failed to host " + var_36 + " ports " + var_263,true,Core.const_602);
               return;
            }
            var_353 = 0;
         }
         _connection.timeout = var_854 * 5000;
         _connection.init(var_36,var_263[var_353]);
      }
      
      private function onTryNextPort(param1:TimerEvent) : void
      {
         var_1268.stop();
         nextPort();
      }
      
      public function get mode() : int
      {
         return var_698;
      }
      
      override public function dispose() : void
      {
         if(_connection)
         {
            _connection.dispose();
            _connection = null;
         }
         if(var_312)
         {
            var_312.release(new IIDCoreCommunicationManager());
            var_312 = null;
         }
         if(_habboConfiguration)
         {
            _habboConfiguration.release(new IIDHabboConfigurationManager());
            _habboConfiguration = null;
         }
         super.dispose();
      }
      
      public function initConnection(param1:String) : void
      {
         switch(param1)
         {
            case HabboConnectionType.const_250:
               if(_habboConfiguration == null)
               {
                  Core.crash("Tried to connect to proxy but configuration was null",Core.const_602);
                  return;
               }
               if(_connection == null)
               {
                  Core.crash("Tried to connect to proxy but connection was null",Core.const_602);
                  return;
               }
               var_2073 = true;
               if(var_2071)
               {
                  nextPort();
               }
               break;
            default:
               Logger.log("Unknown Habbo Connection Type: " + param1);
         }
      }
      
      public function habboWebLogin(param1:String, param2:String) : IHabboWebLogin
      {
         var _loc3_:String = "";
         _loc3_ = _habboConfiguration.getKey("url.prefix",_loc3_);
         _loc3_ = _loc3_.replace("http://","");
         _loc3_ = _loc3_.replace("https://","");
         return new HabboWebLogin(param1,param2,_loc3_);
      }
      
      public function addHabboConnectionMessageEvent(param1:IMessageEvent) : void
      {
         return var_312.addConnectionMessageEvent(HabboConnectionType.const_250,param1);
      }
      
      public function connectionInit(param1:String, param2:int) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1282,param1);
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1317,String(param2));
      }
      
      public function messageSent(param1:String, param2:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1167,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1170,param1 + " " + param2);
         if(false)
         {
            var_88 += ",S:" + param1;
         }
         else
         {
            var_88 = "S:" + param1;
         }
         if(false)
         {
            var_88 = var_88.substring(-150);
         }
         ErrorReportStorage.addDebugData("MESSAGE_QUEUE",var_88);
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] IO Error: " + param1.text);
         switch(param1.type)
         {
            case IOErrorEvent.IO_ERROR:
               break;
            case IOErrorEvent.DISK_ERROR:
               break;
            case IOErrorEvent.NETWORK_ERROR:
               break;
            case IOErrorEvent.VERIFY_ERROR:
         }
         ErrorReportStorage.addDebugData("Communication IO Error","IOError " + param1.type + " on connect: " + param1.text + ". Port was " + var_263[var_353]);
         tryNextPort();
      }
      
      public function set mode(param1:int) : void
      {
         var_698 = param1;
      }
      
      private function onCoreCommunicationManagerInit(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:* = null;
         Logger.log("Habbo Communication Manager: Core Communication Manager found:: " + [param1,param2]);
         if(param2 != null)
         {
            var_312 = param2 as ICoreCommunicationManager;
            var_312.connectionStateListener = this;
            var_312.registerProtocolType(HabboProtocolType.const_935,WedgieProtocol);
            _connection = var_312.createConnection(HabboConnectionType.const_250,ConnectionType.const_893);
            _loc3_ = var_312.getProtocolInstanceOfType(HabboProtocolType.const_935);
            _connection.registerMessageClasses(var_1007);
            _connection.protocol = _loc3_;
            _connection.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
            _connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
            _connection.addEventListener(Event.CONNECT,onConnect);
         }
      }
      
      private function tryNextPort() : void
      {
         var_1268.addEventListener(TimerEvent.TIMER,onTryNextPort);
         var_1268.start();
      }
      
      private function onHabboConfigurationInit(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Received");
            _habboConfiguration = param2 as IHabboConfigurationManager;
            (_habboConfiguration as Component).events.addEventListener(HabboConfigurationEvent.INIT,onConfigurationReady);
         }
         else
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config NOT received");
         }
      }
      
      public function getHabboMainConnection(param1:Function) : IConnection
      {
         return !!var_312 ? var_312.queueConnection(HabboConnectionType.const_250,param1) : null;
      }
   }
}
