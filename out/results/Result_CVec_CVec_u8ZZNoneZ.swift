
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_CVec_CVec_u8ZZNoneZ = Bindings.Result_CVec_CVec_u8ZZNoneZ

			extension Bindings {

				/// A CResult_CVec_CVec_u8ZZNoneZ represents the result of a fallible operation,
				/// containing a crate::c_types::derived::CVec_CVec_u8ZZ on success and a () on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_CVec_CVec_u8ZZNoneZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_CVec_CVec_u8ZZNoneZ?

					public init(cType: LDKCResult_CVec_CVec_u8ZZNoneZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_CVec_CVec_u8ZZNoneZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_CVec_CVec_u8ZZNoneZ in the success state.
					public init(o: [[UInt8]]) {
						// native call variable prep
						
						let oVector = Vec_CVec_u8ZZ(array: o)
				

						// native method call
						let nativeCallResult = CResult_CVec_CVec_u8ZZNoneZ_ok(oVector.cType!)

						// cleanup
						
						oVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_CVec_CVec_u8ZZNoneZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a new CResult_CVec_CVec_u8ZZNoneZ in the error state.
					public init() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CVec_CVec_u8ZZNoneZ_err()

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_CVec_CVec_u8ZZNoneZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the CResult_CVec_CVec_u8ZZNoneZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CVec_CVec_u8ZZNoneZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_CVec_CVec_u8ZZNoneZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_CVec_CVec_u8ZZNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_CVec_CVec_u8ZZNoneZ>) in
			CResult_CVec_CVec_u8ZZNoneZ_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_CVec_CVec_u8ZZNoneZ(cType: nativeCallResult)

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					public func getError() -> Void? {
						if self.cType?.result_ok == false {
							return self.cType!.contents.err.pointee
						}
						return nil
					}

					public func getValue() -> [[UInt8]]? {
						if self.cType?.result_ok == true {
							return Vec_CVec_u8ZZ(cType: self.cType!.contents.result.pointee).getValue()
						}
						return nil
					}

					internal func dangle() -> Result_CVec_CVec_u8ZZNoneZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		