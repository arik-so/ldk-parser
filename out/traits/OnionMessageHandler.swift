
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A trait to describe an object that can receive onion messages.
			public typealias OnionMessageHandler = Bindings.OnionMessageHandler

			extension Bindings {

				/// A trait to describe an object that can receive onion messages.
				open class OnionMessageHandler: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKOnionMessageHandler?

					public init(cType: LDKOnionMessageHandler) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKOnionMessageHandler, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(OnionMessageProvider: OnionMessageProvider) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func handleOnionMessageLambda(this_arg: UnsafeRawPointer?, peer_node_id: LDKPublicKey, msg: UnsafePointer<LDKOnionMessage>) -> Void {
							let instance: OnionMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "OnionMessageHandler::handleOnionMessageLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleOnionMessage(peerNodeId: PublicKey(cType: peer_node_id).getValue(), msg: OnionMessage(cType: msg.pointee))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func peerConnectedLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, initArgument: UnsafePointer<LDKInit>) -> LDKCResult_NoneNoneZ {
							let instance: OnionMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "OnionMessageHandler::peerConnectedLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.peerConnected(theirNodeId: PublicKey(cType: their_node_id).getValue(), initArgument: BindingsInit(cType: initArgument.pointee))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func peerDisconnectedLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, no_connection_possible: Bool) -> Void {
							let instance: OnionMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "OnionMessageHandler::peerDisconnectedLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.peerDisconnected(theirNodeId: PublicKey(cType: their_node_id).getValue(), noConnectionPossible: no_connection_possible)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func providedNodeFeaturesLambda(this_arg: UnsafeRawPointer?) -> LDKNodeFeatures {
							let instance: OnionMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "OnionMessageHandler::providedNodeFeaturesLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.providedNodeFeatures()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func providedInitFeaturesLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey) -> LDKInitFeatures {
							let instance: OnionMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "OnionMessageHandler::providedInitFeaturesLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.providedInitFeatures(theirNodeId: PublicKey(cType: their_node_id).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: OnionMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "OnionMessageHandler::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKOnionMessageHandler(							
							this_arg: thisArg,
							handle_onion_message: handleOnionMessageLambda,
							peer_connected: peerConnectedLambda,
							peer_disconnected: peerDisconnectedLambda,
							provided_node_features: providedNodeFeaturesLambda,
							provided_init_features: providedInitFeaturesLambda,
							OnionMessageProvider: OnionMessageProvider.activate().cType!,
							free: freeLambda
						)
					}

					
					/// Handle an incoming onion_message message from the given peer.
					open func handleOnionMessage(peerNodeId: [UInt8], msg: OnionMessage) -> Void {
						
						Bindings.print("Error: OnionMessageHandler::handleOnionMessage MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Called when a connection is established with a peer. Can be used to track which peers
					/// advertise onion message support and are online.
					/// 
					/// May return an `Err(())` if the features the peer supports are not sufficient to communicate
					/// with us. Implementors should be somewhat conservative about doing so, however, as other
					/// message handlers may still wish to communicate with this peer.
					open func peerConnected(theirNodeId: [UInt8], initArgument: BindingsInit) -> Result_NoneNoneZ {
						
						Bindings.print("Error: OnionMessageHandler::peerConnected MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Indicates a connection to the peer failed/an existing connection was lost. Allows handlers to
					/// drop and refuse to forward onion messages to this peer.
					/// 
					/// Note that in some rare cases this may be called without a corresponding
					/// [`Self::peer_connected`].
					open func peerDisconnected(theirNodeId: [UInt8], noConnectionPossible: Bool) -> Void {
						
						Bindings.print("Error: OnionMessageHandler::peerDisconnected MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Gets the node feature flags which this handler itself supports. All available handlers are
					/// queried similarly and their feature flags are OR'd together to form the [`NodeFeatures`]
					/// which are broadcasted in our [`NodeAnnouncement`] message.
					open func providedNodeFeatures() -> NodeFeatures {
						
						Bindings.print("Error: OnionMessageHandler::providedNodeFeatures MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Gets the init feature flags which should be sent to the given peer. All available handlers
					/// are queried similarly and their feature flags are OR'd together to form the [`InitFeatures`]
					/// which are sent in our [`Init`] message.
					/// 
					/// Note that this method is called before [`Self::peer_connected`].
					open func providedInitFeatures(theirNodeId: [UInt8]) -> InitFeatures {
						
						Bindings.print("Error: OnionMessageHandler::providedInitFeatures MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					internal func free() -> Void {
						
				// TODO: figure out something smarter
				return
			
						Bindings.print("Error: OnionMessageHandler::free MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					

					
					/// Implementation of OnionMessageProvider for this object.
					public func getOnionMessageProvider() -> OnionMessageProvider {
						// return value (do some wrapping)
						let returnValue = NativelyImplementedOnionMessageProvider(cType: self.cType!.OnionMessageProvider, anchor: self).dangle()

						return returnValue;
					}
		

					internal func dangle() -> OnionMessageHandler {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing OnionMessageHandler \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing OnionMessageHandler \(self.instanceNumber) due to dangle.")
						}
					}
				}

				internal class NativelyImplementedOnionMessageHandler: OnionMessageHandler {
					
					/// Handle an incoming onion_message message from the given peer.
					public override func handleOnionMessage(peerNodeId: [UInt8], msg: OnionMessage) {
						// native call variable prep
						
						let peerNodeIdPrimitiveWrapper = PublicKey(value: peerNodeId)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKOnionMessage>) in
				self.cType!.handle_onion_message(self.cType!.this_arg, peerNodeIdPrimitiveWrapper.cType!, msgPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Called when a connection is established with a peer. Can be used to track which peers
					/// advertise onion message support and are online.
					/// 
					/// May return an `Err(())` if the features the peer supports are not sufficient to communicate
					/// with us. Implementors should be somewhat conservative about doing so, however, as other
					/// message handlers may still wish to communicate with this peer.
					public override func peerConnected(theirNodeId: [UInt8], initArgument: BindingsInit) -> Result_NoneNoneZ {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: initArgument.cType!) { (initArgumentPointer: UnsafePointer<LDKInit>) in
				self.cType!.peer_connected(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, initArgumentPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NoneNoneZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Indicates a connection to the peer failed/an existing connection was lost. Allows handlers to
					/// drop and refuse to forward onion messages to this peer.
					/// 
					/// Note that in some rare cases this may be called without a corresponding
					/// [`Self::peer_connected`].
					public override func peerDisconnected(theirNodeId: [UInt8], noConnectionPossible: Bool) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						// native method call
						let nativeCallResult = self.cType!.peer_disconnected(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, noConnectionPossible)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Gets the node feature flags which this handler itself supports. All available handlers are
					/// queried similarly and their feature flags are OR'd together to form the [`NodeFeatures`]
					/// which are broadcasted in our [`NodeAnnouncement`] message.
					public override func providedNodeFeatures() -> NodeFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.provided_node_features(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = NodeFeatures(cType: nativeCallResult)

						return returnValue
					}
		
					/// Gets the init feature flags which should be sent to the given peer. All available handlers
					/// are queried similarly and their feature flags are OR'd together to form the [`InitFeatures`]
					/// which are sent in our [`Init`] message.
					/// 
					/// Note that this method is called before [`Self::peer_connected`].
					public override func providedInitFeatures(theirNodeId: [UInt8]) -> InitFeatures {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						// native method call
						let nativeCallResult = self.cType!.provided_init_features(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = InitFeatures(cType: nativeCallResult)

						return returnValue
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					public override func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.free(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
				}

			}
		