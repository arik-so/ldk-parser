
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// This class tracks the per-transaction information needed to build a closing transaction and will
			/// actually build it and sign.
			/// 
			/// This class can be used inside a signer implementation to generate a signature given the relevant
			/// secret key.
			public typealias ClosingTransaction = Bindings.ClosingTransaction

			extension Bindings {
		

				/// This class tracks the per-transaction information needed to build a closing transaction and will
				/// actually build it and sign.
				/// 
				/// This class can be used inside a signer implementation to generate a signature given the relevant
				/// secret key.
				public class ClosingTransaction: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKClosingTransaction?

					public init(cType: LDKClosingTransaction) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKClosingTransaction, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ClosingTransaction, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ClosingTransaction_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the ClosingTransaction
					internal func clone() -> ClosingTransaction {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKClosingTransaction>) in
				ClosingTransaction_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ClosingTransaction(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two ClosingTransactions contain equal inner contents.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKClosingTransaction>) in
				ClosingTransaction_hash(oPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if two ClosingTransactions contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKClosingTransaction>) in
				
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKClosingTransaction>) in
				ClosingTransaction_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Construct an object of the class
					public init(toHolderValueSat: UInt64, toCounterpartyValueSat: UInt64, toHolderScript: [UInt8], toCounterpartyScript: [UInt8], fundingOutpoint: OutPoint) {
						// native call variable prep
						
						let toHolderScriptVector = Vec_u8Z(array: toHolderScript)
				
						let toCounterpartyScriptVector = Vec_u8Z(array: toCounterpartyScript)
				

						// native method call
						let nativeCallResult = ClosingTransaction_new(toHolderValueSat, toCounterpartyValueSat, toHolderScriptVector.cType!, toCounterpartyScriptVector.cType!, fundingOutpoint.cType!)

						// cleanup
						
						// toHolderScriptVector.noOpRetain()
				
						// toCounterpartyScriptVector.noOpRetain()
				

						/*
						// return value (do some wrapping)
						let returnValue = ClosingTransaction(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Trust our pre-built transaction.
					/// 
					/// Applies a wrapper which allows access to the transaction.
					/// 
					/// This should only be used if you fully trust the builder of this object. It should not
					/// be used by an external signer - instead use the verify function.
					public func trust() -> TrustedClosingTransaction {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKClosingTransaction>) in
				ClosingTransaction_trust(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = TrustedClosingTransaction(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Verify our pre-built transaction.
					/// 
					/// Applies a wrapper which allows access to the transaction.
					/// 
					/// An external validating signer must call this method before signing
					/// or using the built transaction.
					public func verify(fundingOutpoint: OutPoint) -> Result_TrustedClosingTransactionNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKClosingTransaction>) in
				ClosingTransaction_verify(thisArgPointer, fundingOutpoint.cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_TrustedClosingTransactionNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// The value to be sent to the holder, or zero if the output will be omitted
					public func toHolderValueSat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKClosingTransaction>) in
				ClosingTransaction_to_holder_value_sat(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The value to be sent to the counterparty, or zero if the output will be omitted
					public func toCounterpartyValueSat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKClosingTransaction>) in
				ClosingTransaction_to_counterparty_value_sat(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The destination of the holder's output
					public func toHolderScript() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKClosingTransaction>) in
				ClosingTransaction_to_holder_script(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = u8slice(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// The destination of the counterparty's output
					public func toCounterpartyScript() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKClosingTransaction>) in
				ClosingTransaction_to_counterparty_script(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = u8slice(cType: nativeCallResult).getValue()
						

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
		

					internal func dangle() -> ClosingTransaction {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> ClosingTransaction {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing ClosingTransaction \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ClosingTransaction \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		