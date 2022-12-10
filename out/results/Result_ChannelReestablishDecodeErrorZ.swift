
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_ChannelReestablishDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::msgs::ChannelReestablish on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_ChannelReestablishDecodeErrorZ = Bindings.Result_ChannelReestablishDecodeErrorZ

			extension Bindings {

				/// A CResult_ChannelReestablishDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::msgs::ChannelReestablish on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_ChannelReestablishDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_ChannelReestablishDecodeErrorZ?

					public init(cType: LDKCResult_ChannelReestablishDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_ChannelReestablishDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_ChannelReestablishDecodeErrorZ in the success state.
					public class func initWithOk(o: ChannelReestablish) -> Result_ChannelReestablishDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ChannelReestablishDecodeErrorZ_ok(o.clone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_ChannelReestablishDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_ChannelReestablishDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_ChannelReestablishDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ChannelReestablishDecodeErrorZ_err(e.clone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_ChannelReestablishDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_ChannelReestablishDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ChannelReestablishDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_ChannelReestablishDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_ChannelReestablishDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_ChannelReestablishDecodeErrorZ>) in
				CResult_ChannelReestablishDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_ChannelReestablishDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					
					public func getValue() -> ChannelReestablish? {
						if self.cType?.result_ok == true {
							return ChannelReestablish(cType: self.cType!.contents.result.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					internal func dangle() -> Result_ChannelReestablishDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		