
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_AnnouncementSignaturesDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::msgs::AnnouncementSignatures on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_AnnouncementSignaturesDecodeErrorZ = Bindings.Result_AnnouncementSignaturesDecodeErrorZ

			extension Bindings {

				/// A CResult_AnnouncementSignaturesDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::msgs::AnnouncementSignatures on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_AnnouncementSignaturesDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_AnnouncementSignaturesDecodeErrorZ?

					public init(cType: LDKCResult_AnnouncementSignaturesDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_AnnouncementSignaturesDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_AnnouncementSignaturesDecodeErrorZ in the success state.
					public class func initWithOk(o: AnnouncementSignatures) -> Result_AnnouncementSignaturesDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_AnnouncementSignaturesDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_AnnouncementSignaturesDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_AnnouncementSignaturesDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_AnnouncementSignaturesDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_AnnouncementSignaturesDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_AnnouncementSignaturesDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_AnnouncementSignaturesDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_AnnouncementSignaturesDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_AnnouncementSignaturesDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_AnnouncementSignaturesDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_AnnouncementSignaturesDecodeErrorZ>) in
				CResult_AnnouncementSignaturesDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_AnnouncementSignaturesDecodeErrorZ(cType: nativeCallResult)
						

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
					

					
					public func getValue() -> AnnouncementSignatures? {
						if self.cType?.result_ok == true {
							return AnnouncementSignatures(cType: self.cType!.contents.result.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					internal func dangle() -> Result_AnnouncementSignaturesDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		