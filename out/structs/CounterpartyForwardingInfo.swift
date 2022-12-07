
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias CounterpartyForwardingInfo = Bindings.CounterpartyForwardingInfo

			extension Bindings {
		

				/// Information needed for constructing an invoice route hint for this channel.
				public class CounterpartyForwardingInfo: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCounterpartyForwardingInfo?

					public init(cType: LDKCounterpartyForwardingInfo) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCounterpartyForwardingInfo, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the CounterpartyForwardingInfo, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CounterpartyForwardingInfo_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Base routing fee in millisatoshis.
					public func getFeeBaseMsat() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCounterpartyForwardingInfo>) in
			CounterpartyForwardingInfo_get_fee_base_msat(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Base routing fee in millisatoshis.
					public func setFeeBaseMsat(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKCounterpartyForwardingInfo>) in
			CounterpartyForwardingInfo_set_fee_base_msat(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Amount in millionths of a satoshi the channel will charge per transferred satoshi.
					public func getFeeProportionalMillionths() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCounterpartyForwardingInfo>) in
			CounterpartyForwardingInfo_get_fee_proportional_millionths(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Amount in millionths of a satoshi the channel will charge per transferred satoshi.
					public func setFeeProportionalMillionths(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKCounterpartyForwardingInfo>) in
			CounterpartyForwardingInfo_set_fee_proportional_millionths(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The minimum difference in cltv_expiry between an ingoing HTLC and its outgoing counterpart,
					/// such that the outgoing HTLC is forwardable to this counterparty. See `msgs::ChannelUpdate`'s
					/// `cltv_expiry_delta` for more details.
					public func getCltvExpiryDelta() -> UInt16 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCounterpartyForwardingInfo>) in
			CounterpartyForwardingInfo_get_cltv_expiry_delta(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The minimum difference in cltv_expiry between an ingoing HTLC and its outgoing counterpart,
					/// such that the outgoing HTLC is forwardable to this counterparty. See `msgs::ChannelUpdate`'s
					/// `cltv_expiry_delta` for more details.
					public func setCltvExpiryDelta(val: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKCounterpartyForwardingInfo>) in
			CounterpartyForwardingInfo_set_cltv_expiry_delta(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new CounterpartyForwardingInfo given each field
					public init(feeBaseMsatArg: UInt32, feeProportionalMillionthsArg: UInt32, cltvExpiryDeltaArg: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CounterpartyForwardingInfo_new(feeBaseMsatArg, feeProportionalMillionthsArg, cltvExpiryDeltaArg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = CounterpartyForwardingInfo(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the CounterpartyForwardingInfo
					internal func clone() -> CounterpartyForwardingInfo {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCounterpartyForwardingInfo>) in
			CounterpartyForwardingInfo_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = CounterpartyForwardingInfo(cType: nativeCallResult)

						return returnValue
					}
		
					/// Serialize the CounterpartyForwardingInfo object into a byte array which can be read by CounterpartyForwardingInfo_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKCounterpartyForwardingInfo>) in
			CounterpartyForwardingInfo_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a CounterpartyForwardingInfo from a byte array, created by CounterpartyForwardingInfo_write
					public class func read(ser: [UInt8]) -> Result_CounterpartyForwardingInfoDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CounterpartyForwardingInfo_read(ser.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_CounterpartyForwardingInfoDecodeErrorZ(cType: nativeCallResult)

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
		

					internal func dangle() -> CounterpartyForwardingInfo {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> CounterpartyForwardingInfo {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing CounterpartyForwardingInfo \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing CounterpartyForwardingInfo \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		