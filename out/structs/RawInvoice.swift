
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Represents an syntactically correct Invoice for a payment on the lightning network,
			/// but without the signature information.
			/// De- and encoding should not lead to information loss but may lead to different hashes.
			/// 
			/// For methods without docs see the corresponding methods in `Invoice`.
			public typealias RawInvoice = Bindings.RawInvoice

			extension Bindings {
		

				/// Represents an syntactically correct Invoice for a payment on the lightning network,
				/// but without the signature information.
				/// De- and encoding should not lead to information loss but may lead to different hashes.
				/// 
				/// For methods without docs see the corresponding methods in `Invoice`.
				public class RawInvoice: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKRawInvoice?

					public init(cType: LDKRawInvoice) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKRawInvoice, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the RawInvoice, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = RawInvoice_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// data part
					public func getData() -> RawDataPart {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRawInvoice>) in
				RawInvoice_get_data(thisPtrPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = RawDataPart(cType: nativeCallResult)

						return returnValue
					}
		
					/// data part
					public func setData(val: RawDataPart) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRawInvoice>) in
				RawInvoice_set_data(thisPtrPointer, val.cType!)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Checks if two RawInvoices contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKRawInvoice>) in
				
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKRawInvoice>) in
				RawInvoice_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a copy of the RawInvoice
					internal func clone() -> RawInvoice {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKRawInvoice>) in
				RawInvoice_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = RawInvoice(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two RawInvoices contain equal inner contents.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKRawInvoice>) in
				RawInvoice_hash(oPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Calculate the hash of the encoded `RawInvoice` which should be signed.
					public func signableHash() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawInvoice>) in
				RawInvoice_signable_hash(thisArgPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func paymentHash() -> Sha256? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawInvoice>) in
				RawInvoice_payment_hash(thisArgPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKSha256
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						// return value (do some wrapping)
						let returnValue = Sha256(cType: nativeCallResult)

						return returnValue
					}
		
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func description() -> Description? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawInvoice>) in
				RawInvoice_description(thisArgPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKDescription
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						// return value (do some wrapping)
						let returnValue = Description(cType: nativeCallResult)

						return returnValue
					}
		
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func payeePubKey() -> PayeePubKey? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawInvoice>) in
				RawInvoice_payee_pub_key(thisArgPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKPayeePubKey
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						// return value (do some wrapping)
						let returnValue = PayeePubKey(cType: nativeCallResult)

						return returnValue
					}
		
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func descriptionHash() -> Sha256? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawInvoice>) in
				RawInvoice_description_hash(thisArgPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKSha256
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						// return value (do some wrapping)
						let returnValue = Sha256(cType: nativeCallResult)

						return returnValue
					}
		
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func expiryTime() -> ExpiryTime? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawInvoice>) in
				RawInvoice_expiry_time(thisArgPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKExpiryTime
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						// return value (do some wrapping)
						let returnValue = ExpiryTime(cType: nativeCallResult)

						return returnValue
					}
		
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func minFinalCltvExpiry() -> MinFinalCltvExpiry? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawInvoice>) in
				RawInvoice_min_final_cltv_expiry(thisArgPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKMinFinalCltvExpiry
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						// return value (do some wrapping)
						let returnValue = MinFinalCltvExpiry(cType: nativeCallResult)

						return returnValue
					}
		
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func paymentSecret() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawInvoice>) in
				RawInvoice_payment_secret(thisArgPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustPrimitiveWrapper
				// Type: LDKThirtyTwoBytes
			
						if nativeCallResult.data == Bindings.arrayToUInt8Tuple32(array: [UInt8](repeating: 0, count: 32)) {
							return nil
            			}
					

						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func features() -> InvoiceFeatures? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawInvoice>) in
				RawInvoice_features(thisArgPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKInvoiceFeatures
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						// return value (do some wrapping)
						let returnValue = InvoiceFeatures(cType: nativeCallResult)

						return returnValue
					}
		
					/// 
					public func privateRoutes() -> [PrivateRoute] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawInvoice>) in
				RawInvoice_private_routes(thisArgPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_PrivateRouteZ(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// 
					public func amountPicoBtc() -> UInt64? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawInvoice>) in
				RawInvoice_amount_pico_btc(thisArgPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// 
					public func currency() -> Currency {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawInvoice>) in
				RawInvoice_currency(thisArgPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Currency(value: nativeCallResult)

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
		

					internal func dangle() -> RawInvoice {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> RawInvoice {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing RawInvoice \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing RawInvoice \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		