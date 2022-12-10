
			import Foundation
			// #if canImport(os)
			//     import os
			// #endif

			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			#if os(Linux)
				import Glibc
			#else
				import Darwin.C
			#endif

			open class NativeTypeWrapper: Hashable {

				enum AnchorError: Error {
					case cyclicReference
				}

				private static var globalInstanceCounter: UInt = 0
				internal let globalInstanceNumber: UInt
				internal var dangling = false
				internal private(set) var anchors: Set<NativeTypeWrapper> = []
				internal var pointerDebugDescription: String? = nil

				init(conflictAvoidingVariableName: UInt) {
					Self.globalInstanceCounter += 1
					self.globalInstanceNumber = Self.globalInstanceCounter
				}

				internal func addAnchor(anchor: NativeTypeWrapper) throws {
					if self.hasAnchor(candidate: anchor) {
						throw AnchorError.cyclicReference
					}
					self.anchors.insert(anchor)
				}

				internal func hasAnchor(candidate: NativeTypeWrapper) -> Bool {
					if self.anchors.count == 0 {
						return false
					}
					if self.anchors.contains(candidate) {
						return true
					}
					for currentAnchor in self.anchors {
						if currentAnchor.hasAnchor(candidate: candidate) {
							return true
						}
					}
					return false
				}

				internal func noOpRetain() {
					/* there to make sure object gets retained until after this call */
				}

				public static func == (lhs: NativeTypeWrapper, rhs: NativeTypeWrapper) -> Bool {
					return (lhs.globalInstanceNumber == rhs.globalInstanceNumber)
				}

				public func hash(into hasher: inout Hasher) {
					hasher.combine(globalInstanceNumber)
				}

			}

			open class NativeTraitWrapper: NativeTypeWrapper {

				public func activate() -> Self {
					Bindings.cacheInstance(instance: self)
					return self
				}

				public func activateOnce() -> Self {
					Bindings.cacheInstance(instance: self)
					return self
				}

			}

			public class Bindings {

				internal static var suspendFreedom = false

				internal static var minimumPrintSeverity: PrintSeverity = .WARNING
				// #if canImport(os)
				//     internal static let logger = os.Logger(subsystem: Bundle.main.bundleIdentifier!, category: "ldk")
				// #endif

				public enum PrintSeverity: UInt {
					case DEBUG = 0
					case WARNING = 1
					case ERROR = 2
				}

				internal class func print(_ string: String, severity: PrintSeverity = .DEBUG) {
					if severity.rawValue >= Self.minimumPrintSeverity.rawValue {

						// Swift.print(string)
						NSLog(string)
						fflush(stdout)

						// if #available(iOS 14.0, *) {
						// 	#if canImport(os)
						// 	if severity == Self.PrintSeverity.DEBUG {
						// 		logger.debug("\(string)")
						// 	}else if severity == Self.PrintSeverity.WARNING {
						// 		logger.warning("\(string)")
						// 	}else if severity == Self.PrintSeverity.ERROR {
						// 		logger.error("\(string)")
						// 	}else {
						// 		logger.log("\(string)")
						// 	}
						// 	#else
						// 	Swift.print(string)
						// 	#endif
						// } else {
						// 	// Fallback on earlier versions
						// 	Swift.print(string)
						// }
					}
				}

				public class func setLogThreshold(severity: PrintSeverity){
					Self.minimumPrintSeverity = severity
				}

				static var nativelyExposedInstances = [UInt: NativeTraitWrapper]()
				static var nativelyExposedInstanceReferenceCounter = [UInt: Int]()

				public class func cacheInstance(instance: NativeTraitWrapper, countIdempotently: Bool = false) {
					let key = instance.globalInstanceNumber
					let referenceCount = (Self.nativelyExposedInstanceReferenceCounter[key] ?? 0) + 1
					if (!countIdempotently || referenceCount == 1){
						// if we count non-idempotently, always update the counter
						// otherwise, only update the counter the first time
						Self.nativelyExposedInstanceReferenceCounter[key] = referenceCount
					}
					if referenceCount == 1 {
						print("Caching global instance \(key). Cached instance count: \(nativelyExposedInstanceReferenceCounter.count)")
						Self.nativelyExposedInstances[key] = instance
					}
				}

				public class func instanceToPointer(instance: NativeTraitWrapper) -> UnsafeMutableRawPointer {
					let key = instance.globalInstanceNumber
					let pointer = UnsafeMutableRawPointer(bitPattern: key)!
					// don't automatically cache the trait instance
					Self.nativelyExposedInstances[instance.globalInstanceNumber] = instance
					return pointer
				}

				public class func pointerToInstance<T: NativeTraitWrapper>(pointer: UnsafeRawPointer, sourceMarker: String?) -> T{
					let key = UInt(bitPattern: pointer)
					let referenceCount = Self.nativelyExposedInstanceReferenceCounter[key] ?? 0
					if referenceCount < 1 {
						print("Bad lookup: non-positive reference count for instance \(key): \(referenceCount)!", severity: .ERROR)
					}
					let value = Self.nativelyExposedInstances[key] as! T
					return value
				}

				public class func removeInstancePointer(instance: NativeTraitWrapper) -> Bool {
					let key = instance.globalInstanceNumber
					let referenceCount = (Self.nativelyExposedInstanceReferenceCounter[key] ?? 0) - 1
					Self.nativelyExposedInstanceReferenceCounter[key] = referenceCount
					if referenceCount == 0 {
						print("Uncaching global instance \(key)")
						// TODO: fix counting
						// Self.nativelyExposedInstances.removeValue(forKey: key)
						// instance.pointerDebugDescription = nil
					} else if referenceCount < 0 {
						print("Bad uncache: negative reference count (\(referenceCount)) for instance \(key)!", severity: .ERROR)
					}
					return true
				}

				/*
				public class func clearInstancePointers() {
					for (_, currentInstance) in Self.nativelyExposedInstances {
						currentInstance.pointerDebugDescription = nil
					}
					Self.nativelyExposedInstances.removeAll()
				}
				*/

				public class func UnsafeIntPointer_to_string(nativeType: UnsafePointer<Int8>) -> String {
					let string = String(cString: nativeType)
					return string
				}

				public class func string_to_unsafe_int8_pointer(string: String) -> UnsafePointer<Int8> {
					let count = string.utf8CString.count
					let result: UnsafeMutableBufferPointer<Int8> = UnsafeMutableBufferPointer<Int8>.allocate(capacity: count)
					_ = result.initialize(from: string.utf8CString)
					let mutablePointer = result.baseAddress!
					return UnsafePointer<Int8>(mutablePointer)
				}

				public class func string_to_unsafe_uint8_pointer(string: String) -> UnsafePointer<UInt8> {
					let stringData = string.data(using: .utf8)
					let dataMutablePointer = UnsafeMutablePointer<UInt8>.allocate(capacity: string.count)
					stringData?.copyBytes(to: dataMutablePointer, count: string.count)

					return UnsafePointer<UInt8>(dataMutablePointer)
				}

				
				/// 
				public class func swiftLdkGetCompiledVersion() -> String {
					// native call variable prep
					

					// native method call
					let nativeCallResult = _ldk_get_compiled_version()

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Str(cType: nativeCallResult).getValue()
					

					return returnValue
				}
		
				/// 
				public class func swiftLdkCBindingsGetCompiledVersion() -> String {
					// native call variable prep
					

					// native method call
					let nativeCallResult = _ldk_c_bindings_get_compiled_version()

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Str(cType: nativeCallResult).getValue()
					

					return returnValue
				}
		
				/// Creates a digital signature of a message given a SecretKey, like the node's secret.
				/// A receiver knowing the PublicKey (e.g. the node's id) and the message can be sure that the signature was generated by the caller.
				/// Signatures are EC recoverable, meaning that given the message and the signature the PublicKey of the signer can be extracted.
				public class func swiftSign(msg: [UInt8], sk: [UInt8]) -> Result_StringErrorZ {
					// native call variable prep
					
					let msgPrimitiveWrapper = u8slice(value: msg)
				
					let tupledSk = Bindings.arrayToUInt8Tuple32(array: sk)
				

					// native method call
					let nativeCallResult = 
					withUnsafePointer(to: tupledSk) { (tupledSkPointer: UnsafePointer<UInt8Tuple32>) in
				sign(msgPrimitiveWrapper.cType!, tupledSkPointer)
					}
				

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Result_StringErrorZ(cType: nativeCallResult)
					

					return returnValue
				}
		
				/// Recovers the PublicKey of the signer of the message given the message and the signature.
				public class func swiftRecoverPk(msg: [UInt8], sig: String) -> Result_PublicKeyErrorZ {
					// native call variable prep
					
					let msgPrimitiveWrapper = u8slice(value: msg)
				
					let sigPrimitiveWrapper = Str(value: sig)
				
					sigPrimitiveWrapper.cType!.chars_is_owned = false
				

					// native method call
					let nativeCallResult = recover_pk(msgPrimitiveWrapper.cType!, sigPrimitiveWrapper.cType!)

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Result_PublicKeyErrorZ(cType: nativeCallResult)
					

					return returnValue
				}
		
				/// Verifies a message was signed by a PrivateKey that derives to a given PublicKey, given a message, a signature,
				/// and the PublicKey.
				public class func swiftVerify(msg: [UInt8], sig: String, pk: [UInt8]) -> Bool {
					// native call variable prep
					
					let msgPrimitiveWrapper = u8slice(value: msg)
				
					let sigPrimitiveWrapper = Str(value: sig)
				
					sigPrimitiveWrapper.cType!.chars_is_owned = false
				
					let pkPrimitiveWrapper = PublicKey(value: pk)
				

					// native method call
					let nativeCallResult = verify(msgPrimitiveWrapper.cType!, sigPrimitiveWrapper.cType!, pkPrimitiveWrapper.cType!)

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = nativeCallResult
					

					return returnValue
				}
		
				/// Construct the invoice's HRP and signatureless data into a preimage to be hashed.
				public class func swiftConstructInvoicePreimage(hrpBytes: [UInt8], dataWithoutSignature: [UInt8]) -> [UInt8] {
					// native call variable prep
					
					let hrpBytesPrimitiveWrapper = u8slice(value: hrpBytes)
				
					let dataWithoutSignatureVector = Vec_u5Z(array: dataWithoutSignature)
				

					// native method call
					let nativeCallResult = construct_invoice_preimage(hrpBytesPrimitiveWrapper.cType!, dataWithoutSignatureVector.cType!)

					// cleanup
					
					// dataWithoutSignatureVector.noOpRetain()
				

					
					// return value (do some wrapping)
					let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()
					

					return returnValue
				}
		
				/// Fetches the set of [`NodeFeatures`] flags which are provided by or required by
				/// [`ChannelManager`].
				public class func swiftProvidedNodeFeatures() -> NodeFeatures {
					// native call variable prep
					

					// native method call
					let nativeCallResult = provided_node_features()

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = NodeFeatures(cType: nativeCallResult)
					

					return returnValue
				}
		
				/// Fetches the set of [`ChannelFeatures`] flags which are provided by or required by
				/// [`ChannelManager`].
				public class func swiftProvidedChannelFeatures() -> ChannelFeatures {
					// native call variable prep
					

					// native method call
					let nativeCallResult = provided_channel_features()

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = ChannelFeatures(cType: nativeCallResult)
					

					return returnValue
				}
		
				/// Fetches the set of [`InitFeatures`] flags which are provided by or required by
				/// [`ChannelManager`].
				public class func swiftProvidedInitFeatures() -> InitFeatures {
					// native call variable prep
					

					// native method call
					let nativeCallResult = provided_init_features()

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = InitFeatures(cType: nativeCallResult)
					

					return returnValue
				}
		
				/// Equivalent to [`crate::ln::channelmanager::ChannelManager::create_inbound_payment`], but no
				/// `ChannelManager` is required. Useful for generating invoices for [phantom node payments] without
				/// a `ChannelManager`.
				/// 
				/// `keys` is generated by calling [`KeysInterface::get_inbound_payment_key_material`] and then
				/// calling [`ExpandedKey::new`] with its result. It is recommended to cache this value and not
				/// regenerate it for each new inbound payment.
				/// 
				/// `current_time` is a Unix timestamp representing the current time.
				/// 
				/// [phantom node payments]: crate::chain::keysinterface::PhantomKeysManager
				public class func swiftCreate(keys: ExpandedKey, minValueMsat: UInt64?, invoiceExpiryDeltaSecs: UInt32, keysManager: KeysInterface, currentTime: UInt64) -> Result_C2Tuple_PaymentHashPaymentSecretZNoneZ {
					// native call variable prep
					
					let minValueMsatOption = Option_u64Z(some: minValueMsat)
				

					// native method call
					let nativeCallResult = 
					withUnsafePointer(to: keys.cType!) { (keysPointer: UnsafePointer<LDKExpandedKey>) in
				
					withUnsafePointer(to: keysManager.activate().cType!) { (keysManagerPointer: UnsafePointer<LDKKeysInterface>) in
				create(keysPointer, minValueMsatOption.cType!, invoiceExpiryDeltaSecs, keysManagerPointer, currentTime)
					}
				
					}
				

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Result_C2Tuple_PaymentHashPaymentSecretZNoneZ(cType: nativeCallResult)
					

					return returnValue
				}
		
				/// Equivalent to [`crate::ln::channelmanager::ChannelManager::create_inbound_payment_for_hash`],
				/// but no `ChannelManager` is required. Useful for generating invoices for [phantom node payments]
				/// without a `ChannelManager`.
				/// 
				/// See [`create`] for information on the `keys` and `current_time` parameters.
				/// 
				/// [phantom node payments]: crate::chain::keysinterface::PhantomKeysManager
				public class func swiftCreateFromHash(keys: ExpandedKey, minValueMsat: UInt64?, paymentHash: [UInt8], invoiceExpiryDeltaSecs: UInt32, currentTime: UInt64) -> Result_PaymentSecretNoneZ {
					// native call variable prep
					
					let minValueMsatOption = Option_u64Z(some: minValueMsat)
				
					let paymentHashPrimitiveWrapper = ThirtyTwoBytes(value: paymentHash)
				

					// native method call
					let nativeCallResult = 
					withUnsafePointer(to: keys.cType!) { (keysPointer: UnsafePointer<LDKExpandedKey>) in
				create_from_hash(keysPointer, minValueMsatOption.cType!, paymentHashPrimitiveWrapper.cType!, invoiceExpiryDeltaSecs, currentTime)
					}
				

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Result_PaymentSecretNoneZ(cType: nativeCallResult)
					

					return returnValue
				}
		
				/// Gets the weight for an HTLC-Success transaction.
				public class func swiftHtlcSuccessTxWeight(optAnchors: Bool) -> UInt64 {
					// native call variable prep
					

					// native method call
					let nativeCallResult = htlc_success_tx_weight(optAnchors)

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = nativeCallResult
					

					return returnValue
				}
		
				/// Gets the weight for an HTLC-Timeout transaction.
				public class func swiftHtlcTimeoutTxWeight(optAnchors: Bool) -> UInt64 {
					// native call variable prep
					

					// native method call
					let nativeCallResult = htlc_timeout_tx_weight(optAnchors)

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = nativeCallResult
					

					return returnValue
				}
		
				/// Build the commitment secret from the seed and the commitment number
				public class func swiftBuildCommitmentSecret(commitmentSeed: [UInt8], idx: UInt64) -> [UInt8] {
					// native call variable prep
					
					let tupledCommitmentSeed = Bindings.arrayToUInt8Tuple32(array: commitmentSeed)
				

					// native method call
					let nativeCallResult = 
					withUnsafePointer(to: tupledCommitmentSeed) { (tupledCommitmentSeedPointer: UnsafePointer<UInt8Tuple32>) in
				build_commitment_secret(tupledCommitmentSeedPointer, idx)
					}
				

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = ThirtyTwoBytes(cType: nativeCallResult).getValue()
					

					return returnValue
				}
		
				/// Build a closing transaction
				public class func swiftBuildClosingTransaction(toHolderValueSat: UInt64, toCounterpartyValueSat: UInt64, toHolderScript: [UInt8], toCounterpartyScript: [UInt8], fundingOutpoint: OutPoint) -> [UInt8] {
					// native call variable prep
					
					let toHolderScriptVector = Vec_u8Z(array: toHolderScript)
				
					let toCounterpartyScriptVector = Vec_u8Z(array: toCounterpartyScript)
				

					// native method call
					let nativeCallResult = build_closing_transaction(toHolderValueSat, toCounterpartyValueSat, toHolderScriptVector.cType!, toCounterpartyScriptVector.cType!, fundingOutpoint.dynamicallyDangledClone().cType!)

					// cleanup
					
					// toHolderScriptVector.noOpRetain()
				
					// toCounterpartyScriptVector.noOpRetain()
				

					
					// return value (do some wrapping)
					let returnValue = Transaction(cType: nativeCallResult).getValue()
					

					return returnValue
				}
		
				/// Derives a per-commitment-transaction private key (eg an htlc key or delayed_payment key)
				/// from the base secret and the per_commitment_point.
				/// 
				/// Note that this is infallible iff we trust that at least one of the two input keys are randomly
				/// generated (ie our own).
				public class func swiftDerivePrivateKey(perCommitmentPoint: [UInt8], baseSecret: [UInt8]) -> Result_SecretKeyErrorZ {
					// native call variable prep
					
					let perCommitmentPointPrimitiveWrapper = PublicKey(value: perCommitmentPoint)
				
					let tupledBaseSecret = Bindings.arrayToUInt8Tuple32(array: baseSecret)
				

					// native method call
					let nativeCallResult = 
					withUnsafePointer(to: tupledBaseSecret) { (tupledBaseSecretPointer: UnsafePointer<UInt8Tuple32>) in
				derive_private_key(perCommitmentPointPrimitiveWrapper.cType!, tupledBaseSecretPointer)
					}
				

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Result_SecretKeyErrorZ(cType: nativeCallResult)
					

					return returnValue
				}
		
				/// Derives a per-commitment-transaction public key (eg an htlc key or a delayed_payment key)
				/// from the base point and the per_commitment_key. This is the public equivalent of
				/// derive_private_key - using only public keys to derive a public key instead of private keys.
				/// 
				/// Note that this is infallible iff we trust that at least one of the two input keys are randomly
				/// generated (ie our own).
				public class func swiftDerivePublicKey(perCommitmentPoint: [UInt8], basePoint: [UInt8]) -> Result_PublicKeyErrorZ {
					// native call variable prep
					
					let perCommitmentPointPrimitiveWrapper = PublicKey(value: perCommitmentPoint)
				
					let basePointPrimitiveWrapper = PublicKey(value: basePoint)
				

					// native method call
					let nativeCallResult = derive_public_key(perCommitmentPointPrimitiveWrapper.cType!, basePointPrimitiveWrapper.cType!)

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Result_PublicKeyErrorZ(cType: nativeCallResult)
					

					return returnValue
				}
		
				/// Derives a per-commitment-transaction revocation key from its constituent parts.
				/// 
				/// Only the cheating participant owns a valid witness to propagate a revoked
				/// commitment transaction, thus per_commitment_secret always come from cheater
				/// and revocation_base_secret always come from punisher, which is the broadcaster
				/// of the transaction spending with this key knowledge.
				/// 
				/// Note that this is infallible iff we trust that at least one of the two input keys are randomly
				/// generated (ie our own).
				public class func swiftDerivePrivateRevocationKey(perCommitmentSecret: [UInt8], countersignatoryRevocationBaseSecret: [UInt8]) -> Result_SecretKeyErrorZ {
					// native call variable prep
					
					let tupledPerCommitmentSecret = Bindings.arrayToUInt8Tuple32(array: perCommitmentSecret)
				
					let tupledCountersignatoryRevocationBaseSecret = Bindings.arrayToUInt8Tuple32(array: countersignatoryRevocationBaseSecret)
				

					// native method call
					let nativeCallResult = 
					withUnsafePointer(to: tupledPerCommitmentSecret) { (tupledPerCommitmentSecretPointer: UnsafePointer<UInt8Tuple32>) in
				
					withUnsafePointer(to: tupledCountersignatoryRevocationBaseSecret) { (tupledCountersignatoryRevocationBaseSecretPointer: UnsafePointer<UInt8Tuple32>) in
				derive_private_revocation_key(tupledPerCommitmentSecretPointer, tupledCountersignatoryRevocationBaseSecretPointer)
					}
				
					}
				

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Result_SecretKeyErrorZ(cType: nativeCallResult)
					

					return returnValue
				}
		
				/// Derives a per-commitment-transaction revocation public key from its constituent parts. This is
				/// the public equivalend of derive_private_revocation_key - using only public keys to derive a
				/// public key instead of private keys.
				/// 
				/// Only the cheating participant owns a valid witness to propagate a revoked
				/// commitment transaction, thus per_commitment_point always come from cheater
				/// and revocation_base_point always come from punisher, which is the broadcaster
				/// of the transaction spending with this key knowledge.
				/// 
				/// Note that this is infallible iff we trust that at least one of the two input keys are randomly
				/// generated (ie our own).
				public class func swiftDerivePublicRevocationKey(perCommitmentPoint: [UInt8], countersignatoryRevocationBasePoint: [UInt8]) -> Result_PublicKeyErrorZ {
					// native call variable prep
					
					let perCommitmentPointPrimitiveWrapper = PublicKey(value: perCommitmentPoint)
				
					let countersignatoryRevocationBasePointPrimitiveWrapper = PublicKey(value: countersignatoryRevocationBasePoint)
				

					// native method call
					let nativeCallResult = derive_public_revocation_key(perCommitmentPointPrimitiveWrapper.cType!, countersignatoryRevocationBasePointPrimitiveWrapper.cType!)

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Result_PublicKeyErrorZ(cType: nativeCallResult)
					

					return returnValue
				}
		
				/// A script either spendable by the revocation
				/// key or the broadcaster_delayed_payment_key and satisfying the relative-locktime OP_CSV constrain.
				/// Encumbering a `to_holder` output on a commitment transaction or 2nd-stage HTLC transactions.
				public class func swiftGetRevokeableRedeemscript(revocationKey: [UInt8], contestDelay: UInt16, broadcasterDelayedPaymentKey: [UInt8]) -> [UInt8] {
					// native call variable prep
					
					let revocationKeyPrimitiveWrapper = PublicKey(value: revocationKey)
				
					let broadcasterDelayedPaymentKeyPrimitiveWrapper = PublicKey(value: broadcasterDelayedPaymentKey)
				

					// native method call
					let nativeCallResult = get_revokeable_redeemscript(revocationKeyPrimitiveWrapper.cType!, contestDelay, broadcasterDelayedPaymentKeyPrimitiveWrapper.cType!)

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()
					

					return returnValue
				}
		
				/// Gets the witness redeemscript for an HTLC output in a commitment transaction. Note that htlc
				/// does not need to have its previous_output_index filled.
				public class func swiftGetHtlcRedeemscript(htlc: HTLCOutputInCommitment, optAnchors: Bool, keys: TxCreationKeys) -> [UInt8] {
					// native call variable prep
					

					// native method call
					let nativeCallResult = 
					withUnsafePointer(to: htlc.cType!) { (htlcPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
				
					withUnsafePointer(to: keys.cType!) { (keysPointer: UnsafePointer<LDKTxCreationKeys>) in
				get_htlc_redeemscript(htlcPointer, optAnchors, keysPointer)
					}
				
					}
				

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()
					

					return returnValue
				}
		
				/// Gets the redeemscript for a funding output from the two funding public keys.
				/// Note that the order of funding public keys does not matter.
				public class func swiftMakeFundingRedeemscript(broadcaster: [UInt8], countersignatory: [UInt8]) -> [UInt8] {
					// native call variable prep
					
					let broadcasterPrimitiveWrapper = PublicKey(value: broadcaster)
				
					let countersignatoryPrimitiveWrapper = PublicKey(value: countersignatory)
				

					// native method call
					let nativeCallResult = make_funding_redeemscript(broadcasterPrimitiveWrapper.cType!, countersignatoryPrimitiveWrapper.cType!)

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()
					

					return returnValue
				}
		
				/// Builds an unsigned HTLC-Success or HTLC-Timeout transaction from the given channel and HTLC
				/// parameters. This is used by [`TrustedCommitmentTransaction::get_htlc_sigs`] to fetch the
				/// transaction which needs signing, and can be used to construct an HTLC transaction which is
				/// broadcastable given a counterparty HTLC signature.
				/// 
				/// Panics if htlc.transaction_output_index.is_none() (as such HTLCs do not appear in the
				/// commitment transaction).
				public class func swiftBuildHtlcTransaction(commitmentTxid: [UInt8], feeratePerKw: UInt32, contestDelay: UInt16, htlc: HTLCOutputInCommitment, optAnchors: Bool, broadcasterDelayedPaymentKey: [UInt8], revocationKey: [UInt8]) -> [UInt8] {
					// native call variable prep
					
					let tupledCommitmentTxid = Bindings.arrayToUInt8Tuple32(array: commitmentTxid)
				
					let broadcasterDelayedPaymentKeyPrimitiveWrapper = PublicKey(value: broadcasterDelayedPaymentKey)
				
					let revocationKeyPrimitiveWrapper = PublicKey(value: revocationKey)
				

					// native method call
					let nativeCallResult = 
					withUnsafePointer(to: tupledCommitmentTxid) { (tupledCommitmentTxidPointer: UnsafePointer<UInt8Tuple32>) in
				
					withUnsafePointer(to: htlc.cType!) { (htlcPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
				build_htlc_transaction(tupledCommitmentTxidPointer, feeratePerKw, contestDelay, htlcPointer, optAnchors, broadcasterDelayedPaymentKeyPrimitiveWrapper.cType!, revocationKeyPrimitiveWrapper.cType!)
					}
				
					}
				

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Transaction(cType: nativeCallResult).getValue()
					

					return returnValue
				}
		
				/// Gets the witnessScript for an anchor output from the funding public key.
				/// The witness in the spending input must be:
				/// <BIP 143 funding_signature>
				/// After 16 blocks of confirmation, an alternative satisfying witness could be:
				/// <>
				/// (empty vector required to satisfy compliance with MINIMALIF-standard rule)
				public class func swiftGetAnchorRedeemscript(fundingPubkey: [UInt8]) -> [UInt8] {
					// native call variable prep
					
					let fundingPubkeyPrimitiveWrapper = PublicKey(value: fundingPubkey)
				

					// native method call
					let nativeCallResult = get_anchor_redeemscript(fundingPubkeyPrimitiveWrapper.cType!)

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()
					

					return returnValue
				}
		
				/// Commitment transaction numbers which appear in the transactions themselves are XOR'd with a
				/// shared secret first. This prevents on-chain observers from discovering how many commitment
				/// transactions occurred in a channel before it was closed.
				/// 
				/// This function gets the shared secret from relevant channel public keys and can be used to
				/// \"decrypt\" the commitment transaction number given a commitment transaction on-chain.
				public class func swiftGetCommitmentTransactionNumberObscureFactor(broadcasterPaymentBasepoint: [UInt8], countersignatoryPaymentBasepoint: [UInt8], outboundFromBroadcaster: Bool) -> UInt64 {
					// native call variable prep
					
					let broadcasterPaymentBasepointPrimitiveWrapper = PublicKey(value: broadcasterPaymentBasepoint)
				
					let countersignatoryPaymentBasepointPrimitiveWrapper = PublicKey(value: countersignatoryPaymentBasepoint)
				

					// native method call
					let nativeCallResult = get_commitment_transaction_number_obscure_factor(broadcasterPaymentBasepointPrimitiveWrapper.cType!, countersignatoryPaymentBasepointPrimitiveWrapper.cType!, outboundFromBroadcaster)

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = nativeCallResult
					

					return returnValue
				}
		
				/// Finds a route from us (payer) to the given target node (payee).
				/// 
				/// If the payee provided features in their invoice, they should be provided via `params.payee`.
				/// Without this, MPP will only be used if the payee's features are available in the network graph.
				/// 
				/// Private routing paths between a public node and the target may be included in `params.payee`.
				/// 
				/// If some channels aren't announced, it may be useful to fill in `first_hops` with the results
				/// from [`ChannelManager::list_usable_channels`]. If it is filled in, the view of these channels
				/// from `network_graph` will be ignored, and only those in `first_hops` will be used.
				/// 
				/// The fees on channels from us to the next hop are ignored as they are assumed to all be equal.
				/// However, the enabled/disabled bit on such channels as well as the `htlc_minimum_msat` /
				/// `htlc_maximum_msat` *are* checked as they may change based on the receiving node.
				/// 
				/// # Note
				/// 
				/// May be used to re-compute a [`Route`] when handling a [`Event::PaymentPathFailed`]. Any
				/// adjustments to the [`NetworkGraph`] and channel scores should be made prior to calling this
				/// function.
				/// 
				/// # Panics
				/// 
				/// Panics if first_hops contains channels without short_channel_ids;
				/// [`ChannelManager::list_usable_channels`] will never include such channels.
				/// 
				/// [`ChannelManager::list_usable_channels`]: crate::ln::channelmanager::ChannelManager::list_usable_channels
				/// [`Event::PaymentPathFailed`]: crate::util::events::Event::PaymentPathFailed
				/// [`NetworkGraph`]: crate::routing::gossip::NetworkGraph
				/// 
				/// Note that first_hops (or a relevant inner pointer) may be NULL or all-0s to represent None
				public class func swiftFindRoute(ourNodePubkey: [UInt8], routeParams: RouteParameters, networkGraph: NetworkGraph, firstHops: [ChannelDetails]?, logger: Logger, scorer: Score, randomSeedBytes: [UInt8]) -> Result_RouteLightningErrorZ {
					// native call variable prep
					
					let ourNodePubkeyPrimitiveWrapper = PublicKey(value: ourNodePubkey)
				
				var firstHopsVectorPointer: UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>? = nil
				if let firstHops = firstHops {
					
					let firstHopsVector = Vec_ChannelDetailsZ(array: firstHops)
				
					firstHopsVectorPointer = UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>.allocate(capacity: 1)
					firstHopsVectorPointer!.initialize(to: firstHopsVector.cType!)
				}
				
					let tupledRandomSeedBytes = Bindings.arrayToUInt8Tuple32(array: randomSeedBytes)
				

					// native method call
					let nativeCallResult = 
					withUnsafePointer(to: routeParams.cType!) { (routeParamsPointer: UnsafePointer<LDKRouteParameters>) in
				
					withUnsafePointer(to: networkGraph.cType!) { (networkGraphPointer: UnsafePointer<LDKNetworkGraph>) in
				
					withUnsafePointer(to: scorer.activate().cType!) { (scorerPointer: UnsafePointer<LDKScore>) in
				
					withUnsafePointer(to: tupledRandomSeedBytes) { (tupledRandomSeedBytesPointer: UnsafePointer<UInt8Tuple32>) in
				find_route(ourNodePubkeyPrimitiveWrapper.cType!, routeParamsPointer, networkGraphPointer, firstHopsVectorPointer, logger.activate().cType!, scorerPointer, tupledRandomSeedBytesPointer)
					}
				
					}
				
					}
				
					}
				

					// cleanup
					
					// firstHopsVector.noOpRetain()
				

					
					// return value (do some wrapping)
					let returnValue = Result_RouteLightningErrorZ(cType: nativeCallResult)
					

					return returnValue
				}
		
				/// Construct a route from us (payer) to the target node (payee) via the given hops (which should
				/// exclude the payer, but include the payee). This may be useful, e.g., for probing the chosen path.
				/// 
				/// Re-uses logic from `find_route`, so the restrictions described there also apply here.
				public class func swiftBuildRouteFromHops(ourNodePubkey: [UInt8], hops: [[UInt8]], routeParams: RouteParameters, networkGraph: NetworkGraph, logger: Logger, randomSeedBytes: [UInt8]) -> Result_RouteLightningErrorZ {
					// native call variable prep
					
					let ourNodePubkeyPrimitiveWrapper = PublicKey(value: ourNodePubkey)
				
					let hopsVector = Vec_PublicKeyZ(array: hops)
				
					let tupledRandomSeedBytes = Bindings.arrayToUInt8Tuple32(array: randomSeedBytes)
				

					// native method call
					let nativeCallResult = 
					withUnsafePointer(to: routeParams.cType!) { (routeParamsPointer: UnsafePointer<LDKRouteParameters>) in
				
					withUnsafePointer(to: networkGraph.cType!) { (networkGraphPointer: UnsafePointer<LDKNetworkGraph>) in
				
					withUnsafePointer(to: tupledRandomSeedBytes) { (tupledRandomSeedBytesPointer: UnsafePointer<UInt8Tuple32>) in
				build_route_from_hops(ourNodePubkeyPrimitiveWrapper.cType!, hopsVector.cType!, routeParamsPointer, networkGraphPointer, logger.activate().cType!, tupledRandomSeedBytesPointer)
					}
				
					}
				
					}
				

					// cleanup
					
					// hopsVector.noOpRetain()
				

					
					// return value (do some wrapping)
					let returnValue = Result_RouteLightningErrorZ(cType: nativeCallResult)
					

					return returnValue
				}
		
				/// Utility to create an invoice that can be paid to one of multiple nodes, or a \"phantom invoice.\"
				/// See [`PhantomKeysManager`] for more information on phantom node payments.
				/// 
				/// `phantom_route_hints` parameter:
				/// * Contains channel info for all nodes participating in the phantom invoice
				/// * Entries are retrieved from a call to [`ChannelManager::get_phantom_route_hints`] on each
				/// participating node
				/// * It is fine to cache `phantom_route_hints` and reuse it across invoices, as long as the data is
				/// updated when a channel becomes disabled or closes
				/// * Note that if too many channels are included in [`PhantomRouteHints::channels`], the invoice
				/// may be too long for QR code scanning. To fix this, `PhantomRouteHints::channels` may be pared
				/// down
				/// 
				/// `payment_hash` can be specified if you have a specific need for a custom payment hash (see the difference
				/// between [`ChannelManager::create_inbound_payment`] and [`ChannelManager::create_inbound_payment_for_hash`]).
				/// If `None` is provided for `payment_hash`, then one will be created.
				/// 
				/// `invoice_expiry_delta_secs` describes the number of seconds that the invoice is valid for
				/// in excess of the current time.
				/// 
				/// Note that the provided `keys_manager`'s `KeysInterface` implementation must support phantom
				/// invoices in its `sign_invoice` implementation ([`PhantomKeysManager`] satisfies this
				/// requirement).
				/// 
				/// [`PhantomKeysManager`]: lightning::chain::keysinterface::PhantomKeysManager
				/// [`ChannelManager::get_phantom_route_hints`]: lightning::ln::channelmanager::ChannelManager::get_phantom_route_hints
				/// [`ChannelManager::create_inbound_payment`]: lightning::ln::channelmanager::ChannelManager::create_inbound_payment
				/// [`ChannelManager::create_inbound_payment_for_hash`]: lightning::ln::channelmanager::ChannelManager::create_inbound_payment_for_hash
				/// [`PhantomRouteHints::channels`]: lightning::ln::channelmanager::PhantomRouteHints::channels
				/// 
				/// Note that payment_hash (or a relevant inner pointer) may be NULL or all-0s to represent None
				public class func swiftCreatePhantomInvoice(amtMsat: UInt64?, paymentHash: [UInt8], description: String, invoiceExpiryDeltaSecs: UInt32, phantomRouteHints: [PhantomRouteHints], keysManager: KeysInterface, logger: Logger, network: Currency) -> Result_InvoiceSignOrCreationErrorZ {
					// native call variable prep
					
					let amtMsatOption = Option_u64Z(some: amtMsat)
				
					let paymentHashPrimitiveWrapper = ThirtyTwoBytes(value: paymentHash)
				
					let descriptionPrimitiveWrapper = Str(value: description)
				
					descriptionPrimitiveWrapper.cType!.chars_is_owned = false
				
					let phantomRouteHintsVector = Vec_PhantomRouteHintsZ(array: phantomRouteHints)
				

					// native method call
					let nativeCallResult = create_phantom_invoice(amtMsatOption.cType!, paymentHashPrimitiveWrapper.cType!, descriptionPrimitiveWrapper.cType!, invoiceExpiryDeltaSecs, phantomRouteHintsVector.cType!, keysManager.activate().cType!, logger.activate().cType!, network.getCValue())

					// cleanup
					
					// phantomRouteHintsVector.noOpRetain()
				

					
					// return value (do some wrapping)
					let returnValue = Result_InvoiceSignOrCreationErrorZ(cType: nativeCallResult)
					

					return returnValue
				}
		
				/// Utility to create an invoice that can be paid to one of multiple nodes, or a \"phantom invoice.\"
				/// See [`PhantomKeysManager`] for more information on phantom node payments.
				/// 
				/// `phantom_route_hints` parameter:
				/// * Contains channel info for all nodes participating in the phantom invoice
				/// * Entries are retrieved from a call to [`ChannelManager::get_phantom_route_hints`] on each
				/// participating node
				/// * It is fine to cache `phantom_route_hints` and reuse it across invoices, as long as the data is
				/// updated when a channel becomes disabled or closes
				/// * Note that if too many channels are included in [`PhantomRouteHints::channels`], the invoice
				/// may be too long for QR code scanning. To fix this, `PhantomRouteHints::channels` may be pared
				/// down
				/// 
				/// `description_hash` is a SHA-256 hash of the description text
				/// 
				/// `payment_hash` can be specified if you have a specific need for a custom payment hash (see the difference
				/// between [`ChannelManager::create_inbound_payment`] and [`ChannelManager::create_inbound_payment_for_hash`]).
				/// If `None` is provided for `payment_hash`, then one will be created.
				/// 
				/// `invoice_expiry_delta_secs` describes the number of seconds that the invoice is valid for
				/// in excess of the current time.
				/// 
				/// Note that the provided `keys_manager`'s `KeysInterface` implementation must support phantom
				/// invoices in its `sign_invoice` implementation ([`PhantomKeysManager`] satisfies this
				/// requirement).
				/// 
				/// [`PhantomKeysManager`]: lightning::chain::keysinterface::PhantomKeysManager
				/// [`ChannelManager::get_phantom_route_hints`]: lightning::ln::channelmanager::ChannelManager::get_phantom_route_hints
				/// [`ChannelManager::create_inbound_payment`]: lightning::ln::channelmanager::ChannelManager::create_inbound_payment
				/// [`ChannelManager::create_inbound_payment_for_hash`]: lightning::ln::channelmanager::ChannelManager::create_inbound_payment_for_hash
				/// [`PhantomRouteHints::channels`]: lightning::ln::channelmanager::PhantomRouteHints::channels
				/// 
				/// Note that payment_hash (or a relevant inner pointer) may be NULL or all-0s to represent None
				public class func swiftCreatePhantomInvoiceWithDescriptionHash(amtMsat: UInt64?, paymentHash: [UInt8], invoiceExpiryDeltaSecs: UInt32, descriptionHash: Sha256, phantomRouteHints: [PhantomRouteHints], keysManager: KeysInterface, logger: Logger, network: Currency) -> Result_InvoiceSignOrCreationErrorZ {
					// native call variable prep
					
					let amtMsatOption = Option_u64Z(some: amtMsat)
				
					let paymentHashPrimitiveWrapper = ThirtyTwoBytes(value: paymentHash)
				
					let phantomRouteHintsVector = Vec_PhantomRouteHintsZ(array: phantomRouteHints)
				

					// native method call
					let nativeCallResult = create_phantom_invoice_with_description_hash(amtMsatOption.cType!, paymentHashPrimitiveWrapper.cType!, invoiceExpiryDeltaSecs, descriptionHash.dynamicallyDangledClone().cType!, phantomRouteHintsVector.cType!, keysManager.activate().cType!, logger.activate().cType!, network.getCValue())

					// cleanup
					
					// phantomRouteHintsVector.noOpRetain()
				

					
					// return value (do some wrapping)
					let returnValue = Result_InvoiceSignOrCreationErrorZ(cType: nativeCallResult)
					

					return returnValue
				}
		
				/// Utility to construct an invoice. Generally, unless you want to do something like a custom
				/// cltv_expiry, this is what you should be using to create an invoice. The reason being, this
				/// method stores the invoice's payment secret and preimage in `ChannelManager`, so (a) the user
				/// doesn't have to store preimage/payment secret information and (b) `ChannelManager` can verify
				/// that the payment secret is valid when the invoice is paid.
				/// 
				/// `invoice_expiry_delta_secs` describes the number of seconds that the invoice is valid for
				/// in excess of the current time.
				public class func swiftCreateInvoiceFromChannelmanager(channelmanager: ChannelManager, keysManager: KeysInterface, logger: Logger, network: Currency, amtMsat: UInt64?, description: String, invoiceExpiryDeltaSecs: UInt32) -> Result_InvoiceSignOrCreationErrorZ {
					// native call variable prep
					
					let amtMsatOption = Option_u64Z(some: amtMsat)
				
					let descriptionPrimitiveWrapper = Str(value: description)
				
					descriptionPrimitiveWrapper.cType!.chars_is_owned = false
				

					// native method call
					let nativeCallResult = 
					withUnsafePointer(to: channelmanager.cType!) { (channelmanagerPointer: UnsafePointer<LDKChannelManager>) in
				create_invoice_from_channelmanager(channelmanagerPointer, keysManager.activate().cType!, logger.activate().cType!, network.getCValue(), amtMsatOption.cType!, descriptionPrimitiveWrapper.cType!, invoiceExpiryDeltaSecs)
					}
				

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Result_InvoiceSignOrCreationErrorZ(cType: nativeCallResult)
					

					return returnValue
				}
		
				/// Utility to construct an invoice. Generally, unless you want to do something like a custom
				/// cltv_expiry, this is what you should be using to create an invoice. The reason being, this
				/// method stores the invoice's payment secret and preimage in `ChannelManager`, so (a) the user
				/// doesn't have to store preimage/payment secret information and (b) `ChannelManager` can verify
				/// that the payment secret is valid when the invoice is paid.
				/// Use this variant if you want to pass the `description_hash` to the invoice.
				/// 
				/// `invoice_expiry_delta_secs` describes the number of seconds that the invoice is valid for
				/// in excess of the current time.
				public class func swiftCreateInvoiceFromChannelmanagerWithDescriptionHash(channelmanager: ChannelManager, keysManager: KeysInterface, logger: Logger, network: Currency, amtMsat: UInt64?, descriptionHash: Sha256, invoiceExpiryDeltaSecs: UInt32) -> Result_InvoiceSignOrCreationErrorZ {
					// native call variable prep
					
					let amtMsatOption = Option_u64Z(some: amtMsat)
				

					// native method call
					let nativeCallResult = 
					withUnsafePointer(to: channelmanager.cType!) { (channelmanagerPointer: UnsafePointer<LDKChannelManager>) in
				create_invoice_from_channelmanager_with_description_hash(channelmanagerPointer, keysManager.activate().cType!, logger.activate().cType!, network.getCValue(), amtMsatOption.cType!, descriptionHash.dynamicallyDangledClone().cType!, invoiceExpiryDeltaSecs)
					}
				

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Result_InvoiceSignOrCreationErrorZ(cType: nativeCallResult)
					

					return returnValue
				}
		
				/// See [`create_invoice_from_channelmanager_with_description_hash`]
				/// This version can be used in a `no_std` environment, where [`std::time::SystemTime`] is not
				/// available and the current time is supplied by the caller.
				public class func swiftCreateInvoiceFromChannelmanagerWithDescriptionHashAndDurationSinceEpoch(channelmanager: ChannelManager, keysManager: KeysInterface, logger: Logger, network: Currency, amtMsat: UInt64?, descriptionHash: Sha256, durationSinceEpoch: UInt64, invoiceExpiryDeltaSecs: UInt32) -> Result_InvoiceSignOrCreationErrorZ {
					// native call variable prep
					
					let amtMsatOption = Option_u64Z(some: amtMsat)
				

					// native method call
					let nativeCallResult = 
					withUnsafePointer(to: channelmanager.cType!) { (channelmanagerPointer: UnsafePointer<LDKChannelManager>) in
				create_invoice_from_channelmanager_with_description_hash_and_duration_since_epoch(channelmanagerPointer, keysManager.activate().cType!, logger.activate().cType!, network.getCValue(), amtMsatOption.cType!, descriptionHash.dynamicallyDangledClone().cType!, durationSinceEpoch, invoiceExpiryDeltaSecs)
					}
				

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Result_InvoiceSignOrCreationErrorZ(cType: nativeCallResult)
					

					return returnValue
				}
		
				/// See [`create_invoice_from_channelmanager`]
				/// This version can be used in a `no_std` environment, where [`std::time::SystemTime`] is not
				/// available and the current time is supplied by the caller.
				public class func swiftCreateInvoiceFromChannelmanagerAndDurationSinceEpoch(channelmanager: ChannelManager, keysManager: KeysInterface, logger: Logger, network: Currency, amtMsat: UInt64?, description: String, durationSinceEpoch: UInt64, invoiceExpiryDeltaSecs: UInt32) -> Result_InvoiceSignOrCreationErrorZ {
					// native call variable prep
					
					let amtMsatOption = Option_u64Z(some: amtMsat)
				
					let descriptionPrimitiveWrapper = Str(value: description)
				
					descriptionPrimitiveWrapper.cType!.chars_is_owned = false
				

					// native method call
					let nativeCallResult = 
					withUnsafePointer(to: channelmanager.cType!) { (channelmanagerPointer: UnsafePointer<LDKChannelManager>) in
				create_invoice_from_channelmanager_and_duration_since_epoch(channelmanagerPointer, keysManager.activate().cType!, logger.activate().cType!, network.getCValue(), amtMsatOption.cType!, descriptionPrimitiveWrapper.cType!, durationSinceEpoch, invoiceExpiryDeltaSecs)
					}
				

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Result_InvoiceSignOrCreationErrorZ(cType: nativeCallResult)
					

					return returnValue
				}
		
				/// Read a C2Tuple_BlockHashChannelMonitorZ from a byte array, created by C2Tuple_BlockHashChannelMonitorZ_write
				public class func readBlockHashChannelMonitor(ser: [UInt8], arg: KeysInterface) -> Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ {
					// native call variable prep
					
					let serPrimitiveWrapper = u8slice(value: ser)
				

					// native method call
					let nativeCallResult = 
					withUnsafePointer(to: arg.activate().cType!) { (argPointer: UnsafePointer<LDKKeysInterface>) in
				C2Tuple_BlockHashChannelMonitorZ_read(serPrimitiveWrapper.cType!, argPointer)
					}
				

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ(cType: nativeCallResult)
					

					return returnValue
				}
		
				/// Read a C2Tuple_BlockHashChannelManagerZ from a byte array, created by C2Tuple_BlockHashChannelManagerZ_write
				@available(*, deprecated, message: "This method passes the following non-cloneable, but freeable objects by value: `arg`.")
				public class func readBlockHashChannelManager(ser: [UInt8], arg: ChannelManagerReadArgs) -> Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ {
					// native call variable prep
					
					let serPrimitiveWrapper = u8slice(value: ser)
				

					// native method call
					let nativeCallResult = C2Tuple_BlockHashChannelManagerZ_read(serPrimitiveWrapper.cType!, arg.dangle().cType!)

					// cleanup
					

					
					// return value (do some wrapping)
					let returnValue = Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ(cType: nativeCallResult)
					

					return returnValue
				}
		

				
				internal typealias UInt8Tuple32 = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
				
				internal typealias UInt8Tuple33 = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
				
				internal typealias UInt8Tuple64 = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
				
				internal typealias UInt8Tuple20 = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
				
				internal typealias UInt8Tuple4 = (UInt8, UInt8, UInt8, UInt8)
				
				internal typealias UInt8Tuple16 = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
				
				internal typealias UInt8Tuple12 = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
				
				internal typealias UInt8Tuple3 = (UInt8, UInt8, UInt8)
				
				internal typealias UInt8Tuple68 = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
				
				internal typealias UInt8Tuple80 = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
				

				
				internal class func arrayToUInt8Tuple32(array: [UInt8]) -> UInt8Tuple32 {
					return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31])
				}

				internal class func UInt8Tuple32ToArray(tuple: UInt8Tuple32) -> [UInt8] {
					return [tuple.0, tuple.1, tuple.2, tuple.3, tuple.4, tuple.5, tuple.6, tuple.7, tuple.8, tuple.9, tuple.10, tuple.11, tuple.12, tuple.13, tuple.14, tuple.15, tuple.16, tuple.17, tuple.18, tuple.19, tuple.20, tuple.21, tuple.22, tuple.23, tuple.24, tuple.25, tuple.26, tuple.27, tuple.28, tuple.29, tuple.30, tuple.31]
				}
				
				internal class func arrayToUInt8Tuple33(array: [UInt8]) -> UInt8Tuple33 {
					return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31], array[32])
				}

				internal class func UInt8Tuple33ToArray(tuple: UInt8Tuple33) -> [UInt8] {
					return [tuple.0, tuple.1, tuple.2, tuple.3, tuple.4, tuple.5, tuple.6, tuple.7, tuple.8, tuple.9, tuple.10, tuple.11, tuple.12, tuple.13, tuple.14, tuple.15, tuple.16, tuple.17, tuple.18, tuple.19, tuple.20, tuple.21, tuple.22, tuple.23, tuple.24, tuple.25, tuple.26, tuple.27, tuple.28, tuple.29, tuple.30, tuple.31, tuple.32]
				}
				
				internal class func arrayToUInt8Tuple64(array: [UInt8]) -> UInt8Tuple64 {
					return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31], array[32], array[33], array[34], array[35], array[36], array[37], array[38], array[39], array[40], array[41], array[42], array[43], array[44], array[45], array[46], array[47], array[48], array[49], array[50], array[51], array[52], array[53], array[54], array[55], array[56], array[57], array[58], array[59], array[60], array[61], array[62], array[63])
				}

				internal class func UInt8Tuple64ToArray(tuple: UInt8Tuple64) -> [UInt8] {
					return [tuple.0, tuple.1, tuple.2, tuple.3, tuple.4, tuple.5, tuple.6, tuple.7, tuple.8, tuple.9, tuple.10, tuple.11, tuple.12, tuple.13, tuple.14, tuple.15, tuple.16, tuple.17, tuple.18, tuple.19, tuple.20, tuple.21, tuple.22, tuple.23, tuple.24, tuple.25, tuple.26, tuple.27, tuple.28, tuple.29, tuple.30, tuple.31, tuple.32, tuple.33, tuple.34, tuple.35, tuple.36, tuple.37, tuple.38, tuple.39, tuple.40, tuple.41, tuple.42, tuple.43, tuple.44, tuple.45, tuple.46, tuple.47, tuple.48, tuple.49, tuple.50, tuple.51, tuple.52, tuple.53, tuple.54, tuple.55, tuple.56, tuple.57, tuple.58, tuple.59, tuple.60, tuple.61, tuple.62, tuple.63]
				}
				
				internal class func arrayToUInt8Tuple20(array: [UInt8]) -> UInt8Tuple20 {
					return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19])
				}

				internal class func UInt8Tuple20ToArray(tuple: UInt8Tuple20) -> [UInt8] {
					return [tuple.0, tuple.1, tuple.2, tuple.3, tuple.4, tuple.5, tuple.6, tuple.7, tuple.8, tuple.9, tuple.10, tuple.11, tuple.12, tuple.13, tuple.14, tuple.15, tuple.16, tuple.17, tuple.18, tuple.19]
				}
				
				internal class func arrayToUInt8Tuple4(array: [UInt8]) -> UInt8Tuple4 {
					return (array[0], array[1], array[2], array[3])
				}

				internal class func UInt8Tuple4ToArray(tuple: UInt8Tuple4) -> [UInt8] {
					return [tuple.0, tuple.1, tuple.2, tuple.3]
				}
				
				internal class func arrayToUInt8Tuple16(array: [UInt8]) -> UInt8Tuple16 {
					return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15])
				}

				internal class func UInt8Tuple16ToArray(tuple: UInt8Tuple16) -> [UInt8] {
					return [tuple.0, tuple.1, tuple.2, tuple.3, tuple.4, tuple.5, tuple.6, tuple.7, tuple.8, tuple.9, tuple.10, tuple.11, tuple.12, tuple.13, tuple.14, tuple.15]
				}
				
				internal class func arrayToUInt8Tuple12(array: [UInt8]) -> UInt8Tuple12 {
					return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11])
				}

				internal class func UInt8Tuple12ToArray(tuple: UInt8Tuple12) -> [UInt8] {
					return [tuple.0, tuple.1, tuple.2, tuple.3, tuple.4, tuple.5, tuple.6, tuple.7, tuple.8, tuple.9, tuple.10, tuple.11]
				}
				
				internal class func arrayToUInt8Tuple3(array: [UInt8]) -> UInt8Tuple3 {
					return (array[0], array[1], array[2])
				}

				internal class func UInt8Tuple3ToArray(tuple: UInt8Tuple3) -> [UInt8] {
					return [tuple.0, tuple.1, tuple.2]
				}
				
				internal class func arrayToUInt8Tuple68(array: [UInt8]) -> UInt8Tuple68 {
					return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31], array[32], array[33], array[34], array[35], array[36], array[37], array[38], array[39], array[40], array[41], array[42], array[43], array[44], array[45], array[46], array[47], array[48], array[49], array[50], array[51], array[52], array[53], array[54], array[55], array[56], array[57], array[58], array[59], array[60], array[61], array[62], array[63], array[64], array[65], array[66], array[67])
				}

				internal class func UInt8Tuple68ToArray(tuple: UInt8Tuple68) -> [UInt8] {
					return [tuple.0, tuple.1, tuple.2, tuple.3, tuple.4, tuple.5, tuple.6, tuple.7, tuple.8, tuple.9, tuple.10, tuple.11, tuple.12, tuple.13, tuple.14, tuple.15, tuple.16, tuple.17, tuple.18, tuple.19, tuple.20, tuple.21, tuple.22, tuple.23, tuple.24, tuple.25, tuple.26, tuple.27, tuple.28, tuple.29, tuple.30, tuple.31, tuple.32, tuple.33, tuple.34, tuple.35, tuple.36, tuple.37, tuple.38, tuple.39, tuple.40, tuple.41, tuple.42, tuple.43, tuple.44, tuple.45, tuple.46, tuple.47, tuple.48, tuple.49, tuple.50, tuple.51, tuple.52, tuple.53, tuple.54, tuple.55, tuple.56, tuple.57, tuple.58, tuple.59, tuple.60, tuple.61, tuple.62, tuple.63, tuple.64, tuple.65, tuple.66, tuple.67]
				}
				
				internal class func arrayToUInt8Tuple80(array: [UInt8]) -> UInt8Tuple80 {
					return (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31], array[32], array[33], array[34], array[35], array[36], array[37], array[38], array[39], array[40], array[41], array[42], array[43], array[44], array[45], array[46], array[47], array[48], array[49], array[50], array[51], array[52], array[53], array[54], array[55], array[56], array[57], array[58], array[59], array[60], array[61], array[62], array[63], array[64], array[65], array[66], array[67], array[68], array[69], array[70], array[71], array[72], array[73], array[74], array[75], array[76], array[77], array[78], array[79])
				}

				internal class func UInt8Tuple80ToArray(tuple: UInt8Tuple80) -> [UInt8] {
					return [tuple.0, tuple.1, tuple.2, tuple.3, tuple.4, tuple.5, tuple.6, tuple.7, tuple.8, tuple.9, tuple.10, tuple.11, tuple.12, tuple.13, tuple.14, tuple.15, tuple.16, tuple.17, tuple.18, tuple.19, tuple.20, tuple.21, tuple.22, tuple.23, tuple.24, tuple.25, tuple.26, tuple.27, tuple.28, tuple.29, tuple.30, tuple.31, tuple.32, tuple.33, tuple.34, tuple.35, tuple.36, tuple.37, tuple.38, tuple.39, tuple.40, tuple.41, tuple.42, tuple.43, tuple.44, tuple.45, tuple.46, tuple.47, tuple.48, tuple.49, tuple.50, tuple.51, tuple.52, tuple.53, tuple.54, tuple.55, tuple.56, tuple.57, tuple.58, tuple.59, tuple.60, tuple.61, tuple.62, tuple.63, tuple.64, tuple.65, tuple.66, tuple.67, tuple.68, tuple.69, tuple.70, tuple.71, tuple.72, tuple.73, tuple.74, tuple.75, tuple.76, tuple.77, tuple.78, tuple.79]
				}
				

			}

			public class InstanceCrashSimulator: NativeTraitWrapper {

				public init() {
					super.init(conflictAvoidingVariableName: 0)
				}

				public func getPointer() -> UnsafeMutableRawPointer {
					let pointer = Bindings.instanceToPointer(instance: self)
					return pointer
				}

			}

			
						func == (tupleA: Bindings.UInt8Tuple32, tupleB: Bindings.UInt8Tuple32) -> Bool {
   							return tupleA.0 == tupleB.0 && tupleA.1 == tupleB.1 && tupleA.2 == tupleB.2 && tupleA.3 == tupleB.3 && tupleA.4 == tupleB.4 && tupleA.5 == tupleB.5 && tupleA.6 == tupleB.6 && tupleA.7 == tupleB.7 && tupleA.8 == tupleB.8 && tupleA.9 == tupleB.9 && tupleA.10 == tupleB.10 && tupleA.11 == tupleB.11 && tupleA.12 == tupleB.12 && tupleA.13 == tupleB.13 && tupleA.14 == tupleB.14 && tupleA.15 == tupleB.15 && tupleA.16 == tupleB.16 && tupleA.17 == tupleB.17 && tupleA.18 == tupleB.18 && tupleA.19 == tupleB.19 && tupleA.20 == tupleB.20 && tupleA.21 == tupleB.21 && tupleA.22 == tupleB.22 && tupleA.23 == tupleB.23 && tupleA.24 == tupleB.24 && tupleA.25 == tupleB.25 && tupleA.26 == tupleB.26 && tupleA.27 == tupleB.27 && tupleA.28 == tupleB.28 && tupleA.29 == tupleB.29 && tupleA.30 == tupleB.30 && tupleA.31 == tupleB.31
						}
					
						func == (tupleA: Bindings.UInt8Tuple33, tupleB: Bindings.UInt8Tuple33) -> Bool {
   							return tupleA.0 == tupleB.0 && tupleA.1 == tupleB.1 && tupleA.2 == tupleB.2 && tupleA.3 == tupleB.3 && tupleA.4 == tupleB.4 && tupleA.5 == tupleB.5 && tupleA.6 == tupleB.6 && tupleA.7 == tupleB.7 && tupleA.8 == tupleB.8 && tupleA.9 == tupleB.9 && tupleA.10 == tupleB.10 && tupleA.11 == tupleB.11 && tupleA.12 == tupleB.12 && tupleA.13 == tupleB.13 && tupleA.14 == tupleB.14 && tupleA.15 == tupleB.15 && tupleA.16 == tupleB.16 && tupleA.17 == tupleB.17 && tupleA.18 == tupleB.18 && tupleA.19 == tupleB.19 && tupleA.20 == tupleB.20 && tupleA.21 == tupleB.21 && tupleA.22 == tupleB.22 && tupleA.23 == tupleB.23 && tupleA.24 == tupleB.24 && tupleA.25 == tupleB.25 && tupleA.26 == tupleB.26 && tupleA.27 == tupleB.27 && tupleA.28 == tupleB.28 && tupleA.29 == tupleB.29 && tupleA.30 == tupleB.30 && tupleA.31 == tupleB.31 && tupleA.32 == tupleB.32
						}
					
						func == (tupleA: Bindings.UInt8Tuple64, tupleB: Bindings.UInt8Tuple64) -> Bool {
   							return tupleA.0 == tupleB.0 && tupleA.1 == tupleB.1 && tupleA.2 == tupleB.2 && tupleA.3 == tupleB.3 && tupleA.4 == tupleB.4 && tupleA.5 == tupleB.5 && tupleA.6 == tupleB.6 && tupleA.7 == tupleB.7 && tupleA.8 == tupleB.8 && tupleA.9 == tupleB.9 && tupleA.10 == tupleB.10 && tupleA.11 == tupleB.11 && tupleA.12 == tupleB.12 && tupleA.13 == tupleB.13 && tupleA.14 == tupleB.14 && tupleA.15 == tupleB.15 && tupleA.16 == tupleB.16 && tupleA.17 == tupleB.17 && tupleA.18 == tupleB.18 && tupleA.19 == tupleB.19 && tupleA.20 == tupleB.20 && tupleA.21 == tupleB.21 && tupleA.22 == tupleB.22 && tupleA.23 == tupleB.23 && tupleA.24 == tupleB.24 && tupleA.25 == tupleB.25 && tupleA.26 == tupleB.26 && tupleA.27 == tupleB.27 && tupleA.28 == tupleB.28 && tupleA.29 == tupleB.29 && tupleA.30 == tupleB.30 && tupleA.31 == tupleB.31 && tupleA.32 == tupleB.32 && tupleA.33 == tupleB.33 && tupleA.34 == tupleB.34 && tupleA.35 == tupleB.35 && tupleA.36 == tupleB.36 && tupleA.37 == tupleB.37 && tupleA.38 == tupleB.38 && tupleA.39 == tupleB.39 && tupleA.40 == tupleB.40 && tupleA.41 == tupleB.41 && tupleA.42 == tupleB.42 && tupleA.43 == tupleB.43 && tupleA.44 == tupleB.44 && tupleA.45 == tupleB.45 && tupleA.46 == tupleB.46 && tupleA.47 == tupleB.47 && tupleA.48 == tupleB.48 && tupleA.49 == tupleB.49 && tupleA.50 == tupleB.50 && tupleA.51 == tupleB.51 && tupleA.52 == tupleB.52 && tupleA.53 == tupleB.53 && tupleA.54 == tupleB.54 && tupleA.55 == tupleB.55 && tupleA.56 == tupleB.56 && tupleA.57 == tupleB.57 && tupleA.58 == tupleB.58 && tupleA.59 == tupleB.59 && tupleA.60 == tupleB.60 && tupleA.61 == tupleB.61 && tupleA.62 == tupleB.62 && tupleA.63 == tupleB.63
						}
					
						func == (tupleA: Bindings.UInt8Tuple20, tupleB: Bindings.UInt8Tuple20) -> Bool {
   							return tupleA.0 == tupleB.0 && tupleA.1 == tupleB.1 && tupleA.2 == tupleB.2 && tupleA.3 == tupleB.3 && tupleA.4 == tupleB.4 && tupleA.5 == tupleB.5 && tupleA.6 == tupleB.6 && tupleA.7 == tupleB.7 && tupleA.8 == tupleB.8 && tupleA.9 == tupleB.9 && tupleA.10 == tupleB.10 && tupleA.11 == tupleB.11 && tupleA.12 == tupleB.12 && tupleA.13 == tupleB.13 && tupleA.14 == tupleB.14 && tupleA.15 == tupleB.15 && tupleA.16 == tupleB.16 && tupleA.17 == tupleB.17 && tupleA.18 == tupleB.18 && tupleA.19 == tupleB.19
						}
					
						func == (tupleA: Bindings.UInt8Tuple16, tupleB: Bindings.UInt8Tuple16) -> Bool {
   							return tupleA.0 == tupleB.0 && tupleA.1 == tupleB.1 && tupleA.2 == tupleB.2 && tupleA.3 == tupleB.3 && tupleA.4 == tupleB.4 && tupleA.5 == tupleB.5 && tupleA.6 == tupleB.6 && tupleA.7 == tupleB.7 && tupleA.8 == tupleB.8 && tupleA.9 == tupleB.9 && tupleA.10 == tupleB.10 && tupleA.11 == tupleB.11 && tupleA.12 == tupleB.12 && tupleA.13 == tupleB.13 && tupleA.14 == tupleB.14 && tupleA.15 == tupleB.15
						}
					
						func == (tupleA: Bindings.UInt8Tuple12, tupleB: Bindings.UInt8Tuple12) -> Bool {
   							return tupleA.0 == tupleB.0 && tupleA.1 == tupleB.1 && tupleA.2 == tupleB.2 && tupleA.3 == tupleB.3 && tupleA.4 == tupleB.4 && tupleA.5 == tupleB.5 && tupleA.6 == tupleB.6 && tupleA.7 == tupleB.7 && tupleA.8 == tupleB.8 && tupleA.9 == tupleB.9 && tupleA.10 == tupleB.10 && tupleA.11 == tupleB.11
						}
					
						func == (tupleA: Bindings.UInt8Tuple68, tupleB: Bindings.UInt8Tuple68) -> Bool {
   							return tupleA.0 == tupleB.0 && tupleA.1 == tupleB.1 && tupleA.2 == tupleB.2 && tupleA.3 == tupleB.3 && tupleA.4 == tupleB.4 && tupleA.5 == tupleB.5 && tupleA.6 == tupleB.6 && tupleA.7 == tupleB.7 && tupleA.8 == tupleB.8 && tupleA.9 == tupleB.9 && tupleA.10 == tupleB.10 && tupleA.11 == tupleB.11 && tupleA.12 == tupleB.12 && tupleA.13 == tupleB.13 && tupleA.14 == tupleB.14 && tupleA.15 == tupleB.15 && tupleA.16 == tupleB.16 && tupleA.17 == tupleB.17 && tupleA.18 == tupleB.18 && tupleA.19 == tupleB.19 && tupleA.20 == tupleB.20 && tupleA.21 == tupleB.21 && tupleA.22 == tupleB.22 && tupleA.23 == tupleB.23 && tupleA.24 == tupleB.24 && tupleA.25 == tupleB.25 && tupleA.26 == tupleB.26 && tupleA.27 == tupleB.27 && tupleA.28 == tupleB.28 && tupleA.29 == tupleB.29 && tupleA.30 == tupleB.30 && tupleA.31 == tupleB.31 && tupleA.32 == tupleB.32 && tupleA.33 == tupleB.33 && tupleA.34 == tupleB.34 && tupleA.35 == tupleB.35 && tupleA.36 == tupleB.36 && tupleA.37 == tupleB.37 && tupleA.38 == tupleB.38 && tupleA.39 == tupleB.39 && tupleA.40 == tupleB.40 && tupleA.41 == tupleB.41 && tupleA.42 == tupleB.42 && tupleA.43 == tupleB.43 && tupleA.44 == tupleB.44 && tupleA.45 == tupleB.45 && tupleA.46 == tupleB.46 && tupleA.47 == tupleB.47 && tupleA.48 == tupleB.48 && tupleA.49 == tupleB.49 && tupleA.50 == tupleB.50 && tupleA.51 == tupleB.51 && tupleA.52 == tupleB.52 && tupleA.53 == tupleB.53 && tupleA.54 == tupleB.54 && tupleA.55 == tupleB.55 && tupleA.56 == tupleB.56 && tupleA.57 == tupleB.57 && tupleA.58 == tupleB.58 && tupleA.59 == tupleB.59 && tupleA.60 == tupleB.60 && tupleA.61 == tupleB.61 && tupleA.62 == tupleB.62 && tupleA.63 == tupleB.63 && tupleA.64 == tupleB.64 && tupleA.65 == tupleB.65 && tupleA.66 == tupleB.66 && tupleA.67 == tupleB.67
						}
					
						func == (tupleA: Bindings.UInt8Tuple80, tupleB: Bindings.UInt8Tuple80) -> Bool {
   							return tupleA.0 == tupleB.0 && tupleA.1 == tupleB.1 && tupleA.2 == tupleB.2 && tupleA.3 == tupleB.3 && tupleA.4 == tupleB.4 && tupleA.5 == tupleB.5 && tupleA.6 == tupleB.6 && tupleA.7 == tupleB.7 && tupleA.8 == tupleB.8 && tupleA.9 == tupleB.9 && tupleA.10 == tupleB.10 && tupleA.11 == tupleB.11 && tupleA.12 == tupleB.12 && tupleA.13 == tupleB.13 && tupleA.14 == tupleB.14 && tupleA.15 == tupleB.15 && tupleA.16 == tupleB.16 && tupleA.17 == tupleB.17 && tupleA.18 == tupleB.18 && tupleA.19 == tupleB.19 && tupleA.20 == tupleB.20 && tupleA.21 == tupleB.21 && tupleA.22 == tupleB.22 && tupleA.23 == tupleB.23 && tupleA.24 == tupleB.24 && tupleA.25 == tupleB.25 && tupleA.26 == tupleB.26 && tupleA.27 == tupleB.27 && tupleA.28 == tupleB.28 && tupleA.29 == tupleB.29 && tupleA.30 == tupleB.30 && tupleA.31 == tupleB.31 && tupleA.32 == tupleB.32 && tupleA.33 == tupleB.33 && tupleA.34 == tupleB.34 && tupleA.35 == tupleB.35 && tupleA.36 == tupleB.36 && tupleA.37 == tupleB.37 && tupleA.38 == tupleB.38 && tupleA.39 == tupleB.39 && tupleA.40 == tupleB.40 && tupleA.41 == tupleB.41 && tupleA.42 == tupleB.42 && tupleA.43 == tupleB.43 && tupleA.44 == tupleB.44 && tupleA.45 == tupleB.45 && tupleA.46 == tupleB.46 && tupleA.47 == tupleB.47 && tupleA.48 == tupleB.48 && tupleA.49 == tupleB.49 && tupleA.50 == tupleB.50 && tupleA.51 == tupleB.51 && tupleA.52 == tupleB.52 && tupleA.53 == tupleB.53 && tupleA.54 == tupleB.54 && tupleA.55 == tupleB.55 && tupleA.56 == tupleB.56 && tupleA.57 == tupleB.57 && tupleA.58 == tupleB.58 && tupleA.59 == tupleB.59 && tupleA.60 == tupleB.60 && tupleA.61 == tupleB.61 && tupleA.62 == tupleB.62 && tupleA.63 == tupleB.63 && tupleA.64 == tupleB.64 && tupleA.65 == tupleB.65 && tupleA.66 == tupleB.66 && tupleA.67 == tupleB.67 && tupleA.68 == tupleB.68 && tupleA.69 == tupleB.69 && tupleA.70 == tupleB.70 && tupleA.71 == tupleB.71 && tupleA.72 == tupleB.72 && tupleA.73 == tupleB.73 && tupleA.74 == tupleB.74 && tupleA.75 == tupleB.75 && tupleA.76 == tupleB.76 && tupleA.77 == tupleB.77 && tupleA.78 == tupleB.78 && tupleA.79 == tupleB.79
						}
					

		