
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_C2Tuple_SignatureCVec_SignatureZZNoneZ represents the result of a fallible operation,
			/// containing a crate::c_types::derived::C2Tuple_SignatureCVec_SignatureZZ on success and a () on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_C2Tuple_SignatureCVec_SignatureZZNoneZ = Bindings.Result_C2Tuple_SignatureCVec_SignatureZZNoneZ

			extension Bindings {

				/// A CResult_C2Tuple_SignatureCVec_SignatureZZNoneZ represents the result of a fallible operation,
				/// containing a crate::c_types::derived::C2Tuple_SignatureCVec_SignatureZZ on success and a () on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_C2Tuple_SignatureCVec_SignatureZZNoneZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ?

					public init(cType: LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_C2Tuple_SignatureCVec_SignatureZZNoneZ in the success state.
					public class func initWithOk(o: ([UInt8], [[UInt8]])) -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
						// native call variable prep
						
						let oTuple = Tuple_SignatureCVec_SignatureZZ(tuple: o).danglingClone()
				

						// native method call
						let nativeCallResult = CResult_C2Tuple_SignatureCVec_SignatureZZNoneZ_ok(oTuple.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_SignatureCVec_SignatureZZNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_C2Tuple_SignatureCVec_SignatureZZNoneZ in the error state.
					public class func initWithErr() -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_C2Tuple_SignatureCVec_SignatureZZNoneZ_err()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_SignatureCVec_SignatureZZNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_C2Tuple_SignatureCVec_SignatureZZNoneZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_C2Tuple_SignatureCVec_SignatureZZNoneZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_C2Tuple_SignatureCVec_SignatureZZNoneZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ>) in
				CResult_C2Tuple_SignatureCVec_SignatureZZNoneZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_SignatureCVec_SignatureZZNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					/*
					public func getError() -> Void? {
						if self.cType?.result_ok == false {
							return self.cType!.contents.err.pointee
						}
						return nil
					}
					*/

					
					public func getValue() -> ([UInt8], [[UInt8]])? {
						if self.cType?.result_ok == true {
							return Tuple_SignatureCVec_SignatureZZ(cType: self.cType!.contents.result.pointee, anchor: self).getValue()
						}
						return nil
					}
					

					internal func dangle() -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		