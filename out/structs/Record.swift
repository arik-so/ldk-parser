
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A Record, unit of logging output with Metadata to enable filtering
			/// Module_path, file, line to inform on log's source
			public typealias Record = Bindings.Record

			extension Bindings {
		

				/// A Record, unit of logging output with Metadata to enable filtering
				/// Module_path, file, line to inform on log's source
				public class Record: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKRecord?

					public init(cType: LDKRecord) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKRecord, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the Record, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Record_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The verbosity level of the message.
					public func getLevel() -> Level {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRecord>) in
				Record_get_level(thisPtrPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Level(value: nativeCallResult)

						return returnValue
					}
		
					/// The verbosity level of the message.
					public func setLevel(val: Level) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRecord>) in
				Record_set_level(thisPtrPointer, val.getCValue())
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The message body.
					public func getArgs() -> String {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRecord>) in
				Record_get_args(thisPtrPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Str(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// The message body.
					public func setArgs(val: String) {
						// native call variable prep
						
						let valPrimitiveWrapper = Str(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRecord>) in
				Record_set_args(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The module path of the message.
					public func getModulePath() -> String {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRecord>) in
				Record_get_module_path(thisPtrPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Str(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// The module path of the message.
					public func setModulePath(val: String) {
						// native call variable prep
						
						let valPrimitiveWrapper = Str(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRecord>) in
				Record_set_module_path(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The source file containing the message.
					public func getFile() -> String {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRecord>) in
				Record_get_file(thisPtrPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Str(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// The source file containing the message.
					public func setFile(val: String) {
						// native call variable prep
						
						let valPrimitiveWrapper = Str(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRecord>) in
				Record_set_file(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The line containing the message.
					public func getLine() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRecord>) in
				Record_get_line(thisPtrPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The line containing the message.
					public func setLine(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRecord>) in
				Record_set_line(thisPtrPointer, val)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a copy of the Record
					internal func clone() -> Record {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKRecord>) in
				Record_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Record(cType: nativeCallResult)

						return returnValue
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					internal func dangle() -> Record {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> Record {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Record \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Record \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		