
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A map with liquidity value (in msat) keyed by a short channel id and the direction the HTLC
			/// is traveling in. The direction boolean is determined by checking if the HTLC source's public
			/// key is less than its destination. See [`InFlightHtlcs::used_liquidity_msat`] for more
			/// details.
			public typealias InFlightHtlcs = Bindings.InFlightHtlcs

			extension Bindings {
		

				/// A map with liquidity value (in msat) keyed by a short channel id and the direction the HTLC
				/// is traveling in. The direction boolean is determined by checking if the HTLC source's public
				/// key is less than its destination. See [`InFlightHtlcs::used_liquidity_msat`] for more
				/// details.
				public class InFlightHtlcs: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKInFlightHtlcs?

					public init(cType: LDKInFlightHtlcs) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKInFlightHtlcs, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the InFlightHtlcs, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = InFlightHtlcs_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Returns liquidity in msat given the public key of the HTLC source, target, and short channel
					/// id.
					public func usedLiquidityMsat(source: NodeId, target: NodeId, channelScid: UInt64) -> UInt64? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInFlightHtlcs>) in
				
						withUnsafePointer(to: source.dynamicallyDangledClone().cType!) { (sourcePointer: UnsafePointer<LDKNodeId>) in
				
						withUnsafePointer(to: target.dynamicallyDangledClone().cType!) { (targetPointer: UnsafePointer<LDKNodeId>) in
				InFlightHtlcs_used_liquidity_msat(thisArgPointer, sourcePointer, targetPointer, channelScid)
						}
				
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult, anchor: self).getValue()
						

						return returnValue
					}
		
					/// Serialize the InFlightHtlcs object into a byte array which can be read by InFlightHtlcs_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKInFlightHtlcs>) in
				InFlightHtlcs_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).getValue()
						

						return returnValue
					}
		
					/// Read a InFlightHtlcs from a byte array, created by InFlightHtlcs_write
					public class func read(ser: [UInt8]) -> Result_InFlightHtlcsDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = InFlightHtlcs_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_InFlightHtlcsDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle() -> InFlightHtlcs {
						self.dangling = true
						return self
					}

					
					internal func setCFreeability(freeable: Bool) -> InFlightHtlcs {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> InFlightHtlcs {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing InFlightHtlcs \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing InFlightHtlcs \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		