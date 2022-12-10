
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of crate::lightning::util::errors::APIErrors of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_APIErrorZ = Bindings.Vec_APIErrorZ

			extension Bindings {

				/// A dynamically-allocated array of crate::lightning::util::errors::APIErrors of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_APIErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_APIErrorZ?

					public init(cType: LDKCVec_APIErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCVec_APIErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(array: [APIError]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						
						let rustArray = array.map { (currentValueDepth1) in
							
							return currentValueDepth1.danglingClone().cType!
						}
				

						

						let dataContainer = UnsafeMutablePointer<LDKAPIError>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_APIErrorZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [APIError] {

						var array = [LDKAPIError]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType) in
APIError(cType: currentCType, anchor: self).dangle()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_APIErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					internal func dangle() -> Vec_APIErrorZ {
        				self.dangling = true
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Vec_APIErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Vec_APIErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		