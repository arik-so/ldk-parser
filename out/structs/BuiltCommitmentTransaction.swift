
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias BuiltCommitmentTransaction = Bindings.BuiltCommitmentTransaction

			extension Bindings {
		

				/// A pre-built Bitcoin commitment transaction and its txid.
				public class BuiltCommitmentTransaction: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKBuiltCommitmentTransaction?

					public init(pointer: LDKBuiltCommitmentTransaction) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKBuiltCommitmentTransaction, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the BuiltCommitmentTransaction, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = BuiltCommitmentTransaction_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The commitment transaction
					public func getTransaction() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
			BuiltCommitmentTransaction_get_transaction(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Transaction(pointer: nativeCallResult)

						return returnValue
					}
		
					/// The commitment transaction
					public func setTransaction(val: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
			BuiltCommitmentTransaction_set_transaction(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The txid for the commitment transaction.
					/// 
					/// This is provided as a performance optimization, instead of calling transaction.txid()
					/// multiple times.
					public func setTxid(val: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
			BuiltCommitmentTransaction_set_txid(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new BuiltCommitmentTransaction given each field
					public init(transactionArg: [UInt8], txidArg: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = BuiltCommitmentTransaction_new(transactionArg.cType!, txidArg.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = BuiltCommitmentTransaction(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the BuiltCommitmentTransaction
					internal func clone() -> BuiltCommitmentTransaction {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
			BuiltCommitmentTransaction_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = BuiltCommitmentTransaction(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Serialize the BuiltCommitmentTransaction object into a byte array which can be read by BuiltCommitmentTransaction_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
			BuiltCommitmentTransaction_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(pointer: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a BuiltCommitmentTransaction from a byte array, created by BuiltCommitmentTransaction_write
					public class func read(ser: [UInt8]) -> Result_BuiltCommitmentTransactionDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = BuiltCommitmentTransaction_read(ser.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_BuiltCommitmentTransactionDecodeErrorZ(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Get the SIGHASH_ALL sighash value of the transaction.
					/// 
					/// This can be used to verify a signature.
					public func getSighashAll(fundingRedeemscript: [UInt8], channelValueSatoshis: UInt64) -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
			BuiltCommitmentTransaction_get_sighash_all(thisArgPointer, fundingRedeemscript.cType!, channelValueSatoshis)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Sign a transaction, either because we are counter-signing the counterparty's transaction or
					/// because we are about to broadcast a holder transaction.
					public func sign(fundingKey: [UInt8], fundingRedeemscript: [UInt8], channelValueSatoshis: UInt64) -> [UInt8] {
						// native call variable prep
						
						let tupledFundingKey = Bindings.arrayToUInt8Tuple32(array: fundingKey)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
			
						withUnsafePointer(to: tupledFundingKey) { (tupledFundingKeyPointer: UnsafePointer<UInt8Tuple32>) in
			BuiltCommitmentTransaction_sign(thisArgPointer, tupledFundingKeyPointer, fundingRedeemscript.cType!, channelValueSatoshis)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Signature(pointer: nativeCallResult)

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
		

					internal func dangle() -> BuiltCommitmentTransaction {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> BuiltCommitmentTransaction {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing BuiltCommitmentTransaction \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing BuiltCommitmentTransaction \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		