
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			internal typealias Vec_SpendableOutputDescriptorZ = Bindings.Vec_SpendableOutputDescriptorZ

			extension Bindings {

				/// A dynamically-allocated array of crate::lightning::chain::keysinterface::SpendableOutputDescriptors of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_SpendableOutputDescriptorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_SpendableOutputDescriptorZ?

					public init(cType: LDKCVec_SpendableOutputDescriptorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCVec_SpendableOutputDescriptorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(array: [SpendableOutputDescriptor]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						
						let rustArray = array.map { (currentValueDepth1) in
							
							return currentValueDepth1.cType!
						}
			

						

						let dataContainer = UnsafeMutablePointer<LDKSpendableOutputDescriptor>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_SpendableOutputDescriptorZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [SpendableOutputDescriptor] {

						var array = [LDKSpendableOutputDescriptor]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType) in
							SpendableOutputDescriptor(cType: currentCType)
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_SpendableOutputDescriptorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					internal func dangle() -> Vec_SpendableOutputDescriptorZ {
        				self.dangling = true
						return self
					}

					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Vec_SpendableOutputDescriptorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Vec_SpendableOutputDescriptorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		