
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias FundingCreated = Bindings.FundingCreated

			extension Bindings {
		

				/// A funding_created message to be sent or received from a peer
				public class FundingCreated: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKFundingCreated?

					public init(cType: LDKFundingCreated) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKFundingCreated, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the FundingCreated, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = FundingCreated_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// A temporary channel ID, until the funding is established
					public func setTemporaryChannelId(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKFundingCreated>) in
			FundingCreated_set_temporary_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The funding transaction ID
					public func setFundingTxid(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKFundingCreated>) in
			FundingCreated_set_funding_txid(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The specific output index funding this channel
					public func getFundingOutputIndex() -> UInt16 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKFundingCreated>) in
			FundingCreated_get_funding_output_index(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The specific output index funding this channel
					public func setFundingOutputIndex(val: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKFundingCreated>) in
			FundingCreated_set_funding_output_index(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The signature of the channel initiator (funder) on the initial commitment transaction
					public func getSignature() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKFundingCreated>) in
			FundingCreated_get_signature(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Signature(cType: nativeCallResult)

						return returnValue
					}
		
					/// The signature of the channel initiator (funder) on the initial commitment transaction
					public func setSignature(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = Signature(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKFundingCreated>) in
			FundingCreated_set_signature(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new FundingCreated given each field
					public init(temporaryChannelIdArg: [UInt8], fundingTxidArg: [UInt8], fundingOutputIndexArg: UInt16, signatureArg: [UInt8]) {
						// native call variable prep
						
						let temporaryChannelIdArgPrimitiveWrapper = ThirtyTwoBytes(value: temporaryChannelIdArg)
				
						let fundingTxidArgPrimitiveWrapper = ThirtyTwoBytes(value: fundingTxidArg)
				
						let signatureArgPrimitiveWrapper = Signature(value: signatureArg)
				

						// native method call
						let nativeCallResult = FundingCreated_new(temporaryChannelIdArgPrimitiveWrapper.cType!, fundingTxidArgPrimitiveWrapper.cType!, fundingOutputIndexArg, signatureArgPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = FundingCreated(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the FundingCreated
					internal func clone() -> FundingCreated {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKFundingCreated>) in
			FundingCreated_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = FundingCreated(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two FundingCreateds contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKFundingCreated>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKFundingCreated>) in
			FundingCreated_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the FundingCreated object into a byte array which can be read by FundingCreated_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKFundingCreated>) in
			FundingCreated_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a FundingCreated from a byte array, created by FundingCreated_write
					public class func read(ser: [UInt8]) -> Result_FundingCreatedDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = FundingCreated_read(serPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_FundingCreatedDecodeErrorZ(cType: nativeCallResult)

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
		

					internal func dangle() -> FundingCreated {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> FundingCreated {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing FundingCreated \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing FundingCreated \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		