
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias AcceptChannel = Bindings.AcceptChannel

			extension Bindings {
		

				/// An accept_channel message to be sent or received from a peer
				public class AcceptChannel: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKAcceptChannel?

					public init(cType: LDKAcceptChannel) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKAcceptChannel, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the AcceptChannel, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = AcceptChannel_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// A temporary channel ID, until the funding outpoint is announced
					public func setTemporaryChannelId(val: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannel>) in
			AcceptChannel_set_temporary_channel_id(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The threshold below which outputs on transactions broadcast by sender will be omitted
					public func getDustLimitSatoshis() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannel>) in
			AcceptChannel_get_dust_limit_satoshis(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The threshold below which outputs on transactions broadcast by sender will be omitted
					public func setDustLimitSatoshis(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannel>) in
			AcceptChannel_set_dust_limit_satoshis(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The maximum inbound HTLC value in flight towards sender, in milli-satoshi
					public func getMaxHtlcValueInFlightMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannel>) in
			AcceptChannel_get_max_htlc_value_in_flight_msat(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The maximum inbound HTLC value in flight towards sender, in milli-satoshi
					public func setMaxHtlcValueInFlightMsat(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannel>) in
			AcceptChannel_set_max_htlc_value_in_flight_msat(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The minimum value unencumbered by HTLCs for the counterparty to keep in the channel
					public func getChannelReserveSatoshis() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannel>) in
			AcceptChannel_get_channel_reserve_satoshis(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The minimum value unencumbered by HTLCs for the counterparty to keep in the channel
					public func setChannelReserveSatoshis(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannel>) in
			AcceptChannel_set_channel_reserve_satoshis(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The minimum HTLC size incoming to sender, in milli-satoshi
					public func getHtlcMinimumMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannel>) in
			AcceptChannel_get_htlc_minimum_msat(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The minimum HTLC size incoming to sender, in milli-satoshi
					public func setHtlcMinimumMsat(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannel>) in
			AcceptChannel_set_htlc_minimum_msat(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Minimum depth of the funding transaction before the channel is considered open
					public func getMinimumDepth() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannel>) in
			AcceptChannel_get_minimum_depth(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Minimum depth of the funding transaction before the channel is considered open
					public func setMinimumDepth(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannel>) in
			AcceptChannel_set_minimum_depth(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The number of blocks which the counterparty will have to wait to claim on-chain funds if they broadcast a commitment transaction
					public func getToSelfDelay() -> UInt16 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannel>) in
			AcceptChannel_get_to_self_delay(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The number of blocks which the counterparty will have to wait to claim on-chain funds if they broadcast a commitment transaction
					public func setToSelfDelay(val: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannel>) in
			AcceptChannel_set_to_self_delay(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The maximum number of inbound HTLCs towards sender
					public func getMaxAcceptedHtlcs() -> UInt16 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannel>) in
			AcceptChannel_get_max_accepted_htlcs(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The maximum number of inbound HTLCs towards sender
					public func setMaxAcceptedHtlcs(val: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannel>) in
			AcceptChannel_set_max_accepted_htlcs(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The sender's key controlling the funding transaction
					public func getFundingPubkey() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannel>) in
			AcceptChannel_get_funding_pubkey(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult)

						return returnValue
					}
		
					/// The sender's key controlling the funding transaction
					public func setFundingPubkey(val: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannel>) in
			AcceptChannel_set_funding_pubkey(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Used to derive a revocation key for transactions broadcast by counterparty
					public func getRevocationBasepoint() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannel>) in
			AcceptChannel_get_revocation_basepoint(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult)

						return returnValue
					}
		
					/// Used to derive a revocation key for transactions broadcast by counterparty
					public func setRevocationBasepoint(val: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannel>) in
			AcceptChannel_set_revocation_basepoint(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// A payment key to sender for transactions broadcast by counterparty
					public func getPaymentPoint() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannel>) in
			AcceptChannel_get_payment_point(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult)

						return returnValue
					}
		
					/// A payment key to sender for transactions broadcast by counterparty
					public func setPaymentPoint(val: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannel>) in
			AcceptChannel_set_payment_point(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Used to derive a payment key to sender for transactions broadcast by sender
					public func getDelayedPaymentBasepoint() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannel>) in
			AcceptChannel_get_delayed_payment_basepoint(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult)

						return returnValue
					}
		
					/// Used to derive a payment key to sender for transactions broadcast by sender
					public func setDelayedPaymentBasepoint(val: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannel>) in
			AcceptChannel_set_delayed_payment_basepoint(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Used to derive an HTLC payment key to sender for transactions broadcast by counterparty
					public func getHtlcBasepoint() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannel>) in
			AcceptChannel_get_htlc_basepoint(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult)

						return returnValue
					}
		
					/// Used to derive an HTLC payment key to sender for transactions broadcast by counterparty
					public func setHtlcBasepoint(val: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannel>) in
			AcceptChannel_set_htlc_basepoint(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The first to-be-broadcast-by-sender transaction's per commitment point
					public func getFirstPerCommitmentPoint() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannel>) in
			AcceptChannel_get_first_per_commitment_point(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult)

						return returnValue
					}
		
					/// The first to-be-broadcast-by-sender transaction's per commitment point
					public func setFirstPerCommitmentPoint(val: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannel>) in
			AcceptChannel_set_first_per_commitment_point(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The channel type that this channel will represent. If none is set, we derive the channel
					/// type from the intersection of our feature bits with our counterparty's feature bits from
					/// the Init message.
					/// 
					/// This is required to match the equivalent field in [`OpenChannel::channel_type`].
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func getChannelType() -> ChannelTypeFeatures? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannel>) in
			AcceptChannel_get_channel_type(thisPtrPointer)
						}
			

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKChannelTypeFeatures
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						// return value (do some wrapping)
						let returnValue = ChannelTypeFeatures(cType: nativeCallResult)

						return returnValue
					}
		
					/// The channel type that this channel will represent. If none is set, we derive the channel
					/// type from the intersection of our feature bits with our counterparty's feature bits from
					/// the Init message.
					/// 
					/// This is required to match the equivalent field in [`OpenChannel::channel_type`].
					/// 
					/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func setChannelType(val: ChannelTypeFeatures) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannel>) in
			AcceptChannel_set_channel_type(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a copy of the AcceptChannel
					internal func clone() -> AcceptChannel {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKAcceptChannel>) in
			AcceptChannel_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = AcceptChannel(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two AcceptChannels contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKAcceptChannel>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKAcceptChannel>) in
			AcceptChannel_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the AcceptChannel object into a byte array which can be read by AcceptChannel_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKAcceptChannel>) in
			AcceptChannel_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a AcceptChannel from a byte array, created by AcceptChannel_write
					public class func read(ser: [UInt8]) -> Result_AcceptChannelDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = AcceptChannel_read(ser.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_AcceptChannelDecodeErrorZ(cType: nativeCallResult)

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
		

					internal func dangle() -> AcceptChannel {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> AcceptChannel {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing AcceptChannel \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing AcceptChannel \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		