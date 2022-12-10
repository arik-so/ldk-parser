
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_RouteHintDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::routing::router::RouteHint on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_RouteHintDecodeErrorZ = Bindings.Result_RouteHintDecodeErrorZ

			extension Bindings {

				/// A CResult_RouteHintDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::routing::router::RouteHint on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_RouteHintDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_RouteHintDecodeErrorZ?

					public init(cType: LDKCResult_RouteHintDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_RouteHintDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_RouteHintDecodeErrorZ in the success state.
					public class func initWithOk(o: RouteHint) -> Result_RouteHintDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_RouteHintDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_RouteHintDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_RouteHintDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_RouteHintDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_RouteHintDecodeErrorZ_err(e.clone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_RouteHintDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_RouteHintDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_RouteHintDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_RouteHintDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_RouteHintDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_RouteHintDecodeErrorZ>) in
				CResult_RouteHintDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_RouteHintDecodeErrorZ(cType: nativeCallResult)
						

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
					

					
					public func getValue() -> RouteHint? {
						if self.cType?.result_ok == true {
							return RouteHint(cType: self.cType!.contents.result.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					internal func dangle() -> Result_RouteHintDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		