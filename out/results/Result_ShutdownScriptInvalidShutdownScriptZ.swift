
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_ShutdownScriptInvalidShutdownScriptZ = Bindings.Result_ShutdownScriptInvalidShutdownScriptZ

			extension Bindings {

				/// A CResult_ShutdownScriptInvalidShutdownScriptZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::script::ShutdownScript on success and a crate::lightning::ln::script::InvalidShutdownScript on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_ShutdownScriptInvalidShutdownScriptZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_ShutdownScriptInvalidShutdownScriptZ?

					public init(pointer: LDKCResult_ShutdownScriptInvalidShutdownScriptZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKCResult_ShutdownScriptInvalidShutdownScriptZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_ShutdownScriptInvalidShutdownScriptZ in the success state.
					public init(o: ShutdownScript) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ShutdownScriptInvalidShutdownScriptZ_ok(o.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_ShutdownScriptInvalidShutdownScriptZ(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a new CResult_ShutdownScriptInvalidShutdownScriptZ in the error state.
					public init(e: InvalidShutdownScript) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ShutdownScriptInvalidShutdownScriptZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_ShutdownScriptInvalidShutdownScriptZ(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the CResult_ShutdownScriptInvalidShutdownScriptZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ShutdownScriptInvalidShutdownScriptZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_ShutdownScriptInvalidShutdownScriptZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_ShutdownScriptInvalidShutdownScriptZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_ShutdownScriptInvalidShutdownScriptZ>) in
			CResult_ShutdownScriptInvalidShutdownScriptZ_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_ShutdownScriptInvalidShutdownScriptZ(pointer: nativeCallResult)

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					public func getError() -> InvalidShutdownScript? {
						if self.cType?.result_ok == false {
							return InvalidShutdownScript(pointer: self.cType!.contents.err.pointee)
						}
						return nil
					}

					public func getValue() -> ShutdownScript? {
						if self.cType?.result_ok == true {
							return ShutdownScript(pointer: self.cType!.contents.result.pointee)
						}
						return nil
					}

					internal func dangle() -> Result_ShutdownScriptInvalidShutdownScriptZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		