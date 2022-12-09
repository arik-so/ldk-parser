
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_COption_TypeZDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::c_types::derived::COption_TypeZ on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_COption_TypeZDecodeErrorZ = Bindings.Result_COption_TypeZDecodeErrorZ

			extension Bindings {

				/// A CResult_COption_TypeZDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::c_types::derived::COption_TypeZ on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_COption_TypeZDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_COption_TypeZDecodeErrorZ?

					public init(cType: LDKCResult_COption_TypeZDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_COption_TypeZDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_COption_TypeZDecodeErrorZ in the success state.
					public init(o: BindingsType?) {
						// native call variable prep
						
						let oOption = Option_TypeZ(some: o)
				

						// native method call
						let nativeCallResult = CResult_COption_TypeZDecodeErrorZ_ok(oOption.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_COption_TypeZDecodeErrorZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a new CResult_COption_TypeZDecodeErrorZ in the error state.
					public init(e: DecodeError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_COption_TypeZDecodeErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_COption_TypeZDecodeErrorZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Frees any resources used by the CResult_COption_TypeZDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_COption_TypeZDecodeErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_COption_TypeZDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_COption_TypeZDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_COption_TypeZDecodeErrorZ>) in
				CResult_COption_TypeZDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_COption_TypeZDecodeErrorZ(cType: nativeCallResult)

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
					

					
					public func getValue() -> BindingsType? {
						if self.cType?.result_ok == true {
							return Option_TypeZ(cType: self.cType!.contents.result.pointee).dangle().getValue()
						}
						return nil
					}
					

					internal func dangle() -> Result_COption_TypeZDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		