
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias HTLCDestination = Bindings.HTLCDestination

			extension Bindings {

				/// Intended destination of a failed HTLC as indicated in [`Event::HTLCHandlingFailed`].
				public class HTLCDestination: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKHTLCDestination?

					public init(cType: LDKHTLCDestination) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKHTLCDestination, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum HTLCDestinationType {
						
						/// We tried forwarding to a channel but failed to do so. An example of such an instance is when
						/// there is insufficient capacity in our outbound channel.
						case NextHopChannel
			
						/// Scenario where we are unsure of the next node to forward the HTLC to.
						case UnknownNextHop
			
						/// Failure scenario where an HTLC may have been forwarded to be intended for us,
						/// but is invalid for some reason, so we reject it.
						/// 
						/// Some of the reasons may include:
						/// * HTLC Timeouts
						/// * Expected MPP amount to claim does not equal HTLC total
						/// * Claimable amount does not match expected amount
						case FailedPayment
			
					}

					public func getValueType() -> HTLCDestinationType? {
						switch self.cType!.tag {
							case LDKHTLCDestination_NextHopChannel:
								return .NextHopChannel
			
							case LDKHTLCDestination_UnknownNextHop:
								return .UnknownNextHop
			
							case LDKHTLCDestination_FailedPayment:
								return .FailedPayment
			
							default:
								return nil
						}
		
					}

					
					/// Frees any resources used by the HTLCDestination
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = HTLCDestination_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a copy of the HTLCDestination
					internal func clone() -> HTLCDestination {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKHTLCDestination>) in
			HTLCDestination_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = HTLCDestination(cType: nativeCallResult)

						return returnValue
					}
		
					/// Utility method to constructs a new NextHopChannel-variant HTLCDestination
					public init(nodeId: [UInt8], channelId: [UInt8]) {
						// native call variable prep
						
						let nodeIdPrimitiveWrapper = PublicKey(value: nodeId)
				
						let channelIdPrimitiveWrapper = ThirtyTwoBytes(value: channelId)
				

						// native method call
						let nativeCallResult = HTLCDestination_next_hop_channel(nodeIdPrimitiveWrapper.cType!, channelIdPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = HTLCDestination(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new UnknownNextHop-variant HTLCDestination
					public init(requestedForwardScid: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = HTLCDestination_unknown_next_hop(requestedForwardScid)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = HTLCDestination(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new FailedPayment-variant HTLCDestination
					public init(paymentHash: [UInt8]) {
						// native call variable prep
						
						let paymentHashPrimitiveWrapper = ThirtyTwoBytes(value: paymentHash)
				

						// native method call
						let nativeCallResult = HTLCDestination_failed_payment(paymentHashPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = HTLCDestination(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Checks if two HTLCDestinations contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKHTLCDestination>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKHTLCDestination>) in
			HTLCDestination_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the HTLCDestination object into a byte array which can be read by HTLCDestination_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKHTLCDestination>) in
			HTLCDestination_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a HTLCDestination from a byte array, created by HTLCDestination_write
					public class func read(ser: [UInt8]) -> Result_COption_HTLCDestinationZDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = HTLCDestination_read(serPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_COption_HTLCDestinationZDecodeErrorZ(cType: nativeCallResult)

						return returnValue
					}
		

					
					public func getValueAsNextHopChannel() -> NextHopChannel? {
						if self.cType?.tag != LDKHTLCDestination_NextHopChannel {
							return nil
						}

						return HTLCDestination_LDKNextHopChannel_Body(cType: self.cType!.next_hop_channel)
					}
			
					public func getValueAsUnknownNextHop() -> UnknownNextHop? {
						if self.cType?.tag != LDKHTLCDestination_UnknownNextHop {
							return nil
						}

						return HTLCDestination_LDKUnknownNextHop_Body(cType: self.cType!.unknown_next_hop)
					}
			
					public func getValueAsFailedPayment() -> FailedPayment? {
						if self.cType?.tag != LDKHTLCDestination_FailedPayment {
							return nil
						}

						return HTLCDestination_LDKFailedPayment_Body(cType: self.cType!.failed_payment)
					}
			

					internal func dangle() -> HTLCDestination {
        				self.dangling = true
						return self
					}

					
					internal func danglingClone() -> HTLCDestination {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing HTLCDestination \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing HTLCDestination \(self.instanceNumber) due to dangle.")
						}
					}
			

					
					

					/// 
					public class NextHopChannel: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKHTLCDestination_LDKNextHopChannel_Body?

						fileprivate init(cType: LDKHTLCDestination_LDKNextHopChannel_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(cType: LDKHTLCDestination_LDKNextHopChannel_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The `node_id` of the next node. For backwards compatibility, this field is
						/// marked as optional, versions prior to 0.0.110 may not always be able to provide
						/// counterparty node information.
						/// 
						/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
						public func getNodeId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = PublicKey(cType: self.cType!.node_id)

							return returnValue;
						}
		
						/// The outgoing `channel_id` between us and the next node.
						public func getChannelId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.channel_id)

							return returnValue;
						}
		

						internal func dangle() -> NextHopChannel {
							self.dangling = true
							return self
						}

											

					}

					
		
					

					/// 
					public class UnknownNextHop: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKHTLCDestination_LDKUnknownNextHop_Body?

						fileprivate init(cType: LDKHTLCDestination_LDKUnknownNextHop_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(cType: LDKHTLCDestination_LDKUnknownNextHop_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// Short channel id we are requesting to forward an HTLC to.
						public func getRequestedForwardScid() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.requested_forward_scid

							return returnValue;
						}
		

						internal func dangle() -> UnknownNextHop {
							self.dangling = true
							return self
						}

											

					}

					
		
					

					/// 
					public class FailedPayment: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKHTLCDestination_LDKFailedPayment_Body?

						fileprivate init(cType: LDKHTLCDestination_LDKFailedPayment_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(cType: LDKHTLCDestination_LDKFailedPayment_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The payment hash of the payment we attempted to process.
						public func getPaymentHash() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_hash)

							return returnValue;
						}
		

						internal func dangle() -> FailedPayment {
							self.dangling = true
							return self
						}

											

					}

					
		

				}

			}
		