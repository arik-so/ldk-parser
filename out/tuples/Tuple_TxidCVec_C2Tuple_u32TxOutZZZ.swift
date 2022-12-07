
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			internal typealias Tuple_TxidCVec_C2Tuple_u32TxOutZZZ = Bindings.Tuple_TxidCVec_C2Tuple_u32TxOutZZZ

			extension Bindings {

				/// A tuple of 2 elements. See the individual fields for the types contained.
				internal class Tuple_TxidCVec_C2Tuple_u32TxOutZZZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ?

					public init(cType: LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal convenience init(tuple: ([UInt8], [(UInt32, TxOut)])) {
						self.init(a: tuple.0, b: tuple.1)
					}

					
					/// Creates a new tuple which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Tuple_TxidCVec_C2Tuple_u32TxOutZZZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ>) in
			C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Tuple_TxidCVec_C2Tuple_u32TxOutZZZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Creates a new C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ from the contained elements.
					public init(a: [UInt8], b: [(UInt32, TxOut)]) {
						// native call variable prep
						
						let aPrimitiveWrapper = ThirtyTwoBytes(value: a)
				
						let bVector = Vec_C2Tuple_u32TxOutZZ(array: b)
				

						// native method call
						let nativeCallResult = C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ_new(aPrimitiveWrapper.cType!, bVector.cType!)

						// cleanup
						
						bVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Tuple_TxidCVec_C2Tuple_u32TxOutZZZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					public func getValue() -> ([UInt8], [(UInt32, TxOut)]) {
						return (self.getA(), self.getB())
					}

					
					/// The element at position 0
					public func getA() -> [UInt8] {
						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: self.cType!.a).getValue()

						return returnValue;
					}
		
					/// The element at position 1
					public func getB() -> [(UInt32, TxOut)] {
						// return value (do some wrapping)
						let returnValue = Vec_C2Tuple_u32TxOutZZ(cType: self.cType!.b).getValue()

						return returnValue;
					}
		

					internal func dangle() -> Tuple_TxidCVec_C2Tuple_u32TxOutZZZ {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> Tuple_TxidCVec_C2Tuple_u32TxOutZZZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Tuple_TxidCVec_C2Tuple_u32TxOutZZZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Tuple_TxidCVec_C2Tuple_u32TxOutZZZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}
			}
		