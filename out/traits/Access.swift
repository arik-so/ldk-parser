
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Access = Bindings.Access

			extension Bindings {

				/// The `Access` trait defines behavior for accessing chain data and state, such as blocks and
				/// UTXOs.
				open class Access: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKAccess?

					public init(pointer: LDKAccess) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKAccess, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init() {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func getUtxoLambda(this_arg: UnsafeRawPointer?, genesis_hash: UnsafePointer<UInt8Tuple32>?, short_channel_id: UInt64) -> LDKCResult_TxOutAccessErrorZ {
							let instance: Access = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Access::getUtxoLambda")

							// Swift callback variable prep
							
							var genesis_hashPointee: UInt8Tuple32? = nil
							if let genesis_hashUnwrapped = genesis_hash {
								genesis_hashPointee = Bindings.UInt8Tuple32ToArray(tuple: genesis_hashUnwrapped.pointee)
							}
						

							// Swift callback call
							let swiftCallbackResult = instance.getUtxo(genesisHash: genesis_hashPointee, shortChannelId: short_channel_id)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: Access = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Access::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKAccess(							
							this_arg: thisArg,
							get_utxo: getUtxoLambda,
							free: freeLambda
						)

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Returns the transaction output of a funding transaction encoded by [`short_channel_id`].
					/// Returns an error if `genesis_hash` is for a different chain or if such a transaction output
					/// is unknown.
					/// 
					/// [`short_channel_id`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#definition-of-short_channel_id
					open func getUtxo(genesisHash: [UInt8], shortChannelId: UInt64) -> Result_TxOutAccessErrorZ {
						Bindings.print("Error: Access::getUtxo MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					open func free() -> Void {
						Bindings.print("Error: Access::free MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					
					/// Calls the free function if one is set
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Access_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					

					internal func dangle() -> Access {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Access \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Access \(self.instanceNumber) due to dangle.")
						}
					}
				}

				public class NativelyImplementedAccess: Access {
					
					/// Returns the transaction output of a funding transaction encoded by [`short_channel_id`].
					/// Returns an error if `genesis_hash` is for a different chain or if such a transaction output
					/// is unknown.
					/// 
					/// [`short_channel_id`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#definition-of-short_channel_id
					public func getUtxo(genesisHash: [UInt8]?, shortChannelId: UInt64) -> Result_TxOutAccessErrorZ {
						// native call variable prep
						
						let tupledGenesisHash = Bindings.arrayToUInt8Tuple32(array: genesisHash)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: tupledGenesisHash) { (tupledGenesisHashPointer: UnsafePointer<UInt8Tuple32>) in
			self.cType!.get_utxo(self.cType!.this_arg, tupledGenesisHashPointer, shortChannelId)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_TxOutAccessErrorZ(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					public func free() {
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
		