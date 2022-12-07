
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias PhantomKeysManager = Bindings.PhantomKeysManager

			extension Bindings {
		

				/// Similar to [`KeysManager`], but allows the node using this struct to receive phantom node
				/// payments.
				/// 
				/// A phantom node payment is a payment made to a phantom invoice, which is an invoice that can be
				/// paid to one of multiple nodes. This works because we encode the invoice route hints such that
				/// LDK will recognize an incoming payment as destined for a phantom node, and collect the payment
				/// itself without ever needing to forward to this fake node.
				/// 
				/// Phantom node payments are useful for load balancing between multiple LDK nodes. They also
				/// provide some fault tolerance, because payers will automatically retry paying other provided
				/// nodes in the case that one node goes down.
				/// 
				/// Note that multi-path payments are not supported in phantom invoices for security reasons.
				/// Switching between this struct and [`KeysManager`] will invalidate any previously issued
				/// invoices and attempts to pay previous invoices will fail.
				public class PhantomKeysManager: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPhantomKeysManager?

					public init(cType: LDKPhantomKeysManager) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKPhantomKeysManager, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the PhantomKeysManager, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PhantomKeysManager_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new KeysInterface which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned KeysInterface must be freed before this_arg is
					public func asKeysInterface() -> KeysInterface {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKPhantomKeysManager>) in
			PhantomKeysManager_as_KeysInterface(thisArgPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = NativelyImplementedKeysInterface(cType: nativeCallResult, anchor: self)

						return returnValue
					}
		
					/// Constructs a `PhantomKeysManager` given a 32-byte seed and an additional `cross_node_seed`
					/// that is shared across all nodes that intend to participate in [phantom node payments] together.
					/// 
					/// See [`KeysManager::new`] for more information on `seed`, `starting_time_secs`, and
					/// `starting_time_nanos`.
					/// 
					/// `cross_node_seed` must be the same across all phantom payment-receiving nodes and also the
					/// same across restarts, or else inbound payments may fail.
					/// 
					/// [phantom node payments]: PhantomKeysManager
					public init(seed: [UInt8], startingTimeSecs: UInt64, startingTimeNanos: UInt32, crossNodeSeed: [UInt8]) {
						// native call variable prep
						
						let tupledSeed = Bindings.arrayToUInt8Tuple32(array: seed)
					
						let tupledCrossNodeSeed = Bindings.arrayToUInt8Tuple32(array: crossNodeSeed)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: tupledSeed) { (tupledSeedPointer: UnsafePointer<UInt8Tuple32>) in
			
						withUnsafePointer(to: tupledCrossNodeSeed) { (tupledCrossNodeSeedPointer: UnsafePointer<UInt8Tuple32>) in
			PhantomKeysManager_new(tupledSeedPointer, startingTimeSecs, startingTimeNanos, tupledCrossNodeSeedPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PhantomKeysManager(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// See [`KeysManager::spend_spendable_outputs`] for documentation on this method.
					public func spendSpendableOutputs(descriptors: [SpendableOutputDescriptor], outputs: [TxOut], changeDestinationScript: [UInt8], feerateSatPer_1000Weight: UInt32) -> Result_TransactionNoneZ {
						// native call variable prep
						
						let descriptorsVector = Vec_SpendableOutputDescriptorZ(array: descriptors)
				
						let outputsVector = Vec_TxOutZ(array: outputs)
				
						let changeDestinationScriptVector = Vec_u8Z(array: changeDestinationScript)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKPhantomKeysManager>) in
			PhantomKeysManager_spend_spendable_outputs(thisArgPointer, descriptorsVector.cType!, outputsVector.cType!, changeDestinationScriptVector.cType!, feerateSatPer_1000Weight)
						}
			

						// cleanup
						
						descriptorsVector.noOpRetain()
				
						outputsVector.noOpRetain()
				
						changeDestinationScriptVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_TransactionNoneZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// See [`KeysManager::derive_channel_keys`] for documentation on this method.
					public func deriveChannelKeys(channelValueSatoshis: UInt64, params: [UInt8]) -> InMemorySigner {
						// native call variable prep
						
						let tupledParams = Bindings.arrayToUInt8Tuple32(array: params)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKPhantomKeysManager>) in
			
						withUnsafePointer(to: tupledParams) { (tupledParamsPointer: UnsafePointer<UInt8Tuple32>) in
			PhantomKeysManager_derive_channel_keys(thisArgPointer, channelValueSatoshis, tupledParamsPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = InMemorySigner(cType: nativeCallResult)

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
		

					internal func dangle() -> PhantomKeysManager {
						self.dangling = true
						return self
					}

					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing PhantomKeysManager \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing PhantomKeysManager \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		