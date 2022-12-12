
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Information needed to build and sign a holder's commitment transaction.
			/// 
			/// The transaction is only signed once we are ready to broadcast.
			public typealias HolderCommitmentTransaction = Bindings.HolderCommitmentTransaction

			extension Bindings {
		

				/// Information needed to build and sign a holder's commitment transaction.
				/// 
				/// The transaction is only signed once we are ready to broadcast.
				public class HolderCommitmentTransaction: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKHolderCommitmentTransaction?

					public init(cType: LDKHolderCommitmentTransaction) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKHolderCommitmentTransaction, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the HolderCommitmentTransaction, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = HolderCommitmentTransaction_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Our counterparty's signature for the transaction
					public func getCounterpartySig() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.danglingClone().cType!) { (thisPtrPointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
				HolderCommitmentTransaction_get_counterparty_sig(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Signature(cType: nativeCallResult).dangle().getValue()
						

						return returnValue
					}
		
					/// Our counterparty's signature for the transaction
					public func setCounterpartySig(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = Signature(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.danglingClone().cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKHolderCommitmentTransaction>) in
				HolderCommitmentTransaction_set_counterparty_sig(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// All non-dust counterparty HTLC signatures, in the order they appear in the transaction
					/// 
					/// Returns a copy of the field.
					public func getCounterpartyHtlcSigs() -> [[UInt8]] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.danglingClone().cType!) { (thisPtrPointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
				HolderCommitmentTransaction_get_counterparty_htlc_sigs(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_SignatureZ(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// All non-dust counterparty HTLC signatures, in the order they appear in the transaction
					public func setCounterpartyHtlcSigs(val: [[UInt8]]) {
						// native call variable prep
						
						let valVector = Vec_SignatureZ(array: val).dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.danglingClone().cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKHolderCommitmentTransaction>) in
				HolderCommitmentTransaction_set_counterparty_htlc_sigs(thisPtrPointer, valVector.cType!)
						}
				

						// cleanup
						
						// valVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the HolderCommitmentTransaction
					internal func clone() -> HolderCommitmentTransaction {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
				HolderCommitmentTransaction_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = HolderCommitmentTransaction(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Serialize the HolderCommitmentTransaction object into a byte array which can be read by HolderCommitmentTransaction_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.danglingClone().cType!) { (objPointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
				HolderCommitmentTransaction_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// Read a HolderCommitmentTransaction from a byte array, created by HolderCommitmentTransaction_write
					public class func read(ser: [UInt8]) -> Result_HolderCommitmentTransactionDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser).dangle()
				

						// native method call
						let nativeCallResult = HolderCommitmentTransaction_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_HolderCommitmentTransactionDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Create a new holder transaction with the given counterparty signatures.
					/// The funding keys are used to figure out which signature should go first when building the transaction for broadcast.
					public init(commitmentTx: CommitmentTransaction, counterpartySig: [UInt8], counterpartyHtlcSigs: [[UInt8]], holderFundingKey: [UInt8], counterpartyFundingKey: [UInt8]) {
						// native call variable prep
						
						let counterpartySigPrimitiveWrapper = Signature(value: counterpartySig)
				
						let counterpartyHtlcSigsVector = Vec_SignatureZ(array: counterpartyHtlcSigs).dangle()
				
						let holderFundingKeyPrimitiveWrapper = PublicKey(value: holderFundingKey)
				
						let counterpartyFundingKeyPrimitiveWrapper = PublicKey(value: counterpartyFundingKey)
				

						// native method call
						let nativeCallResult = HolderCommitmentTransaction_new(commitmentTx.dynamicallyDangledClone().cType!, counterpartySigPrimitiveWrapper.cType!, counterpartyHtlcSigsVector.cType!, holderFundingKeyPrimitiveWrapper.cType!, counterpartyFundingKeyPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						counterpartySigPrimitiveWrapper.noOpRetain()
				
						// counterpartyHtlcSigsVector.noOpRetain()
				
						// for elided types, we need this
						holderFundingKeyPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						counterpartyFundingKeyPrimitiveWrapper.noOpRetain()
				

						/*
						// return value (do some wrapping)
						let returnValue = HolderCommitmentTransaction(cType: nativeCallResult)
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
		

					internal func dangle() -> HolderCommitmentTransaction {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> HolderCommitmentTransaction {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> HolderCommitmentTransaction {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> HolderCommitmentTransaction {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> HolderCommitmentTransaction {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing HolderCommitmentTransaction \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing HolderCommitmentTransaction \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		