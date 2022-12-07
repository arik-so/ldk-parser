
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias KeysInterface = Bindings.KeysInterface

			extension Bindings {

				/// A trait to describe an object which can get user secrets and key material.
				open class KeysInterface: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKKeysInterface?

					public init(pointer: LDKKeysInterface) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKKeysInterface, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init() {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func getNodeSecretLambda(this_arg: UnsafeRawPointer?, recipient: LDKRecipient) -> LDKCResult_SecretKeyNoneZ {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::getNodeSecretLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.getNodeSecret(recipient: Recipient(value: recipient))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func getNodeIdLambda(this_arg: UnsafeRawPointer?, recipient: LDKRecipient) -> LDKCResult_PublicKeyNoneZ {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::getNodeIdLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.getNodeId(recipient: Recipient(value: recipient))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func ecdhLambda(this_arg: UnsafeRawPointer?, recipient: LDKRecipient, other_key: LDKPublicKey, tweak: LDKCOption_ScalarZ) -> LDKCResult_SharedSecretNoneZ {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::ecdhLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.ecdh(recipient: Recipient(value: recipient), otherKey: PublicKey(pointer: other_key).getValue(), tweak: Option_ScalarZ(pointer: tweak).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func getDestinationScriptLambda(this_arg: UnsafeRawPointer?) -> LDKCVec_u8Z {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::getDestinationScriptLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.getDestinationScript()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func getShutdownScriptpubkeyLambda(this_arg: UnsafeRawPointer?) -> LDKShutdownScript {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::getShutdownScriptpubkeyLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.getShutdownScriptpubkey()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func getChannelSignerLambda(this_arg: UnsafeRawPointer?, inbound: Bool, channel_value_satoshis: UInt64) -> LDKSign {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::getChannelSignerLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.getChannelSigner(inbound: inbound, channelValueSatoshis: channel_value_satoshis)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.activate().cType!

							return returnValue
						}
		
						func getSecureRandomBytesLambda(this_arg: UnsafeRawPointer?) -> LDKThirtyTwoBytes {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::getSecureRandomBytesLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.getSecureRandomBytes()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func readChanSignerLambda(this_arg: UnsafeRawPointer?, reader: LDKu8slice) -> LDKCResult_SignDecodeErrorZ {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::readChanSignerLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.readChanSigner(reader: u8slice(pointer: reader).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func signInvoiceLambda(this_arg: UnsafeRawPointer?, hrp_bytes: LDKu8slice, invoice_data: LDKCVec_u5Z, receipient: LDKRecipient) -> LDKCResult_RecoverableSignatureNoneZ {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::signInvoiceLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.signInvoice(hrpBytes: u8slice(pointer: hrp_bytes).getValue(), invoiceData: Vec_u5Z(pointer: invoice_data).getValue(), receipient: Recipient(value: receipient))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func getInboundPaymentKeyMaterialLambda(this_arg: UnsafeRawPointer?) -> LDKThirtyTwoBytes {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::getInboundPaymentKeyMaterialLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.getInboundPaymentKeyMaterial()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKKeysInterface(							
							this_arg: thisArg,
							get_node_secret: getNodeSecretLambda,
							get_node_id: getNodeIdLambda,
							ecdh: ecdhLambda,
							get_destination_script: getDestinationScriptLambda,
							get_shutdown_scriptpubkey: getShutdownScriptpubkeyLambda,
							get_channel_signer: getChannelSignerLambda,
							get_secure_random_bytes: getSecureRandomBytesLambda,
							read_chan_signer: readChanSignerLambda,
							sign_invoice: signInvoiceLambda,
							get_inbound_payment_key_material: getInboundPaymentKeyMaterialLambda,
							free: freeLambda
						)

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Get node secret key based on the provided [`Recipient`].
					/// 
					/// The node_id/network_key is the public key that corresponds to this secret key.
					/// 
					/// This method must return the same value each time it is called with a given `Recipient`
					/// parameter.
					/// 
					/// Errors if the `Recipient` variant is not supported by the implementation.
					open func getNodeSecret(recipient: Recipient) -> Result_SecretKeyNoneZ {
						Bindings.print("Error: KeysInterface::getNodeSecret MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Get node id based on the provided [`Recipient`]. This public key corresponds to the secret in
					/// [`get_node_secret`].
					/// 
					/// This method must return the same value each time it is called with a given `Recipient`
					/// parameter.
					/// 
					/// Errors if the `Recipient` variant is not supported by the implementation.
					/// 
					/// [`get_node_secret`]: KeysInterface::get_node_secret
					open func getNodeId(recipient: Recipient) -> Result_PublicKeyNoneZ {
						Bindings.print("Error: KeysInterface::getNodeId MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Gets the ECDH shared secret of our [`node secret`] and `other_key`, multiplying by `tweak` if
					/// one is provided. Note that this tweak can be applied to `other_key` instead of our node
					/// secret, though this is less efficient.
					/// 
					/// Errors if the `Recipient` variant is not supported by the implementation.
					/// 
					/// [`node secret`]: Self::get_node_secret
					open func ecdh(recipient: Recipient, otherKey: [UInt8], tweak: [UInt8]?) -> Result_SharedSecretNoneZ {
						Bindings.print("Error: KeysInterface::ecdh MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Get a script pubkey which we send funds to when claiming on-chain contestable outputs.
					/// 
					/// This method should return a different value each time it is called, to avoid linking
					/// on-chain funds across channels as controlled to the same user.
					open func getDestinationScript() -> [UInt8] {
						Bindings.print("Error: KeysInterface::getDestinationScript MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Get a script pubkey which we will send funds to when closing a channel.
					/// 
					/// This method should return a different value each time it is called, to avoid linking
					/// on-chain funds across channels as controlled to the same user.
					open func getShutdownScriptpubkey() -> ShutdownScript {
						Bindings.print("Error: KeysInterface::getShutdownScriptpubkey MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Get a new set of Sign for per-channel secrets. These MUST be unique even if you
					/// restarted with some stale data!
					/// 
					/// This method must return a different value each time it is called.
					open func getChannelSigner(inbound: Bool, channelValueSatoshis: UInt64) -> Sign {
						Bindings.print("Error: KeysInterface::getChannelSigner MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Gets a unique, cryptographically-secure, random 32 byte value. This is used for encrypting
					/// onion packets and for temporary channel IDs. There is no requirement that these be
					/// persisted anywhere, though they must be unique across restarts.
					/// 
					/// This method must return a different value each time it is called.
					open func getSecureRandomBytes() -> [UInt8] {
						Bindings.print("Error: KeysInterface::getSecureRandomBytes MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Reads a `Signer` for this `KeysInterface` from the given input stream.
					/// This is only called during deserialization of other objects which contain
					/// `Sign`-implementing objects (ie `ChannelMonitor`s and `ChannelManager`s).
					/// The bytes are exactly those which `<Self::Signer as Writeable>::write()` writes, and
					/// contain no versioning scheme. You may wish to include your own version prefix and ensure
					/// you've read all of the provided bytes to ensure no corruption occurred.
					open func readChanSigner(reader: [UInt8]) -> Result_SignDecodeErrorZ {
						Bindings.print("Error: KeysInterface::readChanSigner MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Sign an invoice.
					/// By parameterizing by the raw invoice bytes instead of the hash, we allow implementors of
					/// this trait to parse the invoice and make sure they're signing what they expect, rather than
					/// blindly signing the hash.
					/// The hrp is ascii bytes, while the invoice data is base32.
					/// 
					/// The secret key used to sign the invoice is dependent on the [`Recipient`].
					/// 
					/// Errors if the `Recipient` variant is not supported by the implementation.
					open func signInvoice(hrpBytes: [UInt8], invoiceData: [UInt8], receipient: Recipient) -> Result_RecoverableSignatureNoneZ {
						Bindings.print("Error: KeysInterface::signInvoice MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Get secret key material as bytes for use in encrypting and decrypting inbound payment data.
					/// 
					/// If the implementor of this trait supports [phantom node payments], then every node that is
					/// intended to be included in the phantom invoice route hints must return the same value from
					/// this method.
					/// 
					/// This method must return the same value each time it is called.
					/// 
					/// [phantom node payments]: PhantomKeysManager
					open func getInboundPaymentKeyMaterial() -> [UInt8] {
						Bindings.print("Error: KeysInterface::getInboundPaymentKeyMaterial MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					open func free() -> Void {
						Bindings.print("Error: KeysInterface::free MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					
					/// Calls the free function if one is set
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = KeysInterface_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					

					internal func dangle() -> KeysInterface {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing KeysInterface \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing KeysInterface \(self.instanceNumber) due to dangle.")
						}
					}
				}

				public class NativelyImplementedKeysInterface: KeysInterface {
					
					/// Get node secret key based on the provided [`Recipient`].
					/// 
					/// The node_id/network_key is the public key that corresponds to this secret key.
					/// 
					/// This method must return the same value each time it is called with a given `Recipient`
					/// parameter.
					/// 
					/// Errors if the `Recipient` variant is not supported by the implementation.
					public func getNodeSecret(recipient: Recipient) -> Result_SecretKeyNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.get_node_secret(self.cType!.this_arg, recipient.getCValue())

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_SecretKeyNoneZ(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Get node id based on the provided [`Recipient`]. This public key corresponds to the secret in
					/// [`get_node_secret`].
					/// 
					/// This method must return the same value each time it is called with a given `Recipient`
					/// parameter.
					/// 
					/// Errors if the `Recipient` variant is not supported by the implementation.
					/// 
					/// [`get_node_secret`]: KeysInterface::get_node_secret
					public func getNodeId(recipient: Recipient) -> Result_PublicKeyNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.get_node_id(self.cType!.this_arg, recipient.getCValue())

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PublicKeyNoneZ(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Gets the ECDH shared secret of our [`node secret`] and `other_key`, multiplying by `tweak` if
					/// one is provided. Note that this tweak can be applied to `other_key` instead of our node
					/// secret, though this is less efficient.
					/// 
					/// Errors if the `Recipient` variant is not supported by the implementation.
					/// 
					/// [`node secret`]: Self::get_node_secret
					public func ecdh(recipient: Recipient, otherKey: [UInt8], tweak: [UInt8]?) -> Result_SharedSecretNoneZ {
						// native call variable prep
						
						let tweakOption = Option_ScalarZ(value: tweak)
				

						// native method call
						let nativeCallResult = self.cType!.ecdh(self.cType!.this_arg, recipient.getCValue(), otherKey.cType!, tweakOption.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_SharedSecretNoneZ(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Get a script pubkey which we send funds to when claiming on-chain contestable outputs.
					/// 
					/// This method should return a different value each time it is called, to avoid linking
					/// on-chain funds across channels as controlled to the same user.
					public func getDestinationScript() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.get_destination_script(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(pointer: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Get a script pubkey which we will send funds to when closing a channel.
					/// 
					/// This method should return a different value each time it is called, to avoid linking
					/// on-chain funds across channels as controlled to the same user.
					public func getShutdownScriptpubkey() -> ShutdownScript {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.get_shutdown_scriptpubkey(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ShutdownScript(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Get a new set of Sign for per-channel secrets. These MUST be unique even if you
					/// restarted with some stale data!
					/// 
					/// This method must return a different value each time it is called.
					public func getChannelSigner(inbound: Bool, channelValueSatoshis: UInt64) -> Sign {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.get_channel_signer(self.cType!.this_arg, inbound, channelValueSatoshis)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = NativelyImplementedSign(pointer: nativeCallResult, anchor: self)

						return returnValue
					}
		
					/// Gets a unique, cryptographically-secure, random 32 byte value. This is used for encrypting
					/// onion packets and for temporary channel IDs. There is no requirement that these be
					/// persisted anywhere, though they must be unique across restarts.
					/// 
					/// This method must return a different value each time it is called.
					public func getSecureRandomBytes() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.get_secure_random_bytes(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Reads a `Signer` for this `KeysInterface` from the given input stream.
					/// This is only called during deserialization of other objects which contain
					/// `Sign`-implementing objects (ie `ChannelMonitor`s and `ChannelManager`s).
					/// The bytes are exactly those which `<Self::Signer as Writeable>::write()` writes, and
					/// contain no versioning scheme. You may wish to include your own version prefix and ensure
					/// you've read all of the provided bytes to ensure no corruption occurred.
					public func readChanSigner(reader: [UInt8]) -> Result_SignDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.read_chan_signer(self.cType!.this_arg, reader.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_SignDecodeErrorZ(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Sign an invoice.
					/// By parameterizing by the raw invoice bytes instead of the hash, we allow implementors of
					/// this trait to parse the invoice and make sure they're signing what they expect, rather than
					/// blindly signing the hash.
					/// The hrp is ascii bytes, while the invoice data is base32.
					/// 
					/// The secret key used to sign the invoice is dependent on the [`Recipient`].
					/// 
					/// Errors if the `Recipient` variant is not supported by the implementation.
					public func signInvoice(hrpBytes: [UInt8], invoiceData: [UInt8], receipient: Recipient) -> Result_RecoverableSignatureNoneZ {
						// native call variable prep
						
						let invoiceDataVector = Vec_u5Z(array: invoiceData)
				

						// native method call
						let nativeCallResult = self.cType!.sign_invoice(self.cType!.this_arg, hrpBytes.cType!, invoiceDataVector.cType!, receipient.getCValue())

						// cleanup
						
						invoiceDataVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_RecoverableSignatureNoneZ(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Get secret key material as bytes for use in encrypting and decrypting inbound payment data.
					/// 
					/// If the implementor of this trait supports [phantom node payments], then every node that is
					/// intended to be included in the phantom invoice route hints must return the same value from
					/// this method.
					/// 
					/// This method must return the same value each time it is called.
					/// 
					/// [phantom node payments]: PhantomKeysManager
					public func getInboundPaymentKeyMaterial() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.get_inbound_payment_key_material(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					public func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.free(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
				}

			}
		