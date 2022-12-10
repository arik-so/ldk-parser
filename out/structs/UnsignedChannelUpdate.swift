
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// The unsigned part of a channel_update
			public typealias UnsignedChannelUpdate = Bindings.UnsignedChannelUpdate

			extension Bindings {
		

				/// The unsigned part of a channel_update
				public class UnsignedChannelUpdate: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKUnsignedChannelUpdate?

					public init(cType: LDKUnsignedChannelUpdate) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKUnsignedChannelUpdate, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the UnsignedChannelUpdate, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = UnsignedChannelUpdate_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The genesis hash of the blockchain where the channel is to be opened
					public func getChainHash() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_get_chain_hash(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)
						

						return returnValue
					}
		
					/// The genesis hash of the blockchain where the channel is to be opened
					public func setChainHash(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_set_chain_hash(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The short channel ID
					public func getShortChannelId() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_get_short_channel_id(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The short channel ID
					public func setShortChannelId(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_set_short_channel_id(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// A strictly monotonic announcement counter, with gaps allowed, specific to this channel
					public func getTimestamp() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_get_timestamp(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// A strictly monotonic announcement counter, with gaps allowed, specific to this channel
					public func setTimestamp(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_set_timestamp(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Channel flags
					public func getFlags() -> UInt8 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_get_flags(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Channel flags
					public func setFlags(val: UInt8) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_set_flags(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The number of blocks such that if:
					/// `incoming_htlc.cltv_expiry < outgoing_htlc.cltv_expiry + cltv_expiry_delta`
					/// then we need to fail the HTLC backwards. When forwarding an HTLC, cltv_expiry_delta determines
					/// the outgoing HTLC's minimum cltv_expiry value -- so, if an incoming HTLC comes in with a
					/// cltv_expiry of 100000, and the node we're forwarding to has a cltv_expiry_delta value of 10,
					/// then we'll check that the outgoing HTLC's cltv_expiry value is at least 100010 before
					/// forwarding. Note that the HTLC sender is the one who originally sets this value when
					/// constructing the route.
					public func getCltvExpiryDelta() -> UInt16 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_get_cltv_expiry_delta(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The number of blocks such that if:
					/// `incoming_htlc.cltv_expiry < outgoing_htlc.cltv_expiry + cltv_expiry_delta`
					/// then we need to fail the HTLC backwards. When forwarding an HTLC, cltv_expiry_delta determines
					/// the outgoing HTLC's minimum cltv_expiry value -- so, if an incoming HTLC comes in with a
					/// cltv_expiry of 100000, and the node we're forwarding to has a cltv_expiry_delta value of 10,
					/// then we'll check that the outgoing HTLC's cltv_expiry value is at least 100010 before
					/// forwarding. Note that the HTLC sender is the one who originally sets this value when
					/// constructing the route.
					public func setCltvExpiryDelta(val: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_set_cltv_expiry_delta(thisPtrPointer, val)
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
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_get_htlc_minimum_msat(thisPtrPointer)
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
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_set_htlc_minimum_msat(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The maximum HTLC value incoming to sender, in milli-satoshi. Used to be optional.
					public func getHtlcMaximumMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_get_htlc_maximum_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The maximum HTLC value incoming to sender, in milli-satoshi. Used to be optional.
					public func setHtlcMaximumMsat(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_set_htlc_maximum_msat(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The base HTLC fee charged by sender, in milli-satoshi
					public func getFeeBaseMsat() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_get_fee_base_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The base HTLC fee charged by sender, in milli-satoshi
					public func setFeeBaseMsat(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_set_fee_base_msat(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The amount to fee multiplier, in micro-satoshi
					public func getFeeProportionalMillionths() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_get_fee_proportional_millionths(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The amount to fee multiplier, in micro-satoshi
					public func setFeeProportionalMillionths(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_set_fee_proportional_millionths(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Excess data which was signed as a part of the message which we do not (yet) understand how
					/// to decode. This is stored to ensure forward-compatibility as new fields are added to the
					/// lightning gossip
					/// 
					/// Returns a copy of the field.
					public func getExcessData() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_get_excess_data(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// Excess data which was signed as a part of the message which we do not (yet) understand how
					/// to decode. This is stored to ensure forward-compatibility as new fields are added to the
					/// lightning gossip
					public func setExcessData(val: [UInt8]) {
						// native call variable prep
						
						let valVector = Vec_u8Z(array: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_set_excess_data(thisPtrPointer, valVector.cType!)
						}
				

						// cleanup
						
						// valVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new UnsignedChannelUpdate given each field
					public init(chainHashArg: [UInt8], shortChannelIdArg: UInt64, timestampArg: UInt32, flagsArg: UInt8, cltvExpiryDeltaArg: UInt16, htlcMinimumMsatArg: UInt64, htlcMaximumMsatArg: UInt64, feeBaseMsatArg: UInt32, feeProportionalMillionthsArg: UInt32, excessDataArg: [UInt8]) {
						// native call variable prep
						
						let chainHashArgPrimitiveWrapper = ThirtyTwoBytes(value: chainHashArg)
				
						let excessDataArgVector = Vec_u8Z(array: excessDataArg)
				

						// native method call
						let nativeCallResult = UnsignedChannelUpdate_new(chainHashArgPrimitiveWrapper.cType!, shortChannelIdArg, timestampArg, flagsArg, cltvExpiryDeltaArg, htlcMinimumMsatArg, htlcMaximumMsatArg, feeBaseMsatArg, feeProportionalMillionthsArg, excessDataArgVector.cType!)

						// cleanup
						
						// excessDataArgVector.noOpRetain()
				

						/*
						// return value (do some wrapping)
						let returnValue = UnsignedChannelUpdate(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a copy of the UnsignedChannelUpdate
					internal func clone() -> UnsignedChannelUpdate {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = UnsignedChannelUpdate(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two UnsignedChannelUpdates contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the UnsignedChannelUpdate object into a byte array which can be read by UnsignedChannelUpdate_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// Read a UnsignedChannelUpdate from a byte array, created by UnsignedChannelUpdate_write
					public class func read(ser: [UInt8]) -> Result_UnsignedChannelUpdateDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = UnsignedChannelUpdate_read(serPrimitiveWrapper.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_UnsignedChannelUpdateDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle() -> UnsignedChannelUpdate {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> UnsignedChannelUpdate {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					internal func setCFreeability(freeable: Bool) -> UnsignedChannelUpdate {
						self.cType!.is_owned = freeable
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing UnsignedChannelUpdate \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing UnsignedChannelUpdate \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		