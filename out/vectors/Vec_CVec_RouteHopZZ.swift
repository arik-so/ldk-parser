
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of crate::c_types::derived::CVec_RouteHopZs of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_CVec_RouteHopZZ = Bindings.Vec_CVec_RouteHopZZ

			extension Bindings {

				/// A dynamically-allocated array of crate::c_types::derived::CVec_RouteHopZs of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_CVec_RouteHopZZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_CVec_RouteHopZZ?

					internal init(cType: LDKCVec_CVec_RouteHopZZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCVec_CVec_RouteHopZZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(array: [[RouteHop]]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						

						
						var lowerDimension = [LDKCVec_RouteHopZ]()
						for currentEntry in array {
							
						let currentEntryVector = Vec_RouteHopZ(array: currentEntry).dangle()
				
							lowerDimension.append(currentEntryVector.cType!)
							try! self.addAnchor(anchor: currentEntryVector)
						}
			

						let dataContainer = UnsafeMutablePointer<LDKCVec_RouteHopZ>.allocate(capacity: array.count)
						dataContainer.initialize(from: lowerDimension, count: array.count)

        				let vector = LDKCVec_CVec_RouteHopZZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [[RouteHop]] {

						var array = [[LDKRouteHop]]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							
							var convertedEntry1 = [LDKRouteHop]()

							
							for index2 in 0..<Int(currentEntry1.datalen) {
								let currentEntry2 = currentEntry1.data[index2]
								convertedEntry1.append(currentEntry2)
							}
		

							array.append(convertedEntry1)
			
						}
		

						let swiftArray = array.map { (currentCType: [LDKRouteHop]) -> [RouteHop] in
							currentCType.map { (currentCType: LDKRouteHop) -> RouteHop in
RouteHop(cType: currentCType, anchor: self).dangle()
							}
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_CVec_RouteHopZZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Vec_CVec_RouteHopZZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Vec_CVec_RouteHopZZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Vec_CVec_RouteHopZZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		