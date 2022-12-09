
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_FixedPenaltyScorerDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::routing::scoring::FixedPenaltyScorer on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_FixedPenaltyScorerDecodeErrorZ = Bindings.Result_FixedPenaltyScorerDecodeErrorZ

			extension Bindings {

				/// A CResult_FixedPenaltyScorerDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::routing::scoring::FixedPenaltyScorer on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_FixedPenaltyScorerDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_FixedPenaltyScorerDecodeErrorZ?

					public init(cType: LDKCResult_FixedPenaltyScorerDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_FixedPenaltyScorerDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_FixedPenaltyScorerDecodeErrorZ in the success state.
					public init(o: FixedPenaltyScorer) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_FixedPenaltyScorerDecodeErrorZ_ok(o.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_FixedPenaltyScorerDecodeErrorZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a new CResult_FixedPenaltyScorerDecodeErrorZ in the error state.
					public init(e: DecodeError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_FixedPenaltyScorerDecodeErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_FixedPenaltyScorerDecodeErrorZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Frees any resources used by the CResult_FixedPenaltyScorerDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_FixedPenaltyScorerDecodeErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_FixedPenaltyScorerDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_FixedPenaltyScorerDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_FixedPenaltyScorerDecodeErrorZ>) in
				CResult_FixedPenaltyScorerDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_FixedPenaltyScorerDecodeErrorZ(cType: nativeCallResult)

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
					

					
					public func getValue() -> FixedPenaltyScorer? {
						if self.cType?.result_ok == true {
							return FixedPenaltyScorer(cType: self.cType!.contents.result.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					internal func dangle() -> Result_FixedPenaltyScorerDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		