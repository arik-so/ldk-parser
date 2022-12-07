
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			internal typealias Vec_SignatureZ = Bindings.Vec_SignatureZ

			extension Bindings {

				/// A dynamically-allocated array of crate::c_types::Signatures of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_SignatureZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_SignatureZ?

					public init(cType: LDKCVec_SignatureZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCVec_SignatureZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(array: [[UInt8]]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						let rustArray = array.map { (currentValueDepth1) in

				
						let currentValueDepth1PrimitiveWrapper = Signature(value: currentValueDepth1)
				
				return currentValueDepth1PrimitiveWrapper.cType!
			
						}

						

						let dataContainer = UnsafeMutablePointer<LDKSignature>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_SignatureZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector

						super.init(conflictAvoidingVariableName: 0)
					}

					public func getValue() -> [[UInt8]] {

						var array = [LDKSignature]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType) in
							Signature(cType: currentCType).getValue()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_SignatureZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					internal func dangle() -> Vec_SignatureZ {
        				self.dangling = true
						return self
					}

					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Vec_SignatureZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Vec_SignatureZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		