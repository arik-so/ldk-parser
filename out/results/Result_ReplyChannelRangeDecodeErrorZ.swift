
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_ReplyChannelRangeDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::msgs::ReplyChannelRange on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_ReplyChannelRangeDecodeErrorZ = Bindings.Result_ReplyChannelRangeDecodeErrorZ

			extension Bindings {

				/// A CResult_ReplyChannelRangeDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::msgs::ReplyChannelRange on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_ReplyChannelRangeDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_ReplyChannelRangeDecodeErrorZ?

					public init(cType: LDKCResult_ReplyChannelRangeDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_ReplyChannelRangeDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_ReplyChannelRangeDecodeErrorZ in the success state.
					public class func initWithOk(o: ReplyChannelRange) -> Result_ReplyChannelRangeDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ReplyChannelRangeDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_ReplyChannelRangeDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_ReplyChannelRangeDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_ReplyChannelRangeDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ReplyChannelRangeDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_ReplyChannelRangeDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_ReplyChannelRangeDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ReplyChannelRangeDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_ReplyChannelRangeDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_ReplyChannelRangeDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_ReplyChannelRangeDecodeErrorZ>) in
				CResult_ReplyChannelRangeDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_ReplyChannelRangeDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee, anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> ReplyChannelRange? {
						if self.cType?.result_ok == true {
							return ReplyChannelRange(cType: self.cType!.contents.result.pointee, anchor: self)
						}
						return nil
					}
					

					internal func dangle() -> Result_ReplyChannelRangeDecodeErrorZ {
        				self.dangling = true
						return self
					}

					
					internal func danglingClone() -> Result_ReplyChannelRangeDecodeErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_ReplyChannelRangeDecodeErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_ReplyChannelRangeDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		