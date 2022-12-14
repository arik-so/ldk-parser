
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Proposed use of a channel passed as a parameter to [`Score::channel_penalty_msat`].
			public typealias ChannelUsage = Bindings.ChannelUsage

			extension Bindings {
		

				/// Proposed use of a channel passed as a parameter to [`Score::channel_penalty_msat`].
				public class ChannelUsage: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKChannelUsage?

					public init(cType: LDKChannelUsage) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKChannelUsage, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ChannelUsage, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelUsage_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The amount to send through the channel, denominated in millisatoshis.
					public func getAmountMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelUsage>) in
				ChannelUsage_get_amount_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The amount to send through the channel, denominated in millisatoshis.
					public func setAmountMsat(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelUsage>) in
				ChannelUsage_set_amount_msat(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Total amount, denominated in millisatoshis, already allocated to send through the channel
					/// as part of a multi-path payment.
					public func getInflightHtlcMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelUsage>) in
				ChannelUsage_get_inflight_htlc_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Total amount, denominated in millisatoshis, already allocated to send through the channel
					/// as part of a multi-path payment.
					public func setInflightHtlcMsat(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelUsage>) in
				ChannelUsage_set_inflight_htlc_msat(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The effective capacity of the channel.
					public func getEffectiveCapacity() -> EffectiveCapacity {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelUsage>) in
				ChannelUsage_get_effective_capacity(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = EffectiveCapacity(cType: nativeCallResult, anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// The effective capacity of the channel.
					public func setEffectiveCapacity(val: EffectiveCapacity) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelUsage>) in
				ChannelUsage_set_effective_capacity(thisPtrPointer, val.danglingClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new ChannelUsage given each field
					public init(amountMsatArg: UInt64, inflightHtlcMsatArg: UInt64, effectiveCapacityArg: EffectiveCapacity) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelUsage_new(amountMsatArg, inflightHtlcMsatArg, effectiveCapacityArg.danglingClone().cType!)

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = ChannelUsage(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a copy of the ChannelUsage
					internal func clone() -> ChannelUsage {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKChannelUsage>) in
				ChannelUsage_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelUsage(cType: nativeCallResult)
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> ChannelUsage {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> ChannelUsage {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> ChannelUsage {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> ChannelUsage {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> ChannelUsage {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing ChannelUsage \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing ChannelUsage \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		