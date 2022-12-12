
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// A trait encapsulating the operations required of a logger
			public typealias Logger = Bindings.Logger

			extension Bindings {

				/// A trait encapsulating the operations required of a logger
				open class Logger: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKLogger?

					public init(cType: LDKLogger) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKLogger, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init() {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func logLambda(this_arg: UnsafeRawPointer?, record: UnsafePointer<LDKRecord>) -> Void {
							let instance: Logger = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Logger::logLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.log(record: Record(cType: record.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: Logger = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Logger::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKLogger(							
							this_arg: thisArg,
							log: logLambda,
							free: freeLambda
						)
					}

					
					/// Logs the `Record`
					open func log(record: Record) -> Void {
						
						Bindings.print("Error: Logger::log MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					internal func free() -> Void {
						
				// TODO: figure out something smarter
				return; // the semicolon is necessary because Swift is whitespace-agnostic
			
						Bindings.print("Error: Logger::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					

					

					internal func dangle() -> Logger {
        				self.dangling = true
						return self
					}

					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Logger \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Logger \(self.instanceNumber) due to dangle.")
						}
					}
				}

				internal class NativelyImplementedLogger: Logger {
					
					/// Logs the `Record`
					public override func log(record: Record) {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: record.dynamicallyDangledClone().cType!) { (recordPointer: UnsafePointer<LDKRecord>) in
				self.cType!.log(self.cType!.this_arg, recordPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					public override func free() {
						// native call variable prep
						

						
				// natively wrapped traits may not necessarily be properly initialized
				// for now just don't free these things
				// self.cType?.free(self.cType?.this_arg)
				return;
			

						// native method call
						let nativeCallResult = self.cType!.free(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
				}

			}
		