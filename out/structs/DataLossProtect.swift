
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias DataLossProtect = Bindings.DataLossProtect

			extension Bindings {
		

				/// Proof that the sender knows the per-commitment secret of the previous commitment transaction.
				/// This is used to convince the recipient that the channel is at a certain commitment
				/// number even if they lost that data due to a local failure.  Of course, the peer may lie
				/// and even later commitments may have been revoked.
				public class DataLossProtect: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKDataLossProtect?

					public init(cType: LDKDataLossProtect) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKDataLossProtect, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the DataLossProtect, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = DataLossProtect_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Proof that the sender knows the per-commitment secret of a specific commitment transaction
					/// belonging to the recipient
					public func setYourLastPerCommitmentSecret(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKDataLossProtect>) in
			DataLossProtect_set_your_last_per_commitment_secret(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The sender's per-commitment point for their current commitment transaction
					public func getMyCurrentPerCommitmentPoint() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKDataLossProtect>) in
			DataLossProtect_get_my_current_per_commitment_point(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult)

						return returnValue
					}
		
					/// The sender's per-commitment point for their current commitment transaction
					public func setMyCurrentPerCommitmentPoint(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = PublicKey(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKDataLossProtect>) in
			DataLossProtect_set_my_current_per_commitment_point(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new DataLossProtect given each field
					public init(yourLastPerCommitmentSecretArg: [UInt8], myCurrentPerCommitmentPointArg: [UInt8]) {
						// native call variable prep
						
						let yourLastPerCommitmentSecretArgPrimitiveWrapper = ThirtyTwoBytes(value: yourLastPerCommitmentSecretArg)
				
						let myCurrentPerCommitmentPointArgPrimitiveWrapper = PublicKey(value: myCurrentPerCommitmentPointArg)
				

						// native method call
						let nativeCallResult = DataLossProtect_new(yourLastPerCommitmentSecretArgPrimitiveWrapper.cType!, myCurrentPerCommitmentPointArgPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = DataLossProtect(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the DataLossProtect
					internal func clone() -> DataLossProtect {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKDataLossProtect>) in
			DataLossProtect_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = DataLossProtect(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two DataLossProtects contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKDataLossProtect>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKDataLossProtect>) in
			DataLossProtect_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

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
		

					internal func dangle() -> DataLossProtect {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> DataLossProtect {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing DataLossProtect \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing DataLossProtect \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		