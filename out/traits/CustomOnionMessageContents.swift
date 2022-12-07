
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias CustomOnionMessageContents = Bindings.CustomOnionMessageContents

			extension Bindings {

				/// The contents of a custom onion message.
				open class CustomOnionMessageContents: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCustomOnionMessageContents?

					public init(cType: LDKCustomOnionMessageContents) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCustomOnionMessageContents, anchor: NativeTypeWrapper) {
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

						

						
						func tlvTypeLambda(this_arg: UnsafeRawPointer?) -> UInt64 {
							let instance: CustomOnionMessageContents = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "CustomOnionMessageContents::tlvTypeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.tlvType()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func writeLambda(this_arg: UnsafeRawPointer?) -> LDKCVec_u8Z {
							let instance: CustomOnionMessageContents = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "CustomOnionMessageContents::writeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.write()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = Vec_u8Z(array: swiftCallbackResult).dangle().cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: CustomOnionMessageContents = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "CustomOnionMessageContents::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKCustomOnionMessageContents(							
							this_arg: thisArg,
							tlv_type: tlvTypeLambda,
							write: writeLambda,
							cloned: nil,
							free: freeLambda
						)

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Returns the TLV type identifying the message contents. MUST be >= 64.
					open func tlvType() -> UInt64 {
						Bindings.print("Error: CustomOnionMessageContents::tlvType MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Serialize the object into a byte array
					open func write() -> [UInt8] {
						Bindings.print("Error: CustomOnionMessageContents::write MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					open func free() -> Void {
						Bindings.print("Error: CustomOnionMessageContents::free MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					
					/// Creates a copy of a CustomOnionMessageContents
					internal func clone() -> CustomOnionMessageContents {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCustomOnionMessageContents>) in
			CustomOnionMessageContents_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = NativelyImplementedCustomOnionMessageContents(cType: nativeCallResult, anchor: self)

						return returnValue
					}
		
					/// Calls the free function if one is set
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CustomOnionMessageContents_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					

					internal func dangle() -> CustomOnionMessageContents {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing CustomOnionMessageContents \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing CustomOnionMessageContents \(self.instanceNumber) due to dangle.")
						}
					}
				}

				public class NativelyImplementedCustomOnionMessageContents: CustomOnionMessageContents {
					
					/// Returns the TLV type identifying the message contents. MUST be >= 64.
					override func tlvType() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.tlv_type(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the object into a byte array
					override func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.write(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					override func free() {
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
		