
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias ChannelUpdateInfo = Bindings.ChannelUpdateInfo

			extension Bindings {
		

				/// Details about one direction of a channel as received within a [`ChannelUpdate`].
				public class ChannelUpdateInfo: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKChannelUpdateInfo?

					public init(cType: LDKChannelUpdateInfo) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKChannelUpdateInfo, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ChannelUpdateInfo, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelUpdateInfo_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// When the last update to the channel direction was issued.
					/// Value is opaque, as set in the announcement.
					public func getLastUpdate() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelUpdateInfo>) in
			ChannelUpdateInfo_get_last_update(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// When the last update to the channel direction was issued.
					/// Value is opaque, as set in the announcement.
					public func setLastUpdate(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelUpdateInfo>) in
			ChannelUpdateInfo_set_last_update(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Whether the channel can be currently used for payments (in this one direction).
					public func getEnabled() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelUpdateInfo>) in
			ChannelUpdateInfo_get_enabled(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Whether the channel can be currently used for payments (in this one direction).
					public func setEnabled(val: Bool) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelUpdateInfo>) in
			ChannelUpdateInfo_set_enabled(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The difference in CLTV values that you must have when routing through this channel.
					public func getCltvExpiryDelta() -> UInt16 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelUpdateInfo>) in
			ChannelUpdateInfo_get_cltv_expiry_delta(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The difference in CLTV values that you must have when routing through this channel.
					public func setCltvExpiryDelta(val: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelUpdateInfo>) in
			ChannelUpdateInfo_set_cltv_expiry_delta(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The minimum value, which must be relayed to the next hop via the channel
					public func getHtlcMinimumMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelUpdateInfo>) in
			ChannelUpdateInfo_get_htlc_minimum_msat(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The minimum value, which must be relayed to the next hop via the channel
					public func setHtlcMinimumMsat(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelUpdateInfo>) in
			ChannelUpdateInfo_set_htlc_minimum_msat(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The maximum value which may be relayed to the next hop via the channel.
					public func getHtlcMaximumMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelUpdateInfo>) in
			ChannelUpdateInfo_get_htlc_maximum_msat(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The maximum value which may be relayed to the next hop via the channel.
					public func setHtlcMaximumMsat(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelUpdateInfo>) in
			ChannelUpdateInfo_set_htlc_maximum_msat(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Fees charged when the channel is used for routing
					public func getFees() -> RoutingFees {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelUpdateInfo>) in
			ChannelUpdateInfo_get_fees(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = RoutingFees(cType: nativeCallResult)

						return returnValue
					}
		
					/// Fees charged when the channel is used for routing
					public func setFees(val: RoutingFees) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelUpdateInfo>) in
			ChannelUpdateInfo_set_fees(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Most recent update for the channel received from the network
					/// Mostly redundant with the data we store in fields explicitly.
					/// Everything else is useful only for sending out for initial routing sync.
					/// Not stored if contains excess data to prevent DoS.
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func getLastUpdateMessage() -> ChannelUpdate? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelUpdateInfo>) in
			ChannelUpdateInfo_get_last_update_message(thisPtrPointer)
						}
			

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKChannelUpdate
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						// return value (do some wrapping)
						let returnValue = ChannelUpdate(cType: nativeCallResult)

						return returnValue
					}
		
					/// Most recent update for the channel received from the network
					/// Mostly redundant with the data we store in fields explicitly.
					/// Everything else is useful only for sending out for initial routing sync.
					/// Not stored if contains excess data to prevent DoS.
					/// 
					/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func setLastUpdateMessage(val: ChannelUpdate) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelUpdateInfo>) in
			ChannelUpdateInfo_set_last_update_message(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new ChannelUpdateInfo given each field
					public init(lastUpdateArg: UInt32, enabledArg: Bool, cltvExpiryDeltaArg: UInt16, htlcMinimumMsatArg: UInt64, htlcMaximumMsatArg: UInt64, feesArg: RoutingFees, lastUpdateMessageArg: ChannelUpdate) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelUpdateInfo_new(lastUpdateArg, enabledArg, cltvExpiryDeltaArg, htlcMinimumMsatArg, htlcMaximumMsatArg, feesArg.cType!, lastUpdateMessageArg.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ChannelUpdateInfo(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the ChannelUpdateInfo
					internal func clone() -> ChannelUpdateInfo {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKChannelUpdateInfo>) in
			ChannelUpdateInfo_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ChannelUpdateInfo(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two ChannelUpdateInfos contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKChannelUpdateInfo>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKChannelUpdateInfo>) in
			ChannelUpdateInfo_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the ChannelUpdateInfo object into a byte array which can be read by ChannelUpdateInfo_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKChannelUpdateInfo>) in
			ChannelUpdateInfo_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a ChannelUpdateInfo from a byte array, created by ChannelUpdateInfo_write
					public class func read(ser: [UInt8]) -> Result_ChannelUpdateInfoDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = ChannelUpdateInfo_read(serPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_ChannelUpdateInfoDecodeErrorZ(cType: nativeCallResult)

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
		

					internal func dangle() -> ChannelUpdateInfo {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> ChannelUpdateInfo {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing ChannelUpdateInfo \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ChannelUpdateInfo \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		