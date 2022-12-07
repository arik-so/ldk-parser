
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_PrivateRouteCreationErrorZ = Bindings.Result_PrivateRouteCreationErrorZ

			extension Bindings {

				/// A CResult_PrivateRouteCreationErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning_invoice::PrivateRoute on success and a crate::lightning_invoice::CreationError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_PrivateRouteCreationErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_PrivateRouteCreationErrorZ?

					public init(pointer: LDKCResult_PrivateRouteCreationErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKCResult_PrivateRouteCreationErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_PrivateRouteCreationErrorZ in the success state.
					public init(o: PrivateRoute) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PrivateRouteCreationErrorZ_ok(o.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PrivateRouteCreationErrorZ(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a new CResult_PrivateRouteCreationErrorZ in the error state.
					public init(e: CreationError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PrivateRouteCreationErrorZ_err(e.getCValue())

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PrivateRouteCreationErrorZ(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the CResult_PrivateRouteCreationErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PrivateRouteCreationErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_PrivateRouteCreationErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_PrivateRouteCreationErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_PrivateRouteCreationErrorZ>) in
			CResult_PrivateRouteCreationErrorZ_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PrivateRouteCreationErrorZ(pointer: nativeCallResult)

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					public func getError() -> CreationError? {
						if self.cType?.result_ok == false {
							return CreationError(value: self.cType!.contents.err.pointee)
						}
						return nil
					}

					public func getValue() -> PrivateRoute? {
						if self.cType?.result_ok == true {
							return PrivateRoute(pointer: self.cType!.contents.result.pointee)
						}
						return nil
					}

					internal func dangle() -> Result_PrivateRouteCreationErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		