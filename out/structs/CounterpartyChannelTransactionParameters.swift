
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Late-bound per-channel counterparty data used to build transactions.
			public typealias CounterpartyChannelTransactionParameters = Bindings.CounterpartyChannelTransactionParameters

			extension Bindings {
		

				/// Late-bound per-channel counterparty data used to build transactions.
				public class CounterpartyChannelTransactionParameters: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCounterpartyChannelTransactionParameters?

					public init(cType: LDKCounterpartyChannelTransactionParameters) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCounterpartyChannelTransactionParameters, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the CounterpartyChannelTransactionParameters, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CounterpartyChannelTransactionParameters_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Counter-party public keys
					public func getPubkeys() -> ChannelPublicKeys {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
				CounterpartyChannelTransactionParameters_get_pubkeys(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelPublicKeys(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Counter-party public keys
					public func setPubkeys(val: ChannelPublicKeys) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKCounterpartyChannelTransactionParameters>) in
				CounterpartyChannelTransactionParameters_set_pubkeys(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The contest delay selected by the counterparty, which applies to holder-broadcast transactions
					public func getSelectedContestDelay() -> UInt16 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
				CounterpartyChannelTransactionParameters_get_selected_contest_delay(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The contest delay selected by the counterparty, which applies to holder-broadcast transactions
					public func setSelectedContestDelay(val: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKCounterpartyChannelTransactionParameters>) in
				CounterpartyChannelTransactionParameters_set_selected_contest_delay(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new CounterpartyChannelTransactionParameters given each field
					public init(pubkeysArg: ChannelPublicKeys, selectedContestDelayArg: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CounterpartyChannelTransactionParameters_new(pubkeysArg.dynamicallyDangledClone().cType!, selectedContestDelayArg)

						// cleanup
						

						/*
						// return value (do some wrapping)
						let returnValue = CounterpartyChannelTransactionParameters(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a copy of the CounterpartyChannelTransactionParameters
					internal func clone() -> CounterpartyChannelTransactionParameters {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
				CounterpartyChannelTransactionParameters_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = CounterpartyChannelTransactionParameters(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Serialize the CounterpartyChannelTransactionParameters object into a byte array which can be read by CounterpartyChannelTransactionParameters_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
				CounterpartyChannelTransactionParameters_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// Read a CounterpartyChannelTransactionParameters from a byte array, created by CounterpartyChannelTransactionParameters_write
					public class func read(ser: [UInt8]) -> Result_CounterpartyChannelTransactionParametersDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = CounterpartyChannelTransactionParameters_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_CounterpartyChannelTransactionParametersDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle() -> CounterpartyChannelTransactionParameters {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> CounterpartyChannelTransactionParameters {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> CounterpartyChannelTransactionParameters {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> CounterpartyChannelTransactionParameters {
						self.cType!.is_owned = freeable
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing CounterpartyChannelTransactionParameters \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing CounterpartyChannelTransactionParameters \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		