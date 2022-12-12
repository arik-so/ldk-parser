
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation // necessary for Data for Strings

			/// A serialized transaction, in (pointer, length) form.
			/// 
			/// This type optionally owns its own memory, and thus the semantics around access change based on
			/// the `data_is_owned` flag. If `data_is_owned` is set, you must call `Transaction_free` to free
			/// the underlying buffer before the object goes out of scope. If `data_is_owned` is not set, any
			/// access to the buffer after the scope in which the object was provided to you is invalid. eg,
			/// access after you return from the call in which a `!data_is_owned` `Transaction` is provided to
			/// you would be invalid.
			/// 
			/// Note that, while it may change in the future, because transactions on the Rust side are stored
			/// in a deserialized form, all `Transaction`s generated on the Rust side will have `data_is_owned`
			/// set. Similarly, while it may change in the future, all `Transaction`s you pass to Rust may have
			/// `data_is_owned` either set or unset at your discretion.
			internal typealias Transaction = Bindings.Transaction

			extension Bindings {

				/// A serialized transaction, in (pointer, length) form.
				/// 
				/// This type optionally owns its own memory, and thus the semantics around access change based on
				/// the `data_is_owned` flag. If `data_is_owned` is set, you must call `Transaction_free` to free
				/// the underlying buffer before the object goes out of scope. If `data_is_owned` is not set, any
				/// access to the buffer after the scope in which the object was provided to you is invalid. eg,
				/// access after you return from the call in which a `!data_is_owned` `Transaction` is provided to
				/// you would be invalid.
				/// 
				/// Note that, while it may change in the future, because transactions on the Rust side are stored
				/// in a deserialized form, all `Transaction`s generated on the Rust side will have `data_is_owned`
				/// set. Similarly, while it may change in the future, all `Transaction`s you pass to Rust may have
				/// `data_is_owned` either set or unset at your discretion.
				internal class Transaction: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKTransaction?

					public init(cType: LDKTransaction) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.data_is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKTransaction, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.data_is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(value: [UInt8]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						
						let dataContainer = UnsafeMutablePointer<UInt8>.allocate(capacity: value.count)
						dataContainer.initialize(from: value, count: value.count)
						self.cType = LDKTransaction(data: dataContainer, datalen: UInt(value.count), data_is_owned: false)
				
							self.initialCFreeability = self.cType!.data_is_owned
			

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Frees the data buffer, if data_is_owned is set and datalen > 0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Transaction_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func getValue() -> [UInt8] {
						
						var array = [UInt8]()
						for index in 0..<Int(self.cType!.datalen) {
							let currentEntry = self.cType!.data[index]
							array.append(currentEntry)
						}
						return array
				
					}

					internal func dangle() -> Transaction {
        				self.dangling = true
						return self
					}

					
					internal func setCFreeability(freeable: Bool) -> Transaction {
						self.cType!.data_is_owned = freeable
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Transaction \(self.instanceNumber).")
							
							if !self.initialCFreeability {
								// only set to freeable if it was originally false
								Bindings.print("Setting Transaction \(self.instanceNumber)'s data_is_owned: \(self.cType!.data_is_owned) -> true")
								self.cType!.data_is_owned = true
							}
					
							self.free()
						} else {
							Bindings.print("Not freeing Transaction \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		