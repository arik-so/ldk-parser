
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Channel parameters which apply to our counterparty. These are split out from [`ChannelDetails`]
			/// to better separate parameters.
			public typealias ChannelCounterparty = Bindings.ChannelCounterparty

			extension Bindings {
		

				/// Channel parameters which apply to our counterparty. These are split out from [`ChannelDetails`]
				/// to better separate parameters.
				public class ChannelCounterparty: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKChannelCounterparty?

					public init(cType: LDKChannelCounterparty) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKChannelCounterparty, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ChannelCounterparty, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelCounterparty_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The node_id of our counterparty
					public func getNodeId() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelCounterparty>) in
				ChannelCounterparty_get_node_id(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// The node_id of our counterparty
					public func setNodeId(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = PublicKey(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelCounterparty>) in
				ChannelCounterparty_set_node_id(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The Features the channel counterparty provided upon last connection.
					/// Useful for routing as it is the most up-to-date copy of the counterparty's features and
					/// many routing-relevant features are present in the init context.
					public func getFeatures() -> InitFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelCounterparty>) in
				ChannelCounterparty_get_features(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = InitFeatures(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// The Features the channel counterparty provided upon last connection.
					/// Useful for routing as it is the most up-to-date copy of the counterparty's features and
					/// many routing-relevant features are present in the init context.
					public func setFeatures(val: InitFeatures) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelCounterparty>) in
				ChannelCounterparty_set_features(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The value, in satoshis, that must always be held in the channel for our counterparty. This
					/// value ensures that if our counterparty broadcasts a revoked state, we can punish them by
					/// claiming at least this value on chain.
					/// 
					/// This value is not included in [`inbound_capacity_msat`] as it can never be spent.
					/// 
					/// [`inbound_capacity_msat`]: ChannelDetails::inbound_capacity_msat
					public func getUnspendablePunishmentReserve() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelCounterparty>) in
				ChannelCounterparty_get_unspendable_punishment_reserve(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The value, in satoshis, that must always be held in the channel for our counterparty. This
					/// value ensures that if our counterparty broadcasts a revoked state, we can punish them by
					/// claiming at least this value on chain.
					/// 
					/// This value is not included in [`inbound_capacity_msat`] as it can never be spent.
					/// 
					/// [`inbound_capacity_msat`]: ChannelDetails::inbound_capacity_msat
					public func setUnspendablePunishmentReserve(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelCounterparty>) in
				ChannelCounterparty_set_unspendable_punishment_reserve(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Information on the fees and requirements that the counterparty requires when forwarding
					/// payments to us through this channel.
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func getForwardingInfo() -> CounterpartyForwardingInfo? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelCounterparty>) in
				ChannelCounterparty_get_forwarding_info(thisPtrPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKCounterpartyForwardingInfo
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						
						// return value (do some wrapping)
						let returnValue = CounterpartyForwardingInfo(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Information on the fees and requirements that the counterparty requires when forwarding
					/// payments to us through this channel.
					/// 
					/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func setForwardingInfo(val: CounterpartyForwardingInfo) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelCounterparty>) in
				ChannelCounterparty_set_forwarding_info(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The smallest value HTLC (in msat) the remote peer will accept, for this channel. This field
					/// is only `None` before we have received either the `OpenChannel` or `AcceptChannel` message
					/// from the remote peer, or for `ChannelCounterparty` objects serialized prior to LDK 0.0.107.
					public func getOutboundHtlcMinimumMsat() -> UInt64? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelCounterparty>) in
				ChannelCounterparty_get_outbound_htlc_minimum_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// The smallest value HTLC (in msat) the remote peer will accept, for this channel. This field
					/// is only `None` before we have received either the `OpenChannel` or `AcceptChannel` message
					/// from the remote peer, or for `ChannelCounterparty` objects serialized prior to LDK 0.0.107.
					public func setOutboundHtlcMinimumMsat(val: UInt64?) {
						// native call variable prep
						
						let valOption = Option_u64Z(some: val).danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelCounterparty>) in
				ChannelCounterparty_set_outbound_htlc_minimum_msat(thisPtrPointer, valOption.cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The largest value HTLC (in msat) the remote peer currently will accept, for this channel.
					public func getOutboundHtlcMaximumMsat() -> UInt64? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelCounterparty>) in
				ChannelCounterparty_get_outbound_htlc_maximum_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// The largest value HTLC (in msat) the remote peer currently will accept, for this channel.
					public func setOutboundHtlcMaximumMsat(val: UInt64?) {
						// native call variable prep
						
						let valOption = Option_u64Z(some: val).danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelCounterparty>) in
				ChannelCounterparty_set_outbound_htlc_maximum_msat(thisPtrPointer, valOption.cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new ChannelCounterparty given each field
					public init(nodeIdArg: [UInt8], featuresArg: InitFeatures, unspendablePunishmentReserveArg: UInt64, forwardingInfoArg: CounterpartyForwardingInfo, outboundHtlcMinimumMsatArg: UInt64?, outboundHtlcMaximumMsatArg: UInt64?) {
						// native call variable prep
						
						let nodeIdArgPrimitiveWrapper = PublicKey(value: nodeIdArg)
				
						let outboundHtlcMinimumMsatArgOption = Option_u64Z(some: outboundHtlcMinimumMsatArg).danglingClone()
				
						let outboundHtlcMaximumMsatArgOption = Option_u64Z(some: outboundHtlcMaximumMsatArg).danglingClone()
				

						// native method call
						let nativeCallResult = ChannelCounterparty_new(nodeIdArgPrimitiveWrapper.cType!, featuresArg.dynamicallyDangledClone().cType!, unspendablePunishmentReserveArg, forwardingInfoArg.dynamicallyDangledClone().cType!, outboundHtlcMinimumMsatArgOption.cType!, outboundHtlcMaximumMsatArgOption.cType!)

						// cleanup
						

						/*
						// return value (do some wrapping)
						let returnValue = ChannelCounterparty(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a copy of the ChannelCounterparty
					internal func clone() -> ChannelCounterparty {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKChannelCounterparty>) in
				ChannelCounterparty_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelCounterparty(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Serialize the ChannelCounterparty object into a byte array which can be read by ChannelCounterparty_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKChannelCounterparty>) in
				ChannelCounterparty_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// Read a ChannelCounterparty from a byte array, created by ChannelCounterparty_write
					public class func read(ser: [UInt8]) -> Result_ChannelCounterpartyDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = ChannelCounterparty_read(serPrimitiveWrapper.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_ChannelCounterpartyDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle() -> ChannelCounterparty {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> ChannelCounterparty {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> ChannelCounterparty {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> ChannelCounterparty {
						self.cType!.is_owned = freeable
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing ChannelCounterparty \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ChannelCounterparty \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		