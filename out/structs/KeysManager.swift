
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Simple KeysInterface implementor that takes a 32-byte seed for use as a BIP 32 extended key
			/// and derives keys from that.
			/// 
			/// Your node_id is seed/0'
			/// ChannelMonitor closes may use seed/1'
			/// Cooperative closes may use seed/2'
			/// The two close keys may be needed to claim on-chain funds!
			/// 
			/// This struct cannot be used for nodes that wish to support receiving phantom payments;
			/// [`PhantomKeysManager`] must be used instead.
			/// 
			/// Note that switching between this struct and [`PhantomKeysManager`] will invalidate any
			/// previously issued invoices and attempts to pay previous invoices will fail.
			public typealias KeysManager = Bindings.KeysManager

			extension Bindings {
		

				/// Simple KeysInterface implementor that takes a 32-byte seed for use as a BIP 32 extended key
				/// and derives keys from that.
				/// 
				/// Your node_id is seed/0'
				/// ChannelMonitor closes may use seed/1'
				/// Cooperative closes may use seed/2'
				/// The two close keys may be needed to claim on-chain funds!
				/// 
				/// This struct cannot be used for nodes that wish to support receiving phantom payments;
				/// [`PhantomKeysManager`] must be used instead.
				/// 
				/// Note that switching between this struct and [`PhantomKeysManager`] will invalidate any
				/// previously issued invoices and attempts to pay previous invoices will fail.
				public class KeysManager: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKKeysManager?

					public init(cType: LDKKeysManager) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKKeysManager, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the KeysManager, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = KeysManager_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a KeysManager from a 32-byte seed. If the seed is in some way biased (eg your
					/// CSRNG is busted) this may panic (but more importantly, you will possibly lose funds).
					/// starting_time isn't strictly required to actually be a time, but it must absolutely,
					/// without a doubt, be unique to this instance. ie if you start multiple times with the same
					/// seed, starting_time must be unique to each run. Thus, the easiest way to achieve this is to
					/// simply use the current time (with very high precision).
					/// 
					/// The seed MUST be backed up safely prior to use so that the keys can be re-created, however,
					/// obviously, starting_time should be unique every time you reload the library - it is only
					/// used to generate new ephemeral key data (which will be stored by the individual channel if
					/// necessary).
					/// 
					/// Note that the seed is required to recover certain on-chain funds independent of
					/// ChannelMonitor data, though a current copy of ChannelMonitor data is also required for any
					/// channel, and some on-chain during-closing funds.
					/// 
					/// Note that until the 0.1 release there is no guarantee of backward compatibility between
					/// versions. Once the library is more fully supported, the docs will be updated to include a
					/// detailed description of the guarantee.
					public init(seed: [UInt8], startingTimeSecs: UInt64, startingTimeNanos: UInt32) {
						// native call variable prep
						
						let tupledSeed = Bindings.arrayToUInt8Tuple32(array: seed)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: tupledSeed) { (tupledSeedPointer: UnsafePointer<UInt8Tuple32>) in
				KeysManager_new(tupledSeedPointer, startingTimeSecs, startingTimeNanos)
						}
				

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = KeysManager(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Derive an old Sign containing per-channel secrets based on a key derivation parameters.
					/// 
					/// Key derivation parameters are accessible through a per-channel secrets
					/// Sign::channel_keys_id and is provided inside DynamicOuputP2WSH in case of
					/// onchain output detection for which a corresponding delayed_payment_key must be derived.
					public func deriveChannelKeys(channelValueSatoshis: UInt64, params: [UInt8]) -> InMemorySigner {
						// native call variable prep
						
						let tupledParams = Bindings.arrayToUInt8Tuple32(array: params)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKKeysManager>) in
				
						withUnsafePointer(to: tupledParams) { (tupledParamsPointer: UnsafePointer<UInt8Tuple32>) in
				KeysManager_derive_channel_keys(thisArgPointer, channelValueSatoshis, tupledParamsPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = InMemorySigner(cType: nativeCallResult, anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Creates a Transaction which spends the given descriptors to the given outputs, plus an
					/// output to the given change destination (if sufficient change value remains). The
					/// transaction will have a feerate, at least, of the given value.
					/// 
					/// Returns `Err(())` if the output value is greater than the input value minus required fee,
					/// if a descriptor was duplicated, or if an output descriptor `script_pubkey`
					/// does not match the one we can spend.
					/// 
					/// We do not enforce that outputs meet the dust limit or that any output scripts are standard.
					/// 
					/// May panic if the `SpendableOutputDescriptor`s were not generated by Channels which used
					/// this KeysManager or one of the `InMemorySigner` created by this KeysManager.
					public func spendSpendableOutputs(descriptors: [SpendableOutputDescriptor], outputs: [TxOut], changeDestinationScript: [UInt8], feerateSatPer_1000Weight: UInt32) -> Result_TransactionNoneZ {
						// native call variable prep
						
						let descriptorsVector = Vec_SpendableOutputDescriptorZ(array: descriptors).dangle()
				
						let outputsVector = Vec_TxOutZ(array: outputs).dangle()
				
						let changeDestinationScriptVector = Vec_u8Z(array: changeDestinationScript).dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKKeysManager>) in
				KeysManager_spend_spendable_outputs(thisArgPointer, descriptorsVector.cType!, outputsVector.cType!, changeDestinationScriptVector.cType!, feerateSatPer_1000Weight)
						}
				

						// cleanup
						
						// descriptorsVector.noOpRetain()
				
						// outputsVector.noOpRetain()
				
						// changeDestinationScriptVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_TransactionNoneZ(cType: nativeCallResult, anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Constructs a new KeysInterface which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned KeysInterface must be freed before this_arg is
					public func asKeysInterface() -> KeysInterface {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKKeysManager>) in
				KeysManager_as_KeysInterface(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedKeysInterface(cType: nativeCallResult, anchor: self).dangle(false)
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> KeysManager {
						self.dangling = shouldDangle
						return self
					}

					
					internal func setCFreeability(freeable: Bool) -> KeysManager {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> KeysManager {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing KeysManager \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing KeysManager \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		