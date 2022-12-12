
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of crate::lightning::chain::channelmonitor::ChannelMonitors of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_ChannelMonitorZ = Bindings.Vec_ChannelMonitorZ

			extension Bindings {

				/// A dynamically-allocated array of crate::lightning::chain::channelmonitor::ChannelMonitors of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_ChannelMonitorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_ChannelMonitorZ?

					public init(cType: LDKCVec_ChannelMonitorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCVec_ChannelMonitorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(array: [ChannelMonitor]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						
						let rustArray = array.map { (currentValueDepth1: ChannelMonitor) -> LDKChannelMonitor in
							
							return currentValueDepth1.clone().setCFreeability(freeable: false).cType!
						}
				

						

						let dataContainer = UnsafeMutablePointer<LDKChannelMonitor>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_ChannelMonitorZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [ChannelMonitor] {

						var array = [LDKChannelMonitor]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType: LDKChannelMonitor) -> ChannelMonitor in
ChannelMonitor(cType: currentCType, anchor: self).dangle()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_ChannelMonitorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					internal func dangle() -> Vec_ChannelMonitorZ {
        				self.dangling = true
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Vec_ChannelMonitorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Vec_ChannelMonitorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		