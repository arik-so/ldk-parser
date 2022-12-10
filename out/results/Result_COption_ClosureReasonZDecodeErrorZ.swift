
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_COption_ClosureReasonZDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::c_types::derived::COption_ClosureReasonZ on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_COption_ClosureReasonZDecodeErrorZ = Bindings.Result_COption_ClosureReasonZDecodeErrorZ

			extension Bindings {

				/// A CResult_COption_ClosureReasonZDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::c_types::derived::COption_ClosureReasonZ on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_COption_ClosureReasonZDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_COption_ClosureReasonZDecodeErrorZ?

					public init(cType: LDKCResult_COption_ClosureReasonZDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_COption_ClosureReasonZDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_COption_ClosureReasonZDecodeErrorZ in the success state.
					public class func initWithOk(o: ClosureReason?) -> Result_COption_ClosureReasonZDecodeErrorZ {
						// native call variable prep
						
						let oOption = Option_ClosureReasonZ(some: o)
				

						// native method call
						let nativeCallResult = CResult_COption_ClosureReasonZDecodeErrorZ_ok(oOption.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_COption_ClosureReasonZDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_COption_ClosureReasonZDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_COption_ClosureReasonZDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_COption_ClosureReasonZDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_COption_ClosureReasonZDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_COption_ClosureReasonZDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_COption_ClosureReasonZDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_COption_ClosureReasonZDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_COption_ClosureReasonZDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_COption_ClosureReasonZDecodeErrorZ>) in
				CResult_COption_ClosureReasonZDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_COption_ClosureReasonZDecodeErrorZ(cType: nativeCallResult)
						

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
					

					
					public func getValue() -> ClosureReason? {
						if self.cType?.result_ok == true {
							return Option_ClosureReasonZ(cType: self.cType!.contents.result.pointee).dangle().getValue()
						}
						return nil
					}
					

					internal func dangle() -> Result_COption_ClosureReasonZDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		