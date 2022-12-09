
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_NoneAPIErrorZ represents the result of a fallible operation,
			/// containing a () on success and a crate::lightning::util::errors::APIError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_NoneAPIErrorZ = Bindings.Result_NoneAPIErrorZ

			extension Bindings {

				/// A CResult_NoneAPIErrorZ represents the result of a fallible operation,
				/// containing a () on success and a crate::lightning::util::errors::APIError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_NoneAPIErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_NoneAPIErrorZ?

					public init(cType: LDKCResult_NoneAPIErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_NoneAPIErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_NoneAPIErrorZ in the success state.
					public init() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NoneAPIErrorZ_ok()

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NoneAPIErrorZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a new CResult_NoneAPIErrorZ in the error state.
					public init(e: APIError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NoneAPIErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NoneAPIErrorZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Frees any resources used by the CResult_NoneAPIErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NoneAPIErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_NoneAPIErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_NoneAPIErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_NoneAPIErrorZ>) in
				CResult_NoneAPIErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NoneAPIErrorZ(cType: nativeCallResult)

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> APIError? {
						if self.cType?.result_ok == false {
							return APIError(cType: self.cType!.contents.err.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					/*
					public func getValue() -> Void? {
						if self.cType?.result_ok == true {
							return self.cType!.contents.result.pointee
						}
						return nil
					}
					*/

					internal func dangle() -> Result_NoneAPIErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		