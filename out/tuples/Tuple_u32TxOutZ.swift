
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			internal typealias Tuple_u32TxOutZ = Bindings.Tuple_u32TxOutZ

			extension Bindings {

				/// A tuple of 2 elements. See the individual fields for the types contained.
				internal class Tuple_u32TxOutZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKC2Tuple_u32TxOutZ?

					public init(cType: LDKC2Tuple_u32TxOutZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKC2Tuple_u32TxOutZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal convenience init(tuple: (UInt32, TxOut)) {
						self.init(a: tuple.0, b: tuple.1)
					}

					
					/// Creates a new tuple which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Tuple_u32TxOutZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKC2Tuple_u32TxOutZ>) in
			C2Tuple_u32TxOutZ_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Tuple_u32TxOutZ(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Creates a new C2Tuple_u32TxOutZ from the contained elements.
					public init(a: UInt32, b: TxOut) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = C2Tuple_u32TxOutZ_new(a, b.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Tuple_u32TxOutZ(cType: nativeCallResult).getValue()

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the C2Tuple_u32TxOutZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = C2Tuple_u32TxOutZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					public func getValue() -> (UInt32, TxOut) {
						return (self.getA(), self.getB())
					}

					
					/// The element at position 0
					public func getA() -> UInt32 {
						// return value (do some wrapping)
						let returnValue = self.cType!.a

						return returnValue;
					}
		
					/// The element at position 1
					public func getB() -> TxOut {
						// return value (do some wrapping)
						let returnValue = TxOut(cType: self.cType!.b)

						return returnValue;
					}
		

					internal func dangle() -> Tuple_u32TxOutZ {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> Tuple_u32TxOutZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Tuple_u32TxOutZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Tuple_u32TxOutZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}
			}
		