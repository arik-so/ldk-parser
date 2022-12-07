
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_COption_CustomOnionMessageContentsZDecodeErrorZ = Bindings.Result_COption_CustomOnionMessageContentsZDecodeErrorZ

			extension Bindings {

				/// A CResult_COption_CustomOnionMessageContentsZDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::c_types::derived::COption_CustomOnionMessageContentsZ on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_COption_CustomOnionMessageContentsZDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_COption_CustomOnionMessageContentsZDecodeErrorZ?

					public init(cType: LDKCResult_COption_CustomOnionMessageContentsZDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_COption_CustomOnionMessageContentsZDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_COption_CustomOnionMessageContentsZDecodeErrorZ in the success state.
					public init(o: CustomOnionMessageContents?) {
						// native call variable prep
						
						let oOption = Option_CustomOnionMessageContentsZ(value: o)
				

						// native method call
						let nativeCallResult = CResult_COption_CustomOnionMessageContentsZDecodeErrorZ_ok(oOption.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_COption_CustomOnionMessageContentsZDecodeErrorZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a new CResult_COption_CustomOnionMessageContentsZDecodeErrorZ in the error state.
					public init(e: DecodeError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_COption_CustomOnionMessageContentsZDecodeErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_COption_CustomOnionMessageContentsZDecodeErrorZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the CResult_COption_CustomOnionMessageContentsZDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_COption_CustomOnionMessageContentsZDecodeErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_COption_CustomOnionMessageContentsZDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_COption_CustomOnionMessageContentsZDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_COption_CustomOnionMessageContentsZDecodeErrorZ>) in
			CResult_COption_CustomOnionMessageContentsZDecodeErrorZ_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_COption_CustomOnionMessageContentsZDecodeErrorZ(cType: nativeCallResult)

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

					public func getValue() -> CustomOnionMessageContents? {
						if self.cType?.result_ok == true {
							return Option_CustomOnionMessageContentsZ(cType: self.cType!.contents.result.pointee).getValue()
						}
						return nil
					}

					internal func dangle() -> Result_COption_CustomOnionMessageContentsZDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		