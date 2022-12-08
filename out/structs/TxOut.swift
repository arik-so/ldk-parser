
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias TxOut = Bindings.TxOut

			extension Bindings {
		

				/// A transaction output including a scriptPubKey and value.
				/// This type *does* own its own memory, so must be free'd appropriately.
				public class TxOut: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKTxOut?

					public init(cType: LDKTxOut) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKTxOut, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Convenience function for constructing a new TxOut
					public init(scriptPubkey: [UInt8], value: UInt64) {
						// native call variable prep
						
						let scriptPubkeyVector = Vec_u8Z(array: scriptPubkey)
				

						// native method call
						let nativeCallResult = TxOut_new(scriptPubkeyVector.cType!, value)

						// cleanup
						
						scriptPubkeyVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = TxOut(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees the data pointed to by script_pubkey.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = TxOut_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new TxOut which has the same data as `orig` but with a new script buffer.
					internal func clone() -> TxOut {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKTxOut>) in
				TxOut_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = TxOut(cType: nativeCallResult)

						return returnValue
					}
		

					
					/// The script_pubkey in this output
					public func getScriptPubkey() -> [UInt8] {
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: self.cType!.script_pubkey).getValue()

						return returnValue;
					}
		
					/// The value, in satoshis, of this output
					public func getValue() -> UInt64 {
						// return value (do some wrapping)
						let returnValue = self.cType!.value

						return returnValue;
					}
		

					internal func dangle() -> TxOut {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> TxOut {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing TxOut \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing TxOut \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		