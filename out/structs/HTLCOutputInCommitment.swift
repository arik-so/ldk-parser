
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias HTLCOutputInCommitment = Bindings.HTLCOutputInCommitment

			extension Bindings {
		

				/// Information about an HTLC as it appears in a commitment transaction
				public class HTLCOutputInCommitment: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKHTLCOutputInCommitment?

					public init(cType: LDKHTLCOutputInCommitment) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKHTLCOutputInCommitment, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the HTLCOutputInCommitment, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = HTLCOutputInCommitment_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Whether the HTLC was \"offered\" (ie outbound in relation to this commitment transaction).
					/// Note that this is not the same as whether it is ountbound *from us*. To determine that you
					/// need to compare this value to whether the commitment transaction in question is that of
					/// the counterparty or our own.
					public func getOffered() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
			HTLCOutputInCommitment_get_offered(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Whether the HTLC was \"offered\" (ie outbound in relation to this commitment transaction).
					/// Note that this is not the same as whether it is ountbound *from us*. To determine that you
					/// need to compare this value to whether the commitment transaction in question is that of
					/// the counterparty or our own.
					public func setOffered(val: Bool) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKHTLCOutputInCommitment>) in
			HTLCOutputInCommitment_set_offered(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The value, in msat, of the HTLC. The value as it appears in the commitment transaction is
					/// this divided by 1000.
					public func getAmountMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
			HTLCOutputInCommitment_get_amount_msat(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The value, in msat, of the HTLC. The value as it appears in the commitment transaction is
					/// this divided by 1000.
					public func setAmountMsat(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKHTLCOutputInCommitment>) in
			HTLCOutputInCommitment_set_amount_msat(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The CLTV lock-time at which this HTLC expires.
					public func getCltvExpiry() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
			HTLCOutputInCommitment_get_cltv_expiry(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The CLTV lock-time at which this HTLC expires.
					public func setCltvExpiry(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKHTLCOutputInCommitment>) in
			HTLCOutputInCommitment_set_cltv_expiry(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The hash of the preimage which unlocks this HTLC.
					public func setPaymentHash(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKHTLCOutputInCommitment>) in
			HTLCOutputInCommitment_set_payment_hash(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The position within the commitment transactions' outputs. This may be None if the value is
					/// below the dust limit (in which case no output appears in the commitment transaction and the
					/// value is spent to additional transaction fees).
					public func getTransactionOutputIndex() -> UInt32? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
			HTLCOutputInCommitment_get_transaction_output_index(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Option_u32Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// The position within the commitment transactions' outputs. This may be None if the value is
					/// below the dust limit (in which case no output appears in the commitment transaction and the
					/// value is spent to additional transaction fees).
					public func setTransactionOutputIndex(val: UInt32?) {
						// native call variable prep
						
						let valOption = Option_u32Z(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKHTLCOutputInCommitment>) in
			HTLCOutputInCommitment_set_transaction_output_index(thisPtrPointer, valOption.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new HTLCOutputInCommitment given each field
					public init(offeredArg: Bool, amountMsatArg: UInt64, cltvExpiryArg: UInt32, paymentHashArg: [UInt8], transactionOutputIndexArg: UInt32?) {
						// native call variable prep
						
						let paymentHashArgPrimitiveWrapper = ThirtyTwoBytes(value: paymentHashArg)
				
						let transactionOutputIndexArgOption = Option_u32Z(value: transactionOutputIndexArg)
				

						// native method call
						let nativeCallResult = HTLCOutputInCommitment_new(offeredArg, amountMsatArg, cltvExpiryArg, paymentHashArgPrimitiveWrapper.cType!, transactionOutputIndexArgOption.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = HTLCOutputInCommitment(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the HTLCOutputInCommitment
					internal func clone() -> HTLCOutputInCommitment {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
			HTLCOutputInCommitment_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = HTLCOutputInCommitment(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two HTLCOutputInCommitments contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
			HTLCOutputInCommitment_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the HTLCOutputInCommitment object into a byte array which can be read by HTLCOutputInCommitment_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
			HTLCOutputInCommitment_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a HTLCOutputInCommitment from a byte array, created by HTLCOutputInCommitment_write
					public class func read(ser: [UInt8]) -> Result_HTLCOutputInCommitmentDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = HTLCOutputInCommitment_read(serPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_HTLCOutputInCommitmentDecodeErrorZ(cType: nativeCallResult)

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
		

					internal func dangle() -> HTLCOutputInCommitment {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> HTLCOutputInCommitment {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing HTLCOutputInCommitment \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing HTLCOutputInCommitment \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		