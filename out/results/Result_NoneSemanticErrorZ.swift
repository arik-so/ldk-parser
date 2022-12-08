
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_NoneSemanticErrorZ = Bindings.Result_NoneSemanticErrorZ

			extension Bindings {

				/// A CResult_NoneSemanticErrorZ represents the result of a fallible operation,
				/// containing a () on success and a crate::lightning_invoice::SemanticError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_NoneSemanticErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_NoneSemanticErrorZ?

					public init(cType: LDKCResult_NoneSemanticErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_NoneSemanticErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_NoneSemanticErrorZ in the success state.
					public init() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NoneSemanticErrorZ_ok()

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NoneSemanticErrorZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a new CResult_NoneSemanticErrorZ in the error state.
					public init(e: SemanticError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NoneSemanticErrorZ_err(e.getCValue())

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NoneSemanticErrorZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the CResult_NoneSemanticErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NoneSemanticErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_NoneSemanticErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_NoneSemanticErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_NoneSemanticErrorZ>) in
				CResult_NoneSemanticErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NoneSemanticErrorZ(cType: nativeCallResult)

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					public func getError() -> SemanticError? {
						if self.cType?.result_ok == false {
							return SemanticError(value: self.cType!.contents.err.pointee)
						}
						return nil
					}

					public func getValue() -> Void? {
						if self.cType?.result_ok == true {
							return self.cType!.contents.result.pointee
						}
						return nil
					}

					internal func dangle() -> Result_NoneSemanticErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		