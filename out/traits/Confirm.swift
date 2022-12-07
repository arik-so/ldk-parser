
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Confirm = Bindings.Confirm

			extension Bindings {

				/// The `Confirm` trait is used to notify when transactions have been confirmed on chain or
				/// unconfirmed during a chain reorganization.
				/// 
				/// Clients sourcing chain data using a transaction-oriented API should prefer this interface over
				/// [`Listen`]. For instance, an Electrum client may implement [`Filter`] by subscribing to activity
				/// related to registered transactions and outputs. Upon notification, it would pass along the
				/// matching transactions using this interface.
				/// 
				/// # Use
				/// 
				/// The intended use is as follows:
				/// - Call [`transactions_confirmed`] to process any on-chain activity of interest.
				/// - Call [`transaction_unconfirmed`] to process any transaction returned by [`get_relevant_txids`]
				/// that has been reorganized out of the chain.
				/// - Call [`best_block_updated`] whenever a new chain tip becomes available.
				/// 
				/// # Order
				/// 
				/// Clients must call these methods in chain order. Specifically:
				/// - Transactions confirmed in a block must be given before transactions confirmed in a later
				/// block.
				/// - Dependent transactions within the same block must be given in topological order, possibly in
				/// separate calls.
				/// - Unconfirmed transactions must be given after the original confirmations and before any
				/// reconfirmation.
				/// 
				/// See individual method documentation for further details.
				/// 
				/// [`transactions_confirmed`]: Self::transactions_confirmed
				/// [`transaction_unconfirmed`]: Self::transaction_unconfirmed
				/// [`best_block_updated`]: Self::best_block_updated
				/// [`get_relevant_txids`]: Self::get_relevant_txids
				open class Confirm: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKConfirm?

					public init(cType: LDKConfirm) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKConfirm, anchor: NativeTypeWrapper) {
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

						

						
						func transactionsConfirmedLambda(this_arg: UnsafeRawPointer?, header: UnsafePointer<UInt8Tuple80>?, txdata: LDKCVec_C2Tuple_usizeTransactionZZ, height: UInt32) -> Void {
							let instance: Confirm = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Confirm::transactionsConfirmedLambda")

							// Swift callback variable prep
							
							var headerPointee: UInt8Tuple80? = nil
							if let headerUnwrapped = header {
								headerPointee = Bindings.UInt8Tuple80ToArray(tuple: headerUnwrapped.pointee)
							}
						

							// Swift callback call
							let swiftCallbackResult = instance.transactionsConfirmed(header: headerPointee, txdata: Vec_C2Tuple_usizeTransactionZZ(cType: txdata).getValue(), height: height)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func transactionUnconfirmedLambda(this_arg: UnsafeRawPointer?, txid: UnsafePointer<UInt8Tuple32>?) -> Void {
							let instance: Confirm = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Confirm::transactionUnconfirmedLambda")

							// Swift callback variable prep
							
							var txidPointee: UInt8Tuple32? = nil
							if let txidUnwrapped = txid {
								txidPointee = Bindings.UInt8Tuple32ToArray(tuple: txidUnwrapped.pointee)
							}
						

							// Swift callback call
							let swiftCallbackResult = instance.transactionUnconfirmed(txid: txidPointee)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func bestBlockUpdatedLambda(this_arg: UnsafeRawPointer?, header: UnsafePointer<UInt8Tuple80>?, height: UInt32) -> Void {
							let instance: Confirm = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Confirm::bestBlockUpdatedLambda")

							// Swift callback variable prep
							
							var headerPointee: UInt8Tuple80? = nil
							if let headerUnwrapped = header {
								headerPointee = Bindings.UInt8Tuple80ToArray(tuple: headerUnwrapped.pointee)
							}
						

							// Swift callback call
							let swiftCallbackResult = instance.bestBlockUpdated(header: headerPointee, height: height)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func getRelevantTxidsLambda(this_arg: UnsafeRawPointer?) -> LDKCVec_TxidZ {
							let instance: Confirm = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Confirm::getRelevantTxidsLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.getRelevantTxids()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: Confirm = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Confirm::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKConfirm(							
							this_arg: thisArg,
							transactions_confirmed: transactionsConfirmedLambda,
							transaction_unconfirmed: transactionUnconfirmedLambda,
							best_block_updated: bestBlockUpdatedLambda,
							get_relevant_txids: getRelevantTxidsLambda,
							free: freeLambda
						)

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Processes transactions confirmed in a block with a given header and height.
					/// 
					/// Should be called for any transactions registered by [`Filter::register_tx`] or any
					/// transactions spending an output registered by [`Filter::register_output`]. Such transactions
					/// appearing in the same block do not need to be included in the same call; instead, multiple
					/// calls with additional transactions may be made so long as they are made in [chain order].
					/// 
					/// May be called before or after [`best_block_updated`] for the corresponding block. However,
					/// in the event of a chain reorganization, it must not be called with a `header` that is no
					/// longer in the chain as of the last call to [`best_block_updated`].
					/// 
					/// [chain order]: Confirm#order
					/// [`best_block_updated`]: Self::best_block_updated
					open func transactionsConfirmed(header: [UInt8], txdata: [(UInt, [UInt8])], height: UInt32) -> Void {
						Bindings.print("Error: Confirm::transactionsConfirmed MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Processes a transaction that is no longer confirmed as result of a chain reorganization.
					/// 
					/// Should be called for any transaction returned by [`get_relevant_txids`] if it has been
					/// reorganized out of the best chain. Once called, the given transaction will not be returned
					/// by [`get_relevant_txids`], unless it has been reconfirmed via [`transactions_confirmed`].
					/// 
					/// [`get_relevant_txids`]: Self::get_relevant_txids
					/// [`transactions_confirmed`]: Self::transactions_confirmed
					open func transactionUnconfirmed(txid: [UInt8]) -> Void {
						Bindings.print("Error: Confirm::transactionUnconfirmed MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Processes an update to the best header connected at the given height.
					/// 
					/// Should be called when a new header is available but may be skipped for intermediary blocks
					/// if they become available at the same time.
					open func bestBlockUpdated(header: [UInt8], height: UInt32) -> Void {
						Bindings.print("Error: Confirm::bestBlockUpdated MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Returns transactions that should be monitored for reorganization out of the chain.
					/// 
					/// Will include any transactions passed to [`transactions_confirmed`] that have insufficient
					/// confirmations to be safe from a chain reorganization. Will not include any transactions
					/// passed to [`transaction_unconfirmed`], unless later reconfirmed.
					/// 
					/// May be called to determine the subset of transactions that must still be monitored for
					/// reorganization. Will be idempotent between calls but may change as a result of calls to the
					/// other interface methods. Thus, this is useful to determine which transactions may need to be
					/// given to [`transaction_unconfirmed`].
					/// 
					/// [`transactions_confirmed`]: Self::transactions_confirmed
					/// [`transaction_unconfirmed`]: Self::transaction_unconfirmed
					open func getRelevantTxids() -> [[UInt8]] {
						Bindings.print("Error: Confirm::getRelevantTxids MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					open func free() -> Void {
						Bindings.print("Error: Confirm::free MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					
					/// Calls the free function if one is set
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Confirm_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					

					internal func dangle() -> Confirm {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Confirm \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Confirm \(self.instanceNumber) due to dangle.")
						}
					}
				}

				public class NativelyImplementedConfirm: Confirm {
					
					/// Processes transactions confirmed in a block with a given header and height.
					/// 
					/// Should be called for any transactions registered by [`Filter::register_tx`] or any
					/// transactions spending an output registered by [`Filter::register_output`]. Such transactions
					/// appearing in the same block do not need to be included in the same call; instead, multiple
					/// calls with additional transactions may be made so long as they are made in [chain order].
					/// 
					/// May be called before or after [`best_block_updated`] for the corresponding block. However,
					/// in the event of a chain reorganization, it must not be called with a `header` that is no
					/// longer in the chain as of the last call to [`best_block_updated`].
					/// 
					/// [chain order]: Confirm#order
					/// [`best_block_updated`]: Self::best_block_updated
					override func transactionsConfirmed(header: [UInt8]?, txdata: [(UInt, [UInt8])], height: UInt32) {
						// native call variable prep
						
						let tupledHeader = Bindings.arrayToUInt8Tuple80(array: header)
					
						let txdataVector = Vec_C2Tuple_usizeTransactionZZ(array: txdata)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: tupledHeader) { (tupledHeaderPointer: UnsafePointer<UInt8Tuple80>) in
			self.cType!.transactions_confirmed(self.cType!.this_arg, tupledHeaderPointer, txdataVector.cType!, height)
						}
			

						// cleanup
						
						txdataVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Processes a transaction that is no longer confirmed as result of a chain reorganization.
					/// 
					/// Should be called for any transaction returned by [`get_relevant_txids`] if it has been
					/// reorganized out of the best chain. Once called, the given transaction will not be returned
					/// by [`get_relevant_txids`], unless it has been reconfirmed via [`transactions_confirmed`].
					/// 
					/// [`get_relevant_txids`]: Self::get_relevant_txids
					/// [`transactions_confirmed`]: Self::transactions_confirmed
					override func transactionUnconfirmed(txid: [UInt8]?) {
						// native call variable prep
						
						let tupledTxid = Bindings.arrayToUInt8Tuple32(array: txid)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: tupledTxid) { (tupledTxidPointer: UnsafePointer<UInt8Tuple32>) in
			self.cType!.transaction_unconfirmed(self.cType!.this_arg, tupledTxidPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Processes an update to the best header connected at the given height.
					/// 
					/// Should be called when a new header is available but may be skipped for intermediary blocks
					/// if they become available at the same time.
					override func bestBlockUpdated(header: [UInt8]?, height: UInt32) {
						// native call variable prep
						
						let tupledHeader = Bindings.arrayToUInt8Tuple80(array: header)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: tupledHeader) { (tupledHeaderPointer: UnsafePointer<UInt8Tuple80>) in
			self.cType!.best_block_updated(self.cType!.this_arg, tupledHeaderPointer, height)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Returns transactions that should be monitored for reorganization out of the chain.
					/// 
					/// Will include any transactions passed to [`transactions_confirmed`] that have insufficient
					/// confirmations to be safe from a chain reorganization. Will not include any transactions
					/// passed to [`transaction_unconfirmed`], unless later reconfirmed.
					/// 
					/// May be called to determine the subset of transactions that must still be monitored for
					/// reorganization. Will be idempotent between calls but may change as a result of calls to the
					/// other interface methods. Thus, this is useful to determine which transactions may need to be
					/// given to [`transaction_unconfirmed`].
					/// 
					/// [`transactions_confirmed`]: Self::transactions_confirmed
					/// [`transaction_unconfirmed`]: Self::transaction_unconfirmed
					override func getRelevantTxids() -> [[UInt8]] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.get_relevant_txids(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_TxidZ(cType: nativeCallResult).getValue()

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
		