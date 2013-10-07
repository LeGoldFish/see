--@import see.event.impl.CharEvent
--@import see.event.impl.KeyPressEvent
--@import see.event.impl.TimerEvent
--@import see.event.impl.AlarmEvent
--@import see.event.impl.RedstoneEvent
--@import see.event.impl.TerminateEvent
--@import see.event.impl.DiskInsertEvent
--@import see.event.impl.DiskEjectEvent
--@import see.event.impl.PeripheralAttachEvent
--@import see.event.impl.PeripheralDetachEvent
--@import see.event.impl.RednetMessageEvent
--@import see.event.impl.ModemMessageEvent
--@import see.event.impl.HttpSuccessEvent
--@import see.event.impl.HttpFailureEvent
--@import see.event.impl.MousePressEvent
--@import see.event.impl.MouseScrollEvent
--@import see.event.impl.MouseDragEvent
--@import see.event.impl.MonitorTouchEvent
--@import see.event.impl.MonitorResizeEvent
--@import see.event.impl.TurtleInventoryEvent

local registeredEvents

function Events.__static()
	registeredEvents = { }

	Events.register("char",              CharEvent)
	Events.register("key",               KeyPressEvent)
	Events.register("timer",             TimerEvent)
	Events.register("alarm",             AlarmEvent)
	Events.register("redstone",          RedstoneEvent)
	Events.register("terminate",         TerminateEvent)
	Events.register("disk",              DiskInsertEvent)
	Events.register("disk_eject",        DiskEjectEvent)
	Events.register("peripheral",        PeripheralAttachEvent)
	Events.register("peripheral_detach", PeripheralDetachEvent)
	Events.register("rednet_message",    RednetMessageEvent)
	Events.register("modem_message",     ModemMessageEvent)
	Events.register("http_success",      HttpSuccessEvent)
	Events.register("http_failure",      HttpFailureEvent)
	Events.register("mouse_click",       MousePressEvent)
	Events.register("mouse_scroll",      MouseScrollEvent)
	Events.register("mouse_drag",        MouseDragEvent)
	Events.register("monitor_touch",     MonitorTouchEvent)
	Events.register("monitor_resize",    MonitorResizeEvent)
	Events.register("turtle_inventory",  TurtleInventoryEvent)
end

function Events.register(ident, eventClass)
	registeredEvents[ident] = eventClass
end

function Events.queue(event)
	
end

function Events.pull(...)
	
end