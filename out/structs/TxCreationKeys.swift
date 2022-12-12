
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// The set of public keys which are used in the creation of one commitment transaction.
			/// These are derived from the channel base keys and per-commitment data.
			/// 
			/// A broadcaster key is provided from potential broadcaster of the computed transaction.
			/// A countersignatory key is coming from a protocol participant unable to broadcast the
			/// transaction.
			/// 
			/// These keys are assumed to be good, either because the code derived them from
			/// channel basepoints via the new function, or they were obtained via
			/// CommitmentTransaction.trust().keys() because we trusted the source of the
			/// pre-calculated keys.
			public typealias TxCreationKeys = Bindings.TxCreationKeys

			extension Bindings {
		

				/// The set of public keys which are used in the creation of one commitment transaction.
				/// These are derived from the channel base keys and per-commitment data.
				/// 
				/// A broadcaster key is provided from potential broadcaster of the computed transaction.
				/// A countersignatory key is coming from a protocol participant unable to broadcast the
				/// transaction.
				/// 
				/// These keys are assumed to be good, either because the code derived them from
				/// channel basepoints via the new function, or they were obtained via
				/// CommitmentTransaction.trust().keys() because we trusted the source of the
				/// pre-calculated keys.
				public class TxCreationKeys: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKTxCreationKeys?

					public init(cType: LDKTxCreationKeys) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKTxCreationKeys, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the TxCreationKeys, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = TxCreationKeys_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The broadcaster's per-commitment public key which was used to derive the other keys.
					public func getPerCommitmentPoint() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.danglingClone().cType!) { (thisPtrPointer: UnsafePointer<LDKTxCreationKeys>) in
				TxCreationKeys_get_per_commitment_point(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult).dangle().getValue()
						

						return returnValue
					}
		
					/// The broadcaster's per-commitment public key which was used to derive the other keys.
					public func setPerCommitmentPoint(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = PublicKey(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.danglingClone().cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKTxCreationKeys>) in
				TxCreationKeys_set_per_commitment_point(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The revocation key which is used to allow the broadcaster of the commitment
					/// transaction to provide their counterparty the ability to punish them if they broadcast
					/// an old state.
					public func getRevocationKey() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.danglingClone().cType!) { (thisPtrPointer: UnsafePointer<LDKTxCreationKeys>) in
				TxCreationKeys_get_revocation_key(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult).dangle().getValue()
						

						return returnValue
					}
		
					/// The revocation key which is used to allow the broadcaster of the commitment
					/// transaction to provide their counterparty the ability to punish them if they broadcast
					/// an old state.
					public func setRevocationKey(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = PublicKey(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.danglingClone().cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKTxCreationKeys>) in
				TxCreationKeys_set_revocation_key(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Broadcaster's HTLC Key
					public func getBroadcasterHtlcKey() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.danglingClone().cType!) { (thisPtrPointer: UnsafePointer<LDKTxCreationKeys>) in
				TxCreationKeys_get_broadcaster_htlc_key(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult).dangle().getValue()
						

						return returnValue
					}
		
					/// Broadcaster's HTLC Key
					public func setBroadcasterHtlcKey(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = PublicKey(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.danglingClone().cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKTxCreationKeys>) in
				TxCreationKeys_set_broadcaster_htlc_key(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Countersignatory's HTLC Key
					public func getCountersignatoryHtlcKey() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.danglingClone().cType!) { (thisPtrPointer: UnsafePointer<LDKTxCreationKeys>) in
				TxCreationKeys_get_countersignatory_htlc_key(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult).dangle().getValue()
						

						return returnValue
					}
		
					/// Countersignatory's HTLC Key
					public func setCountersignatoryHtlcKey(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = PublicKey(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.danglingClone().cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKTxCreationKeys>) in
				TxCreationKeys_set_countersignatory_htlc_key(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Broadcaster's Payment Key (which isn't allowed to be spent from for some delay)
					public func getBroadcasterDelayedPaymentKey() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.danglingClone().cType!) { (thisPtrPointer: UnsafePointer<LDKTxCreationKeys>) in
				TxCreationKeys_get_broadcaster_delayed_payment_key(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult).dangle().getValue()
						

						return returnValue
					}
		
					/// Broadcaster's Payment Key (which isn't allowed to be spent from for some delay)
					public func setBroadcasterDelayedPaymentKey(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = PublicKey(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.danglingClone().cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKTxCreationKeys>) in
				TxCreationKeys_set_broadcaster_delayed_payment_key(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new TxCreationKeys given each field
					public init(perCommitmentPointArg: [UInt8], revocationKeyArg: [UInt8], broadcasterHtlcKeyArg: [UInt8], countersignatoryHtlcKeyArg: [UInt8], broadcasterDelayedPaymentKeyArg: [UInt8]) {
						// native call variable prep
						
						let perCommitmentPointArgPrimitiveWrapper = PublicKey(value: perCommitmentPointArg)
				
						let revocationKeyArgPrimitiveWrapper = PublicKey(value: revocationKeyArg)
				
						let broadcasterHtlcKeyArgPrimitiveWrapper = PublicKey(value: broadcasterHtlcKeyArg)
				
						let countersignatoryHtlcKeyArgPrimitiveWrapper = PublicKey(value: countersignatoryHtlcKeyArg)
				
						let broadcasterDelayedPaymentKeyArgPrimitiveWrapper = PublicKey(value: broadcasterDelayedPaymentKeyArg)
				

						// native method call
						let nativeCallResult = TxCreationKeys_new(perCommitmentPointArgPrimitiveWrapper.cType!, revocationKeyArgPrimitiveWrapper.cType!, broadcasterHtlcKeyArgPrimitiveWrapper.cType!, countersignatoryHtlcKeyArgPrimitiveWrapper.cType!, broadcasterDelayedPaymentKeyArgPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						perCommitmentPointArgPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						revocationKeyArgPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						broadcasterHtlcKeyArgPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						countersignatoryHtlcKeyArgPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						broadcasterDelayedPaymentKeyArgPrimitiveWrapper.noOpRetain()
				

						/*
						// return value (do some wrapping)
						let returnValue = TxCreationKeys(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Checks if two TxCreationKeyss contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: TxCreationKeys, b: TxCreationKeys) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.danglingClone().cType!) { (aPointer: UnsafePointer<LDKTxCreationKeys>) in
				
						withUnsafePointer(to: b.danglingClone().cType!) { (bPointer: UnsafePointer<LDKTxCreationKeys>) in
				TxCreationKeys_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the TxCreationKeys
					internal func clone() -> TxCreationKeys {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKTxCreationKeys>) in
				TxCreationKeys_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = TxCreationKeys(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Serialize the TxCreationKeys object into a byte array which can be read by TxCreationKeys_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.danglingClone().cType!) { (objPointer: UnsafePointer<LDKTxCreationKeys>) in
				TxCreationKeys_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// Read a TxCreationKeys from a byte array, created by TxCreationKeys_write
					public class func read(ser: [UInt8]) -> Result_TxCreationKeysDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser).dangle()
				

						// native method call
						let nativeCallResult = TxCreationKeys_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_TxCreationKeysDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Create per-state keys from channel base points and the per-commitment point.
					/// Key set is asymmetric and can't be used as part of counter-signatory set of transactions.
					public class func deriveNew(perCommitmentPoint: [UInt8], broadcasterDelayedPaymentBase: [UInt8], broadcasterHtlcBase: [UInt8], countersignatoryRevocationBase: [UInt8], countersignatoryHtlcBase: [UInt8]) -> Result_TxCreationKeysErrorZ {
						// native call variable prep
						
						let perCommitmentPointPrimitiveWrapper = PublicKey(value: perCommitmentPoint)
				
						let broadcasterDelayedPaymentBasePrimitiveWrapper = PublicKey(value: broadcasterDelayedPaymentBase)
				
						let broadcasterHtlcBasePrimitiveWrapper = PublicKey(value: broadcasterHtlcBase)
				
						let countersignatoryRevocationBasePrimitiveWrapper = PublicKey(value: countersignatoryRevocationBase)
				
						let countersignatoryHtlcBasePrimitiveWrapper = PublicKey(value: countersignatoryHtlcBase)
				

						// native method call
						let nativeCallResult = TxCreationKeys_derive_new(perCommitmentPointPrimitiveWrapper.cType!, broadcasterDelayedPaymentBasePrimitiveWrapper.cType!, broadcasterHtlcBasePrimitiveWrapper.cType!, countersignatoryRevocationBasePrimitiveWrapper.cType!, countersignatoryHtlcBasePrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						perCommitmentPointPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						broadcasterDelayedPaymentBasePrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						broadcasterHtlcBasePrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						countersignatoryRevocationBasePrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						countersignatoryHtlcBasePrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_TxCreationKeysErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Generate per-state keys from channel static keys.
					/// Key set is asymmetric and can't be used as part of counter-signatory set of transactions.
					public class func fromChannelStaticKeys(perCommitmentPoint: [UInt8], broadcasterKeys: ChannelPublicKeys, countersignatoryKeys: ChannelPublicKeys) -> Result_TxCreationKeysErrorZ {
						// native call variable prep
						
						let perCommitmentPointPrimitiveWrapper = PublicKey(value: perCommitmentPoint)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: broadcasterKeys.dynamicallyDangledClone().cType!) { (broadcasterKeysPointer: UnsafePointer<LDKChannelPublicKeys>) in
				
						withUnsafePointer(to: countersignatoryKeys.dynamicallyDangledClone().cType!) { (countersignatoryKeysPointer: UnsafePointer<LDKChannelPublicKeys>) in
				TxCreationKeys_from_channel_static_keys(perCommitmentPointPrimitiveWrapper.cType!, broadcasterKeysPointer, countersignatoryKeysPointer)
						}
				
						}
				

						// cleanup
						
						// for elided types, we need this
						perCommitmentPointPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_TxCreationKeysErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle() -> TxCreationKeys {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> TxCreationKeys {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> TxCreationKeys {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> TxCreationKeys {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> TxCreationKeys {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing TxCreationKeys \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing TxCreationKeys \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		