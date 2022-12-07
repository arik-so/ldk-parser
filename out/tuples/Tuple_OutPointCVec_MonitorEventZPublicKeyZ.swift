
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			internal typealias Tuple_OutPointCVec_MonitorEventZPublicKeyZ = Bindings.Tuple_OutPointCVec_MonitorEventZPublicKeyZ

			extension Bindings {

				/// A tuple of 3 elements. See the individual fields for the types contained.
				internal class Tuple_OutPointCVec_MonitorEventZPublicKeyZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ?

					public init(pointer: LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal convenience init(tuple: (OutPoint, [MonitorEvent], [UInt8])) {
						self.init(a: tuple.0, b: tuple.1, c: tuple.2)
					}

					
					/// Creates a new tuple which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Tuple_OutPointCVec_MonitorEventZPublicKeyZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ>) in
			C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Tuple_OutPointCVec_MonitorEventZPublicKeyZ(pointer: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Creates a new C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ from the contained elements.
					public init(a: OutPoint, b: [MonitorEvent], c: [UInt8]) {
						// native call variable prep
						
						let bVector = Vec_MonitorEventZ(array: b)
				

						// native method call
						let nativeCallResult = C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ_new(a.cType!, bVector.cType!, c.cType!)

						// cleanup
						
						bVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Tuple_OutPointCVec_MonitorEventZPublicKeyZ(pointer: nativeCallResult).getValue()

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					public func getValue() -> (OutPoint, [MonitorEvent], [UInt8]) {
						return (self.getA(), self.getB(), self.getC())
					}

					
					/// The element at position 0
					public func getA() -> OutPoint {
						// return value (do some wrapping)
						let returnValue = OutPoint(pointer: self.cType!.a)

						return returnValue;
					}
		
					/// The element at position 1
					public func getB() -> [MonitorEvent] {
						// return value (do some wrapping)
						let returnValue = Vec_MonitorEventZ(pointer: self.cType!.b).getValue()

						return returnValue;
					}
		
					/// The element at position 2
					public func getC() -> [UInt8] {
						// return value (do some wrapping)
						let returnValue = PublicKey(pointer: self.cType!.c)

						return returnValue;
					}
		

					internal func dangle() -> Tuple_OutPointCVec_MonitorEventZPublicKeyZ {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> Tuple_OutPointCVec_MonitorEventZPublicKeyZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Tuple_OutPointCVec_MonitorEventZPublicKeyZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Tuple_OutPointCVec_MonitorEventZPublicKeyZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}
			}
		