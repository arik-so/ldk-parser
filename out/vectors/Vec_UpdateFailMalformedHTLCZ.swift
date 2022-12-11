
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of crate::lightning::ln::msgs::UpdateFailMalformedHTLCs of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_UpdateFailMalformedHTLCZ = Bindings.Vec_UpdateFailMalformedHTLCZ

			extension Bindings {

				/// A dynamically-allocated array of crate::lightning::ln::msgs::UpdateFailMalformedHTLCs of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_UpdateFailMalformedHTLCZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_UpdateFailMalformedHTLCZ?

					public init(cType: LDKCVec_UpdateFailMalformedHTLCZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCVec_UpdateFailMalformedHTLCZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(array: [UpdateFailMalformedHTLC]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						
						let rustArray = array.map { (currentValueDepth1: UpdateFailMalformedHTLC) in
							
							return currentValueDepth1.dynamicallyDangledClone().cType!
						}
				

						

						let dataContainer = UnsafeMutablePointer<LDKUpdateFailMalformedHTLC>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_UpdateFailMalformedHTLCZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [UpdateFailMalformedHTLC] {

						var array = [LDKUpdateFailMalformedHTLC]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType: LDKUpdateFailMalformedHTLC) in
UpdateFailMalformedHTLC(cType: currentCType, anchor: self).dangle()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_UpdateFailMalformedHTLCZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					internal func dangle() -> Vec_UpdateFailMalformedHTLCZ {
        				self.dangling = true
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Vec_UpdateFailMalformedHTLCZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Vec_UpdateFailMalformedHTLCZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		