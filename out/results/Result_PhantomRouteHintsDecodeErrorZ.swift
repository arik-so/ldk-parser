
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_PhantomRouteHintsDecodeErrorZ = Bindings.Result_PhantomRouteHintsDecodeErrorZ

			extension Bindings {

				/// A CResult_PhantomRouteHintsDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::channelmanager::PhantomRouteHints on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_PhantomRouteHintsDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_PhantomRouteHintsDecodeErrorZ?

					public init(cType: LDKCResult_PhantomRouteHintsDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_PhantomRouteHintsDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_PhantomRouteHintsDecodeErrorZ in the success state.
					public init(o: PhantomRouteHints) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PhantomRouteHintsDecodeErrorZ_ok(o.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PhantomRouteHintsDecodeErrorZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a new CResult_PhantomRouteHintsDecodeErrorZ in the error state.
					public init(e: DecodeError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PhantomRouteHintsDecodeErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PhantomRouteHintsDecodeErrorZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the CResult_PhantomRouteHintsDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PhantomRouteHintsDecodeErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_PhantomRouteHintsDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_PhantomRouteHintsDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_PhantomRouteHintsDecodeErrorZ>) in
			CResult_PhantomRouteHintsDecodeErrorZ_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PhantomRouteHintsDecodeErrorZ(cType: nativeCallResult)

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee)
						}
						return nil
					}

					public func getValue() -> PhantomRouteHints? {
						if self.cType?.result_ok == true {
							return PhantomRouteHints(cType: self.cType!.contents.result.pointee)
						}
						return nil
					}

					internal func dangle() -> Result_PhantomRouteHintsDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		