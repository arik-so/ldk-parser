
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias CustomOnionMessageHandler = Bindings.CustomOnionMessageHandler

			extension Bindings {

				/// Handler for custom onion messages. If you are using [`SimpleArcOnionMessenger`],
				/// [`SimpleRefOnionMessenger`], or prefer to ignore inbound custom onion messages,
				/// [`IgnoringMessageHandler`] must be provided to [`OnionMessenger::new`]. Otherwise, a custom
				/// implementation of this trait must be provided, with [`CustomMessage`] specifying the supported
				/// message types.
				/// 
				/// See [`OnionMessenger`] for example usage.
				/// 
				/// [`IgnoringMessageHandler`]: crate::ln::peer_handler::IgnoringMessageHandler
				/// [`CustomMessage`]: Self::CustomMessage
				open class CustomOnionMessageHandler: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCustomOnionMessageHandler?

					public init(pointer: LDKCustomOnionMessageHandler) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKCustomOnionMessageHandler, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init() {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func handleCustomMessageLambda(this_arg: UnsafeRawPointer?, msg: LDKCustomOnionMessageContents) -> Void {
							let instance: CustomOnionMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "CustomOnionMessageHandler::handleCustomMessageLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleCustomMessage(msg: NativelyImplementedCustomOnionMessageContents(pointer: msg))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func readCustomMessageLambda(this_arg: UnsafeRawPointer?, message_type: UInt64, buffer: LDKu8slice) -> LDKCResult_COption_CustomOnionMessageContentsZDecodeErrorZ {
							let instance: CustomOnionMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "CustomOnionMessageHandler::readCustomMessageLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.readCustomMessage(messageType: message_type, buffer: u8slice(pointer: buffer).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: CustomOnionMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "CustomOnionMessageHandler::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKCustomOnionMessageHandler(							
							this_arg: thisArg,
							handle_custom_message: handleCustomMessageLambda,
							read_custom_message: readCustomMessageLambda,
							free: freeLambda
						)

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Called with the custom message that was received.
					open func handleCustomMessage(msg: CustomOnionMessageContents) -> Void {
						Bindings.print("Error: CustomOnionMessageHandler::handleCustomMessage MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Read a custom message of type `message_type` from `buffer`, returning `Ok(None)` if the
					/// message type is unknown.
					open func readCustomMessage(messageType: UInt64, buffer: [UInt8]) -> Result_COption_CustomOnionMessageContentsZDecodeErrorZ {
						Bindings.print("Error: CustomOnionMessageHandler::readCustomMessage MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					open func free() -> Void {
						Bindings.print("Error: CustomOnionMessageHandler::free MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					
					/// Calls the free function if one is set
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CustomOnionMessageHandler_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					

					internal func dangle() -> CustomOnionMessageHandler {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing CustomOnionMessageHandler \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing CustomOnionMessageHandler \(self.instanceNumber) due to dangle.")
						}
					}
				}

				public class NativelyImplementedCustomOnionMessageHandler: CustomOnionMessageHandler {
					
					/// Called with the custom message that was received.
					public func handleCustomMessage(msg: CustomOnionMessageContents) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.handle_custom_message(self.cType!.this_arg, msg.activate().cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Read a custom message of type `message_type` from `buffer`, returning `Ok(None)` if the
					/// message type is unknown.
					public func readCustomMessage(messageType: UInt64, buffer: [UInt8]) -> Result_COption_CustomOnionMessageContentsZDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.read_custom_message(self.cType!.this_arg, messageType, buffer.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_COption_CustomOnionMessageContentsZDecodeErrorZ(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					public func free() {
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
		