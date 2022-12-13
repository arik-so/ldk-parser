
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_AcceptChannelDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::msgs::AcceptChannel on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_AcceptChannelDecodeErrorZ = Bindings.Result_AcceptChannelDecodeErrorZ

			extension Bindings {

				/// A CResult_AcceptChannelDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::msgs::AcceptChannel on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_AcceptChannelDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_AcceptChannelDecodeErrorZ?

					public init(cType: LDKCResult_AcceptChannelDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_AcceptChannelDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_AcceptChannelDecodeErrorZ in the success state.
					public class func initWithOk(o: AcceptChannel) -> Result_AcceptChannelDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_AcceptChannelDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_AcceptChannelDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_AcceptChannelDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_AcceptChannelDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_AcceptChannelDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_AcceptChannelDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_AcceptChannelDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_AcceptChannelDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_AcceptChannelDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_AcceptChannelDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_AcceptChannelDecodeErrorZ>) in
				CResult_AcceptChannelDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_AcceptChannelDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee, anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> AcceptChannel? {
						if self.cType?.result_ok == true {
							return AcceptChannel(cType: self.cType!.contents.result.pointee, anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_AcceptChannelDecodeErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_AcceptChannelDecodeErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_AcceptChannelDecodeErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_AcceptChannelDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		