
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_InitFeaturesDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::features::InitFeatures on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_InitFeaturesDecodeErrorZ = Bindings.Result_InitFeaturesDecodeErrorZ

			extension Bindings {

				/// A CResult_InitFeaturesDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::features::InitFeatures on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_InitFeaturesDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_InitFeaturesDecodeErrorZ?

					public init(cType: LDKCResult_InitFeaturesDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_InitFeaturesDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_InitFeaturesDecodeErrorZ in the success state.
					public class func initWithOk(o: InitFeatures) -> Result_InitFeaturesDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_InitFeaturesDecodeErrorZ_ok(o.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_InitFeaturesDecodeErrorZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Creates a new CResult_InitFeaturesDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_InitFeaturesDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_InitFeaturesDecodeErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_InitFeaturesDecodeErrorZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Frees any resources used by the CResult_InitFeaturesDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_InitFeaturesDecodeErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_InitFeaturesDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_InitFeaturesDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_InitFeaturesDecodeErrorZ>) in
				CResult_InitFeaturesDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_InitFeaturesDecodeErrorZ(cType: nativeCallResult)

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
					

					
					public func getValue() -> InitFeatures? {
						if self.cType?.result_ok == true {
							return InitFeatures(cType: self.cType!.contents.result.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					internal func dangle() -> Result_InitFeaturesDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		