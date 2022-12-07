
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			internal typealias Vec_UpdateAddHTLCZ = Bindings.Vec_UpdateAddHTLCZ

			extension Bindings {

				/// A dynamically-allocated array of crate::lightning::ln::msgs::UpdateAddHTLCs of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_UpdateAddHTLCZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_UpdateAddHTLCZ?

					public init(cType: LDKCVec_UpdateAddHTLCZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCVec_UpdateAddHTLCZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(array: [UpdateAddHTLC]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						let rustArray = array.map { (currentValueDepth1) in
							currentValueDepth1.danglingClone().cType!
						}

						

						let dataContainer = UnsafeMutablePointernull.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_UpdateAddHTLCZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector

						super.init(conflictAvoidingVariableName: 0)
					}

					public func getValue() -> [UpdateAddHTLC] {

						var array = [LDKUpdateAddHTLC]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType) in
							UpdateAddHTLC(cType: currentCType)
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_UpdateAddHTLCZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					internal func dangle() -> Vec_UpdateAddHTLCZ {
        				self.dangling = true
						return self
					}

					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Vec_UpdateAddHTLCZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Vec_UpdateAddHTLCZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		