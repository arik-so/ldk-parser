
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_ChannelConfigDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::util::config::ChannelConfig on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_ChannelConfigDecodeErrorZ = Bindings.Result_ChannelConfigDecodeErrorZ

			extension Bindings {

				/// A CResult_ChannelConfigDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::util::config::ChannelConfig on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_ChannelConfigDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_ChannelConfigDecodeErrorZ?

					public init(cType: LDKCResult_ChannelConfigDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_ChannelConfigDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_ChannelConfigDecodeErrorZ in the success state.
					public class func initWithOk(o: ChannelConfig) -> Result_ChannelConfigDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ChannelConfigDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_ChannelConfigDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_ChannelConfigDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_ChannelConfigDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ChannelConfigDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_ChannelConfigDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_ChannelConfigDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ChannelConfigDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_ChannelConfigDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_ChannelConfigDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_ChannelConfigDecodeErrorZ>) in
				CResult_ChannelConfigDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_ChannelConfigDecodeErrorZ(cType: nativeCallResult)
						

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
					

					
					public func getValue() -> ChannelConfig? {
						if self.cType?.result_ok == true {
							return ChannelConfig(cType: self.cType!.contents.result.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					internal func dangle() -> Result_ChannelConfigDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		