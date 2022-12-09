
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A wrapper on CommitmentTransaction indicating that the derived fields (the built bitcoin
			/// transaction and the transaction creation keys) are trusted.
			/// 
			/// See trust() and verify() functions on CommitmentTransaction.
			/// 
			/// This structure implements Deref.
			public typealias TrustedCommitmentTransaction = Bindings.TrustedCommitmentTransaction

			extension Bindings {
		

				/// A wrapper on CommitmentTransaction indicating that the derived fields (the built bitcoin
				/// transaction and the transaction creation keys) are trusted.
				/// 
				/// See trust() and verify() functions on CommitmentTransaction.
				/// 
				/// This structure implements Deref.
				public class TrustedCommitmentTransaction: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKTrustedCommitmentTransaction?

					public init(cType: LDKTrustedCommitmentTransaction) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKTrustedCommitmentTransaction, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the TrustedCommitmentTransaction, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = TrustedCommitmentTransaction_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The transaction ID of the built Bitcoin transaction
					public func txid() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
				TrustedCommitmentTransaction_txid(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// The pre-built Bitcoin commitment transaction
					public func builtTransaction() -> BuiltCommitmentTransaction {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
				TrustedCommitmentTransaction_built_transaction(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = BuiltCommitmentTransaction(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// The pre-calculated transaction creation public keys.
					public func keys() -> TxCreationKeys {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
				TrustedCommitmentTransaction_keys(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = TxCreationKeys(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Should anchors be used.
					public func optAnchors() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
				TrustedCommitmentTransaction_opt_anchors(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Get a signature for each HTLC which was included in the commitment transaction (ie for
					/// which HTLCOutputInCommitment::transaction_output_index.is_some()).
					/// 
					/// The returned Vec has one entry for each HTLC, and in the same order.
					/// 
					/// This function is only valid in the holder commitment context, it always uses EcdsaSighashType::All.
					public func getHtlcSigs(htlcBaseKey: [UInt8], channelParameters: DirectedChannelTransactionParameters) -> Result_CVec_SignatureZNoneZ {
						// native call variable prep
						
						let tupledHtlcBaseKey = Bindings.arrayToUInt8Tuple32(array: htlcBaseKey)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
				
						withUnsafePointer(to: tupledHtlcBaseKey) { (tupledHtlcBaseKeyPointer: UnsafePointer<UInt8Tuple32>) in
				
						withUnsafePointer(to: channelParameters.cType!) { (channelParametersPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
				TrustedCommitmentTransaction_get_htlc_sigs(thisArgPointer, tupledHtlcBaseKeyPointer, channelParametersPointer)
						}
				
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_CVec_SignatureZNoneZ(cType: nativeCallResult)
						

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
		

					internal func dangle() -> TrustedCommitmentTransaction {
						self.dangling = true
						return self
					}

					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing TrustedCommitmentTransaction \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing TrustedCommitmentTransaction \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		