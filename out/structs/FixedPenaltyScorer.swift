
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// [`Score`] implementation that uses a fixed penalty.
			public typealias FixedPenaltyScorer = Bindings.FixedPenaltyScorer

			extension Bindings {
		

				/// [`Score`] implementation that uses a fixed penalty.
				public class FixedPenaltyScorer: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKFixedPenaltyScorer?

					public init(cType: LDKFixedPenaltyScorer) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKFixedPenaltyScorer, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the FixedPenaltyScorer, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = FixedPenaltyScorer_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the FixedPenaltyScorer
					internal func clone() -> FixedPenaltyScorer {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKFixedPenaltyScorer>) in
				FixedPenaltyScorer_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = FixedPenaltyScorer(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new scorer using `penalty_msat`.
					public class func initWithWithPenalty(penaltyMsat: UInt64) -> FixedPenaltyScorer {
						// native call variable prep
						

						// native method call
						let nativeCallResult = FixedPenaltyScorer_with_penalty(penaltyMsat)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = FixedPenaltyScorer(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Constructs a new Score which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned Score must be freed before this_arg is
					public func asScore() -> Score {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKFixedPenaltyScorer>) in
				FixedPenaltyScorer_as_Score(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedScore(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Serialize the FixedPenaltyScorer object into a byte array which can be read by FixedPenaltyScorer_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKFixedPenaltyScorer>) in
				FixedPenaltyScorer_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// Read a FixedPenaltyScorer from a byte array, created by FixedPenaltyScorer_write
					public class func read(ser: [UInt8], arg: UInt64) -> Result_FixedPenaltyScorerDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = FixedPenaltyScorer_read(serPrimitiveWrapper.cType!, arg)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_FixedPenaltyScorerDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					internal func dangle() -> FixedPenaltyScorer {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> FixedPenaltyScorer {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}
						
						if !self.dangling {
							Bindings.print("Freeing FixedPenaltyScorer \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing FixedPenaltyScorer \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		