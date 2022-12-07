
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias CustomMessageReader = Bindings.CustomMessageReader

			extension Bindings {

				/// Trait to be implemented by custom message (unrelated to the channel/gossip LN layers)
				/// decoders.
				open class CustomMessageReader: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCustomMessageReader?

					public init(cType: LDKCustomMessageReader) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCustomMessageReader, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init() {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func readLambda(this_arg: UnsafeRawPointer?, message_type: UInt16, buffer: LDKu8slice) -> LDKCResult_COption_TypeZDecodeErrorZ {
							let instance: CustomMessageReader = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "CustomMessageReader::readLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.read(messageType: message_type, buffer: u8slice(cType: buffer).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: CustomMessageReader = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "CustomMessageReader::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKCustomMessageReader(							
							this_arg: thisArg,
							read: readLambda,
							free: freeLambda
						)

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Decodes a custom message to `CustomMessageType`. If the given message type is known to the
					/// implementation and the message could be decoded, must return `Ok(Some(message))`. If the
					/// message type is unknown to the implementation, must return `Ok(None)`. If a decoding error
					/// occur, must return `Err(DecodeError::X)` where `X` details the encountered error.
					open func read(messageType: UInt16, buffer: [UInt8]) -> Result_COption_TypeZDecodeErrorZ {
						Bindings.print("Error: CustomMessageReader::read MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					open func free() -> Void {
						Bindings.print("Error: CustomMessageReader::free MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					

					

					internal func dangle() -> CustomMessageReader {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing CustomMessageReader \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing CustomMessageReader \(self.instanceNumber) due to dangle.")
						}
					}
				}

				public class NativelyImplementedCustomMessageReader: CustomMessageReader {
					
					/// Decodes a custom message to `CustomMessageType`. If the given message type is known to the
					/// implementation and the message could be decoded, must return `Ok(Some(message))`. If the
					/// message type is unknown to the implementation, must return `Ok(None)`. If a decoding error
					/// occur, must return `Err(DecodeError::X)` where `X` details the encountered error.
					public override func read(messageType: UInt16, buffer: [UInt8]) -> Result_COption_TypeZDecodeErrorZ {
						// native call variable prep
						
						let bufferPrimitiveWrapper = u8slice(value: buffer)
				

						// native method call
						let nativeCallResult = self.cType!.read(self.cType!.this_arg, messageType, bufferPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_COption_TypeZDecodeErrorZ(cType: nativeCallResult)

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
		