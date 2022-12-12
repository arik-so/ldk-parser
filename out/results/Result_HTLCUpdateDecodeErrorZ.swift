
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_HTLCUpdateDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::chain::channelmonitor::HTLCUpdate on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_HTLCUpdateDecodeErrorZ = Bindings.Result_HTLCUpdateDecodeErrorZ

			extension Bindings {

				/// A CResult_HTLCUpdateDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::chain::channelmonitor::HTLCUpdate on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_HTLCUpdateDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_HTLCUpdateDecodeErrorZ?

					public init(cType: LDKCResult_HTLCUpdateDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_HTLCUpdateDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_HTLCUpdateDecodeErrorZ in the success state.
					public class func initWithOk(o: HTLCUpdate) -> Result_HTLCUpdateDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_HTLCUpdateDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_HTLCUpdateDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_HTLCUpdateDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_HTLCUpdateDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_HTLCUpdateDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_HTLCUpdateDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_HTLCUpdateDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_HTLCUpdateDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_HTLCUpdateDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_HTLCUpdateDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_HTLCUpdateDecodeErrorZ>) in
				CResult_HTLCUpdateDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_HTLCUpdateDecodeErrorZ(cType: nativeCallResult)
						

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
					

					
					public func getValue() -> HTLCUpdate? {
						if self.cType?.result_ok == true {
							return HTLCUpdate(cType: self.cType!.contents.result.pointee, anchor: self)
						}
						return nil
					}
					

					internal func dangle() -> Result_HTLCUpdateDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		