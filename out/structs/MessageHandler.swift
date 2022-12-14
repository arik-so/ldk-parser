
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Provides references to trait impls which handle different types of messages.
			public typealias MessageHandler = Bindings.MessageHandler

			extension Bindings {
		

				/// Provides references to trait impls which handle different types of messages.
				public class MessageHandler: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKMessageHandler?

					internal init(cType: LDKMessageHandler) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKMessageHandler, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the MessageHandler, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MessageHandler_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// A message handler which handles messages specific to channels. Usually this is just a
					/// [`ChannelManager`] object or an [`ErroringMessageHandler`].
					/// 
					/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
					public func getChanHandler() -> ChannelMessageHandler? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKMessageHandler>) in
				MessageHandler_get_chan_handler(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedChannelMessageHandler(cType: nativeCallResult.pointee, anchor: self)
						

						return returnValue
					}
		
					/// A message handler which handles messages specific to channels. Usually this is just a
					/// [`ChannelManager`] object or an [`ErroringMessageHandler`].
					/// 
					/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
					public func setChanHandler(val: ChannelMessageHandler) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKMessageHandler>) in
				MessageHandler_set_chan_handler(thisPtrPointer, val.activate().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// A message handler which handles messages updating our knowledge of the network channel
					/// graph. Usually this is just a [`P2PGossipSync`] object or an [`IgnoringMessageHandler`].
					/// 
					/// [`P2PGossipSync`]: crate::routing::gossip::P2PGossipSync
					public func getRouteHandler() -> RoutingMessageHandler? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKMessageHandler>) in
				MessageHandler_get_route_handler(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedRoutingMessageHandler(cType: nativeCallResult.pointee, anchor: self)
						

						return returnValue
					}
		
					/// A message handler which handles messages updating our knowledge of the network channel
					/// graph. Usually this is just a [`P2PGossipSync`] object or an [`IgnoringMessageHandler`].
					/// 
					/// [`P2PGossipSync`]: crate::routing::gossip::P2PGossipSync
					public func setRouteHandler(val: RoutingMessageHandler) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKMessageHandler>) in
				MessageHandler_set_route_handler(thisPtrPointer, val.activate().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// A message handler which handles onion messages. For now, this can only be an
					/// [`IgnoringMessageHandler`].
					public func getOnionMessageHandler() -> OnionMessageHandler? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKMessageHandler>) in
				MessageHandler_get_onion_message_handler(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedOnionMessageHandler(cType: nativeCallResult.pointee, anchor: self)
						

						return returnValue
					}
		
					/// A message handler which handles onion messages. For now, this can only be an
					/// [`IgnoringMessageHandler`].
					public func setOnionMessageHandler(val: OnionMessageHandler) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKMessageHandler>) in
				MessageHandler_set_onion_message_handler(thisPtrPointer, val.activate().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new MessageHandler given each field
					public init(chanHandlerArg: ChannelMessageHandler, routeHandlerArg: RoutingMessageHandler, onionMessageHandlerArg: OnionMessageHandler) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MessageHandler_new(chanHandlerArg.activate().cType!, routeHandlerArg.activate().cType!, onionMessageHandlerArg.activate().cType!)

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = MessageHandler(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> MessageHandler {
						self.dangling = shouldDangle
						return self
					}

					
					internal func setCFreeability(freeable: Bool) -> MessageHandler {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> MessageHandler {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing MessageHandler \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing MessageHandler \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		