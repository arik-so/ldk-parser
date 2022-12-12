
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Simple structure sent back by `chain::Watch` when an HTLC from a forward channel is detected on
			/// chain. Used to update the corresponding HTLC in the backward channel. Failing to pass the
			/// preimage claim backward will lead to loss of funds.
			public typealias HTLCUpdate = Bindings.HTLCUpdate

			extension Bindings {
		

				/// Simple structure sent back by `chain::Watch` when an HTLC from a forward channel is detected on
				/// chain. Used to update the corresponding HTLC in the backward channel. Failing to pass the
				/// preimage claim backward will lead to loss of funds.
				public class HTLCUpdate: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKHTLCUpdate?

					public init(cType: LDKHTLCUpdate) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKHTLCUpdate, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the HTLCUpdate, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = HTLCUpdate_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the HTLCUpdate
					internal func clone() -> HTLCUpdate {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKHTLCUpdate>) in
				HTLCUpdate_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = HTLCUpdate(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two HTLCUpdates contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: HTLCUpdate, b: HTLCUpdate) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.danglingClone().cType!) { (aPointer: UnsafePointer<LDKHTLCUpdate>) in
				
						withUnsafePointer(to: b.danglingClone().cType!) { (bPointer: UnsafePointer<LDKHTLCUpdate>) in
				HTLCUpdate_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the HTLCUpdate object into a byte array which can be read by HTLCUpdate_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.danglingClone().cType!) { (objPointer: UnsafePointer<LDKHTLCUpdate>) in
				HTLCUpdate_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// Read a HTLCUpdate from a byte array, created by HTLCUpdate_write
					public class func read(ser: [UInt8]) -> Result_HTLCUpdateDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser).dangle()
				

						// native method call
						let nativeCallResult = HTLCUpdate_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_HTLCUpdateDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					internal func dangle() -> HTLCUpdate {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> HTLCUpdate {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> HTLCUpdate {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> HTLCUpdate {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> HTLCUpdate {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing HTLCUpdate \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing HTLCUpdate \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		