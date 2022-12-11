
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Manager which keeps track of a number of channels and sends messages to the appropriate
			/// channel, also tracking HTLC preimages and forwarding onion packets appropriately.
			/// 
			/// Implements ChannelMessageHandler, handling the multi-channel parts and passing things through
			/// to individual Channels.
			/// 
			/// Implements Writeable to write out all channel state to disk. Implies peer_disconnected() for
			/// all peers during write/read (though does not modify this instance, only the instance being
			/// serialized). This will result in any channels which have not yet exchanged funding_created (ie
			/// called funding_transaction_generated for outbound channels).
			/// 
			/// Note that you can be a bit lazier about writing out ChannelManager than you can be with
			/// ChannelMonitors. With ChannelMonitors you MUST write each monitor update out to disk before
			/// returning from chain::Watch::watch_/update_channel, with ChannelManagers, writing updates
			/// happens out-of-band (and will prevent any other ChannelManager operations from occurring during
			/// the serialization process). If the deserialized version is out-of-date compared to the
			/// ChannelMonitors passed by reference to read(), those channels will be force-closed based on the
			/// ChannelMonitor state and no funds will be lost (mod on-chain transaction fees).
			/// 
			/// Note that the deserializer is only implemented for (BlockHash, ChannelManager), which
			/// tells you the last block hash which was block_connect()ed. You MUST rescan any blocks along
			/// the \"reorg path\" (ie call block_disconnected() until you get to a common block and then call
			/// block_connected() to step towards your best block) upon deserialization before using the
			/// object!
			/// 
			/// Note that ChannelManager is responsible for tracking liveness of its channels and generating
			/// ChannelUpdate messages informing peers that the channel is temporarily disabled. To avoid
			/// spam due to quick disconnection/reconnection, updates are not sent until the channel has been
			/// offline for a full minute. In order to track this, you must call
			/// timer_tick_occurred roughly once per minute, though it doesn't have to be perfect.
			/// 
			/// Rather than using a plain ChannelManager, it is preferable to use either a SimpleArcChannelManager
			/// a SimpleRefChannelManager, for conciseness. See their documentation for more details, but
			/// essentially you should default to using a SimpleRefChannelManager, and use a
			/// SimpleArcChannelManager when you require a ChannelManager with a static lifetime, such as when
			/// you're using lightning-net-tokio.
			public typealias ChannelManager = Bindings.ChannelManager

			extension Bindings {
		

				/// Manager which keeps track of a number of channels and sends messages to the appropriate
				/// channel, also tracking HTLC preimages and forwarding onion packets appropriately.
				/// 
				/// Implements ChannelMessageHandler, handling the multi-channel parts and passing things through
				/// to individual Channels.
				/// 
				/// Implements Writeable to write out all channel state to disk. Implies peer_disconnected() for
				/// all peers during write/read (though does not modify this instance, only the instance being
				/// serialized). This will result in any channels which have not yet exchanged funding_created (ie
				/// called funding_transaction_generated for outbound channels).
				/// 
				/// Note that you can be a bit lazier about writing out ChannelManager than you can be with
				/// ChannelMonitors. With ChannelMonitors you MUST write each monitor update out to disk before
				/// returning from chain::Watch::watch_/update_channel, with ChannelManagers, writing updates
				/// happens out-of-band (and will prevent any other ChannelManager operations from occurring during
				/// the serialization process). If the deserialized version is out-of-date compared to the
				/// ChannelMonitors passed by reference to read(), those channels will be force-closed based on the
				/// ChannelMonitor state and no funds will be lost (mod on-chain transaction fees).
				/// 
				/// Note that the deserializer is only implemented for (BlockHash, ChannelManager), which
				/// tells you the last block hash which was block_connect()ed. You MUST rescan any blocks along
				/// the \"reorg path\" (ie call block_disconnected() until you get to a common block and then call
				/// block_connected() to step towards your best block) upon deserialization before using the
				/// object!
				/// 
				/// Note that ChannelManager is responsible for tracking liveness of its channels and generating
				/// ChannelUpdate messages informing peers that the channel is temporarily disabled. To avoid
				/// spam due to quick disconnection/reconnection, updates are not sent until the channel has been
				/// offline for a full minute. In order to track this, you must call
				/// timer_tick_occurred roughly once per minute, though it doesn't have to be perfect.
				/// 
				/// Rather than using a plain ChannelManager, it is preferable to use either a SimpleArcChannelManager
				/// a SimpleRefChannelManager, for conciseness. See their documentation for more details, but
				/// essentially you should default to using a SimpleRefChannelManager, and use a
				/// SimpleArcChannelManager when you require a ChannelManager with a static lifetime, such as when
				/// you're using lightning-net-tokio.
				public class ChannelManager: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKChannelManager?

					public init(cType: LDKChannelManager) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKChannelManager, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ChannelManager, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelManager_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new ChannelManager to hold several channels and route between them.
					/// 
					/// This is the main \"logic hub\" for all channel-related actions, and implements
					/// ChannelMessageHandler.
					/// 
					/// Non-proportional fees are fixed according to our risk using the provided fee estimator.
					/// 
					/// Users need to notify the new ChannelManager when a new block is connected or
					/// disconnected using its `block_connected` and `block_disconnected` methods, starting
					/// from after `params.latest_hash`.
					public init(feeEst: FeeEstimator, chainMonitor: Watch, txBroadcaster: BroadcasterInterface, logger: Logger, keysManager: KeysInterface, config: UserConfig, params: ChainParameters) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelManager_new(feeEst.activate().cType!, chainMonitor.activate().cType!, txBroadcaster.activate().cType!, logger.activate().cType!, keysManager.activate().cType!, config.dynamicallyDangledClone().cType!, params.dynamicallyDangledClone().cType!)

						// cleanup
						

						/*
						// return value (do some wrapping)
						let returnValue = ChannelManager(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Gets the current configuration applied to all new channels.
					public func getCurrentDefaultConfiguration() -> UserConfig {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_get_current_default_configuration(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = UserConfig(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Creates a new outbound channel to the given remote node and with the given value.
					/// 
					/// `user_channel_id` will be provided back as in
					/// [`Event::FundingGenerationReady::user_channel_id`] to allow tracking of which events
					/// correspond with which `create_channel` call. Note that the `user_channel_id` defaults to 0
					/// for inbound channels, so you may wish to avoid using 0 for `user_channel_id` here.
					/// `user_channel_id` has no meaning inside of LDK, it is simply copied to events and otherwise
					/// ignored.
					/// 
					/// Raises [`APIError::APIMisuseError`] when `channel_value_satoshis` > 2**24 or `push_msat` is
					/// greater than `channel_value_satoshis * 1k` or `channel_value_satoshis < 1000`.
					/// 
					/// Note that we do not check if you are currently connected to the given peer. If no
					/// connection is available, the outbound `open_channel` message may fail to send, resulting in
					/// the channel eventually being silently forgotten (dropped on reload).
					/// 
					/// Returns the new Channel's temporary `channel_id`. This ID will appear as
					/// [`Event::FundingGenerationReady::temporary_channel_id`] and in
					/// [`ChannelDetails::channel_id`] until after
					/// [`ChannelManager::funding_transaction_generated`] is called, swapping the Channel's ID for
					/// one derived from the funding transaction's TXID. If the counterparty rejects the channel
					/// immediately, this temporary ID will appear in [`Event::ChannelClosed::channel_id`].
					/// 
					/// [`Event::FundingGenerationReady::user_channel_id`]: events::Event::FundingGenerationReady::user_channel_id
					/// [`Event::FundingGenerationReady::temporary_channel_id`]: events::Event::FundingGenerationReady::temporary_channel_id
					/// [`Event::ChannelClosed::channel_id`]: events::Event::ChannelClosed::channel_id
					/// 
					/// Note that override_config (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func createChannel(theirNetworkKey: [UInt8], channelValueSatoshis: UInt64, pushMsat: UInt64, userChannelId: UInt64, overrideConfig: UserConfig) -> Result__u832APIErrorZ {
						// native call variable prep
						
						let theirNetworkKeyPrimitiveWrapper = PublicKey(value: theirNetworkKey)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_create_channel(thisArgPointer, theirNetworkKeyPrimitiveWrapper.cType!, channelValueSatoshis, pushMsat, userChannelId, overrideConfig.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNetworkKeyPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result__u832APIErrorZ(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Gets the list of open channels, in random order. See ChannelDetail field documentation for
					/// more information.
					public func listChannels() -> [ChannelDetails] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_list_channels(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_ChannelDetailsZ(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// Gets the list of usable channels, in random order. Useful as an argument to [`find_route`]
					/// to ensure non-announced channels are used.
					/// 
					/// These are guaranteed to have their [`ChannelDetails::is_usable`] value set to true, see the
					/// documentation for [`ChannelDetails::is_usable`] for more info on exactly what the criteria
					/// are.
					/// 
					/// [`find_route`]: crate::routing::router::find_route
					public func listUsableChannels() -> [ChannelDetails] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_list_usable_channels(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_ChannelDetailsZ(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// Begins the process of closing a channel. After this call (plus some timeout), no new HTLCs
					/// will be accepted on the given channel, and after additional timeout/the closing of all
					/// pending HTLCs, the channel will be closed on chain.
					/// 
					/// * If we are the channel initiator, we will pay between our [`Background`] and
					/// [`ChannelConfig::force_close_avoidance_max_fee_satoshis`] plus our [`Normal`] fee
					/// estimate.
					/// * If our counterparty is the channel initiator, we will require a channel closing
					/// transaction feerate of at least our [`Background`] feerate or the feerate which
					/// would appear on a force-closure transaction, whichever is lower. We will allow our
					/// counterparty to pay as much fee as they'd like, however.
					/// 
					/// May generate a SendShutdown message event on success, which should be relayed.
					/// 
					/// [`ChannelConfig::force_close_avoidance_max_fee_satoshis`]: crate::util::config::ChannelConfig::force_close_avoidance_max_fee_satoshis
					/// [`Background`]: crate::chain::chaininterface::ConfirmationTarget::Background
					/// [`Normal`]: crate::chain::chaininterface::ConfirmationTarget::Normal
					public func closeChannel(channelId: [UInt8], counterpartyNodeId: [UInt8]) -> Result_NoneAPIErrorZ {
						// native call variable prep
						
						let tupledChannelId = Bindings.arrayToUInt8Tuple32(array: channelId)
					
						let counterpartyNodeIdPrimitiveWrapper = PublicKey(value: counterpartyNodeId)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				
						withUnsafePointer(to: tupledChannelId) { (tupledChannelIdPointer: UnsafePointer<UInt8Tuple32>) in
				ChannelManager_close_channel(thisArgPointer, tupledChannelIdPointer, counterpartyNodeIdPrimitiveWrapper.cType!)
						}
				
						}
				

						// cleanup
						
						// for elided types, we need this
						counterpartyNodeIdPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_NoneAPIErrorZ(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Begins the process of closing a channel. After this call (plus some timeout), no new HTLCs
					/// will be accepted on the given channel, and after additional timeout/the closing of all
					/// pending HTLCs, the channel will be closed on chain.
					/// 
					/// `target_feerate_sat_per_1000_weight` has different meanings depending on if we initiated
					/// the channel being closed or not:
					/// * If we are the channel initiator, we will pay at least this feerate on the closing
					/// transaction. The upper-bound is set by
					/// [`ChannelConfig::force_close_avoidance_max_fee_satoshis`] plus our [`Normal`] fee
					/// estimate (or `target_feerate_sat_per_1000_weight`, if it is greater).
					/// * If our counterparty is the channel initiator, we will refuse to accept a channel closure
					/// transaction feerate below `target_feerate_sat_per_1000_weight` (or the feerate which
					/// will appear on a force-closure transaction, whichever is lower).
					/// 
					/// May generate a SendShutdown message event on success, which should be relayed.
					/// 
					/// [`ChannelConfig::force_close_avoidance_max_fee_satoshis`]: crate::util::config::ChannelConfig::force_close_avoidance_max_fee_satoshis
					/// [`Background`]: crate::chain::chaininterface::ConfirmationTarget::Background
					/// [`Normal`]: crate::chain::chaininterface::ConfirmationTarget::Normal
					public func closeChannelWithTargetFeerate(channelId: [UInt8], counterpartyNodeId: [UInt8], targetFeerateSatsPer_1000Weight: UInt32) -> Result_NoneAPIErrorZ {
						// native call variable prep
						
						let tupledChannelId = Bindings.arrayToUInt8Tuple32(array: channelId)
					
						let counterpartyNodeIdPrimitiveWrapper = PublicKey(value: counterpartyNodeId)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				
						withUnsafePointer(to: tupledChannelId) { (tupledChannelIdPointer: UnsafePointer<UInt8Tuple32>) in
				ChannelManager_close_channel_with_target_feerate(thisArgPointer, tupledChannelIdPointer, counterpartyNodeIdPrimitiveWrapper.cType!, targetFeerateSatsPer_1000Weight)
						}
				
						}
				

						// cleanup
						
						// for elided types, we need this
						counterpartyNodeIdPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_NoneAPIErrorZ(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Force closes a channel, immediately broadcasting the latest local transaction(s) and
					/// rejecting new HTLCs on the given channel. Fails if `channel_id` is unknown to
					/// the manager, or if the `counterparty_node_id` isn't the counterparty of the corresponding
					/// channel.
					public func forceCloseBroadcastingLatestTxn(channelId: [UInt8], counterpartyNodeId: [UInt8]) -> Result_NoneAPIErrorZ {
						// native call variable prep
						
						let tupledChannelId = Bindings.arrayToUInt8Tuple32(array: channelId)
					
						let counterpartyNodeIdPrimitiveWrapper = PublicKey(value: counterpartyNodeId)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				
						withUnsafePointer(to: tupledChannelId) { (tupledChannelIdPointer: UnsafePointer<UInt8Tuple32>) in
				ChannelManager_force_close_broadcasting_latest_txn(thisArgPointer, tupledChannelIdPointer, counterpartyNodeIdPrimitiveWrapper.cType!)
						}
				
						}
				

						// cleanup
						
						// for elided types, we need this
						counterpartyNodeIdPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_NoneAPIErrorZ(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Force closes a channel, rejecting new HTLCs on the given channel but skips broadcasting
					/// the latest local transaction(s). Fails if `channel_id` is unknown to the manager, or if the
					/// `counterparty_node_id` isn't the counterparty of the corresponding channel.
					/// 
					/// You can always get the latest local transaction(s) to broadcast from
					/// [`ChannelMonitor::get_latest_holder_commitment_txn`].
					public func forceCloseWithoutBroadcastingTxn(channelId: [UInt8], counterpartyNodeId: [UInt8]) -> Result_NoneAPIErrorZ {
						// native call variable prep
						
						let tupledChannelId = Bindings.arrayToUInt8Tuple32(array: channelId)
					
						let counterpartyNodeIdPrimitiveWrapper = PublicKey(value: counterpartyNodeId)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				
						withUnsafePointer(to: tupledChannelId) { (tupledChannelIdPointer: UnsafePointer<UInt8Tuple32>) in
				ChannelManager_force_close_without_broadcasting_txn(thisArgPointer, tupledChannelIdPointer, counterpartyNodeIdPrimitiveWrapper.cType!)
						}
				
						}
				

						// cleanup
						
						// for elided types, we need this
						counterpartyNodeIdPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_NoneAPIErrorZ(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Force close all channels, immediately broadcasting the latest local commitment transaction
					/// for each to the chain and rejecting new HTLCs on each.
					public func forceCloseAllChannelsBroadcastingLatestTxn() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_force_close_all_channels_broadcasting_latest_txn(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Force close all channels rejecting new HTLCs on each but without broadcasting the latest
					/// local transaction(s).
					public func forceCloseAllChannelsWithoutBroadcastingTxn() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_force_close_all_channels_without_broadcasting_txn(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Sends a payment along a given route.
					/// 
					/// Value parameters are provided via the last hop in route, see documentation for RouteHop
					/// fields for more info.
					/// 
					/// Note that if the payment_hash already exists elsewhere (eg you're sending a duplicative
					/// payment), we don't do anything to stop you! We always try to ensure that if the provided
					/// next hop knows the preimage to payment_hash they can claim an additional amount as
					/// specified in the last hop in the route! Thus, you should probably do your own
					/// payment_preimage tracking (which you should already be doing as they represent \"proof of
					/// payment\") and prevent double-sends yourself.
					/// 
					/// May generate SendHTLCs message(s) event on success, which should be relayed.
					/// 
					/// Each path may have a different return value, and PaymentSendValue may return a Vec with
					/// each entry matching the corresponding-index entry in the route paths, see
					/// PaymentSendFailure for more info.
					/// 
					/// In general, a path may raise:
					/// * [`APIError::RouteError`] when an invalid route or forwarding parameter (cltv_delta, fee,
					/// node public key) is specified.
					/// * [`APIError::ChannelUnavailable`] if the next-hop channel is not available for updates
					/// (including due to previous monitor update failure or new permanent monitor update
					/// failure).
					/// * [`APIError::MonitorUpdateInProgress`] if a new monitor update failure prevented sending the
					/// relevant updates.
					/// 
					/// Note that depending on the type of the PaymentSendFailure the HTLC may have been
					/// irrevocably committed to on our end. In such a case, do NOT retry the payment with a
					/// different route unless you intend to pay twice!
					/// 
					/// payment_secret is unrelated to payment_hash (or PaymentPreimage) and exists to authenticate
					/// the sender to the recipient and prevent payment-probing (deanonymization) attacks. For
					/// newer nodes, it will be provided to you in the invoice. If you do not have one, the Route
					/// must not contain multiple paths as multi-path payments require a recipient-provided
					/// payment_secret.
					/// If a payment_secret *is* provided, we assume that the invoice had the payment_secret feature
					/// bit set (either as required or as available). If multiple paths are present in the Route,
					/// we assume the invoice had the basic_mpp feature set.
					/// 
					/// Note that payment_secret (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func sendPayment(route: Route, paymentHash: [UInt8], paymentSecret: [UInt8]) -> Result_PaymentIdPaymentSendFailureZ {
						// native call variable prep
						
						let paymentHashPrimitiveWrapper = ThirtyTwoBytes(value: paymentHash)
				
						let paymentSecretPrimitiveWrapper = ThirtyTwoBytes(value: paymentSecret)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				
						withUnsafePointer(to: route.dynamicallyDangledClone().cType!) { (routePointer: UnsafePointer<LDKRoute>) in
				ChannelManager_send_payment(thisArgPointer, routePointer, paymentHashPrimitiveWrapper.cType!, paymentSecretPrimitiveWrapper.cType!)
						}
				
						}
				

						// cleanup
						
						// for elided types, we need this
						paymentHashPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						paymentSecretPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentIdPaymentSendFailureZ(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Retries a payment along the given [`Route`].
					/// 
					/// Errors returned are a superset of those returned from [`send_payment`], so see
					/// [`send_payment`] documentation for more details on errors. This method will also error if the
					/// retry amount puts the payment more than 10% over the payment's total amount, if the payment
					/// for the given `payment_id` cannot be found (likely due to timeout or success), or if
					/// further retries have been disabled with [`abandon_payment`].
					/// 
					/// [`send_payment`]: [`ChannelManager::send_payment`]
					/// [`abandon_payment`]: [`ChannelManager::abandon_payment`]
					public func retryPayment(route: Route, paymentId: [UInt8]) -> Result_NonePaymentSendFailureZ {
						// native call variable prep
						
						let paymentIdPrimitiveWrapper = ThirtyTwoBytes(value: paymentId)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				
						withUnsafePointer(to: route.dynamicallyDangledClone().cType!) { (routePointer: UnsafePointer<LDKRoute>) in
				ChannelManager_retry_payment(thisArgPointer, routePointer, paymentIdPrimitiveWrapper.cType!)
						}
				
						}
				

						// cleanup
						
						// for elided types, we need this
						paymentIdPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_NonePaymentSendFailureZ(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Signals that no further retries for the given payment will occur.
					/// 
					/// After this method returns, any future calls to [`retry_payment`] for the given `payment_id`
					/// will fail with [`PaymentSendFailure::ParameterError`]. If no such event has been generated,
					/// an [`Event::PaymentFailed`] event will be generated as soon as there are no remaining
					/// pending HTLCs for this payment.
					/// 
					/// Note that calling this method does *not* prevent a payment from succeeding. You must still
					/// wait until you receive either a [`Event::PaymentFailed`] or [`Event::PaymentSent`] event to
					/// determine the ultimate status of a payment.
					/// 
					/// [`retry_payment`]: Self::retry_payment
					/// [`Event::PaymentFailed`]: events::Event::PaymentFailed
					/// [`Event::PaymentSent`]: events::Event::PaymentSent
					public func abandonPayment(paymentId: [UInt8]) {
						// native call variable prep
						
						let paymentIdPrimitiveWrapper = ThirtyTwoBytes(value: paymentId)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_abandon_payment(thisArgPointer, paymentIdPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						paymentIdPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Send a spontaneous payment, which is a payment that does not require the recipient to have
					/// generated an invoice. Optionally, you may specify the preimage. If you do choose to specify
					/// the preimage, it must be a cryptographically secure random value that no intermediate node
					/// would be able to guess -- otherwise, an intermediate node may claim the payment and it will
					/// never reach the recipient.
					/// 
					/// See [`send_payment`] documentation for more details on the return value of this function.
					/// 
					/// Similar to regular payments, you MUST NOT reuse a `payment_preimage` value. See
					/// [`send_payment`] for more information about the risks of duplicate preimage usage.
					/// 
					/// Note that `route` must have exactly one path.
					/// 
					/// [`send_payment`]: Self::send_payment
					/// 
					/// Note that payment_preimage (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func sendSpontaneousPayment(route: Route, paymentPreimage: [UInt8]) -> Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ {
						// native call variable prep
						
						let paymentPreimagePrimitiveWrapper = ThirtyTwoBytes(value: paymentPreimage)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				
						withUnsafePointer(to: route.dynamicallyDangledClone().cType!) { (routePointer: UnsafePointer<LDKRoute>) in
				ChannelManager_send_spontaneous_payment(thisArgPointer, routePointer, paymentPreimagePrimitiveWrapper.cType!)
						}
				
						}
				

						// cleanup
						
						// for elided types, we need this
						paymentPreimagePrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Send a payment that is probing the given route for liquidity. We calculate the
					/// [`PaymentHash`] of probes based on a static secret and a random [`PaymentId`], which allows
					/// us to easily discern them from real payments.
					public func sendProbe(hops: [RouteHop]) -> Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ {
						// native call variable prep
						
						let hopsVector = Vec_RouteHopZ(array: hops).dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_send_probe(thisArgPointer, hopsVector.cType!)
						}
				

						// cleanup
						
						// hopsVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Call this upon creation of a funding transaction for the given channel.
					/// 
					/// Returns an [`APIError::APIMisuseError`] if the funding_transaction spent non-SegWit outputs
					/// or if no output was found which matches the parameters in [`Event::FundingGenerationReady`].
					/// 
					/// Returns [`APIError::APIMisuseError`] if the funding transaction is not final for propagation
					/// across the p2p network.
					/// 
					/// Returns [`APIError::ChannelUnavailable`] if a funding transaction has already been provided
					/// for the channel or if the channel has been closed as indicated by [`Event::ChannelClosed`].
					/// 
					/// May panic if the output found in the funding transaction is duplicative with some other
					/// channel (note that this should be trivially prevented by using unique funding transaction
					/// keys per-channel).
					/// 
					/// Do NOT broadcast the funding transaction yourself. When we have safely received our
					/// counterparty's signature the funding transaction will automatically be broadcast via the
					/// [`BroadcasterInterface`] provided when this `ChannelManager` was constructed.
					/// 
					/// Note that this includes RBF or similar transaction replacement strategies - lightning does
					/// not currently support replacing a funding transaction on an existing channel. Instead,
					/// create a new channel with a conflicting funding transaction.
					/// 
					/// Note to keep the miner incentives aligned in moving the blockchain forward, we recommend
					/// the wallet software generating the funding transaction to apply anti-fee sniping as
					/// implemented by Bitcoin Core wallet. See <https://bitcoinops.org/en/topics/fee-sniping/>
					/// for more details.
					/// 
					/// [`Event::FundingGenerationReady`]: crate::util::events::Event::FundingGenerationReady
					/// [`Event::ChannelClosed`]: crate::util::events::Event::ChannelClosed
					public func fundingTransactionGenerated(temporaryChannelId: [UInt8], counterpartyNodeId: [UInt8], fundingTransaction: [UInt8]) -> Result_NoneAPIErrorZ {
						// native call variable prep
						
						let tupledTemporaryChannelId = Bindings.arrayToUInt8Tuple32(array: temporaryChannelId)
					
						let counterpartyNodeIdPrimitiveWrapper = PublicKey(value: counterpartyNodeId)
				
						let fundingTransactionPrimitiveWrapper = Transaction(value: fundingTransaction).setCFreeability(freeable: false)
				
						fundingTransactionPrimitiveWrapper.cType!.data_is_owned = false
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				
						withUnsafePointer(to: tupledTemporaryChannelId) { (tupledTemporaryChannelIdPointer: UnsafePointer<UInt8Tuple32>) in
				ChannelManager_funding_transaction_generated(thisArgPointer, tupledTemporaryChannelIdPointer, counterpartyNodeIdPrimitiveWrapper.cType!, fundingTransactionPrimitiveWrapper.cType!)
						}
				
						}
				

						// cleanup
						
						// for elided types, we need this
						counterpartyNodeIdPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						fundingTransactionPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_NoneAPIErrorZ(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Atomically updates the [`ChannelConfig`] for the given channels.
					/// 
					/// Once the updates are applied, each eligible channel (advertised with a known short channel
					/// ID and a change in [`forwarding_fee_proportional_millionths`], [`forwarding_fee_base_msat`],
					/// or [`cltv_expiry_delta`]) has a [`BroadcastChannelUpdate`] event message generated
					/// containing the new [`ChannelUpdate`] message which should be broadcast to the network.
					/// 
					/// Returns [`ChannelUnavailable`] when a channel is not found or an incorrect
					/// `counterparty_node_id` is provided.
					/// 
					/// Returns [`APIMisuseError`] when a [`cltv_expiry_delta`] update is to be applied with a value
					/// below [`MIN_CLTV_EXPIRY_DELTA`].
					/// 
					/// If an error is returned, none of the updates should be considered applied.
					/// 
					/// [`forwarding_fee_proportional_millionths`]: ChannelConfig::forwarding_fee_proportional_millionths
					/// [`forwarding_fee_base_msat`]: ChannelConfig::forwarding_fee_base_msat
					/// [`cltv_expiry_delta`]: ChannelConfig::cltv_expiry_delta
					/// [`BroadcastChannelUpdate`]: events::MessageSendEvent::BroadcastChannelUpdate
					/// [`ChannelUpdate`]: msgs::ChannelUpdate
					/// [`ChannelUnavailable`]: APIError::ChannelUnavailable
					/// [`APIMisuseError`]: APIError::APIMisuseError
					public func updateChannelConfig(counterpartyNodeId: [UInt8], channelIds: [[UInt8]], config: ChannelConfig) -> Result_NoneAPIErrorZ {
						// native call variable prep
						
						let counterpartyNodeIdPrimitiveWrapper = PublicKey(value: counterpartyNodeId)
				
						let channelIdsVector = Vec_ThirtyTwoBytesZ(array: channelIds).dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				
						withUnsafePointer(to: config.dynamicallyDangledClone().cType!) { (configPointer: UnsafePointer<LDKChannelConfig>) in
				ChannelManager_update_channel_config(thisArgPointer, counterpartyNodeIdPrimitiveWrapper.cType!, channelIdsVector.cType!, configPointer)
						}
				
						}
				

						// cleanup
						
						// for elided types, we need this
						counterpartyNodeIdPrimitiveWrapper.noOpRetain()
				
						// channelIdsVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_NoneAPIErrorZ(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Processes HTLCs which are pending waiting on random forward delay.
					/// 
					/// Should only really ever be called in response to a PendingHTLCsForwardable event.
					/// Will likely generate further events.
					public func processPendingHtlcForwards() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_process_pending_htlc_forwards(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Performs actions which should happen on startup and roughly once per minute thereafter.
					/// 
					/// This currently includes:
					/// * Increasing or decreasing the on-chain feerate estimates for our outbound channels,
					/// * Broadcasting `ChannelUpdate` messages if we've been disconnected from our peer for more
					/// than a minute, informing the network that they should no longer attempt to route over
					/// the channel.
					/// * Expiring a channel's previous `ChannelConfig` if necessary to only allow forwarding HTLCs
					/// with the current `ChannelConfig`.
					/// 
					/// Note that this may cause reentrancy through `chain::Watch::update_channel` calls or feerate
					/// estimate fetches.
					public func timerTickOccurred() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_timer_tick_occurred(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Indicates that the preimage for payment_hash is unknown or the received amount is incorrect
					/// after a PaymentReceived event, failing the HTLC back to its origin and freeing resources
					/// along the path (including in our own channel on which we received it).
					/// 
					/// Note that in some cases around unclean shutdown, it is possible the payment may have
					/// already been claimed by you via [`ChannelManager::claim_funds`] prior to you seeing (a
					/// second copy of) the [`events::Event::PaymentReceived`] event. Alternatively, the payment
					/// may have already been failed automatically by LDK if it was nearing its expiration time.
					/// 
					/// While LDK will never claim a payment automatically on your behalf (i.e. without you calling
					/// [`ChannelManager::claim_funds`]), you should still monitor for
					/// [`events::Event::PaymentClaimed`] events even for payments you intend to fail, especially on
					/// startup during which time claims that were in-progress at shutdown may be replayed.
					public func failHtlcBackwards(paymentHash: [UInt8]) {
						// native call variable prep
						
						let tupledPaymentHash = Bindings.arrayToUInt8Tuple32(array: paymentHash)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				
						withUnsafePointer(to: tupledPaymentHash) { (tupledPaymentHashPointer: UnsafePointer<UInt8Tuple32>) in
				ChannelManager_fail_htlc_backwards(thisArgPointer, tupledPaymentHashPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Provides a payment preimage in response to [`Event::PaymentReceived`], generating any
					/// [`MessageSendEvent`]s needed to claim the payment.
					/// 
					/// Note that calling this method does *not* guarantee that the payment has been claimed. You
					/// *must* wait for an [`Event::PaymentClaimed`] event which upon a successful claim will be
					/// provided to your [`EventHandler`] when [`process_pending_events`] is next called.
					/// 
					/// Note that if you did not set an `amount_msat` when calling [`create_inbound_payment`] or
					/// [`create_inbound_payment_for_hash`] you must check that the amount in the `PaymentReceived`
					/// event matches your expectation. If you fail to do so and call this method, you may provide
					/// the sender \"proof-of-payment\" when they did not fulfill the full expected payment.
					/// 
					/// [`Event::PaymentReceived`]: crate::util::events::Event::PaymentReceived
					/// [`Event::PaymentClaimed`]: crate::util::events::Event::PaymentClaimed
					/// [`process_pending_events`]: EventsProvider::process_pending_events
					/// [`create_inbound_payment`]: Self::create_inbound_payment
					/// [`create_inbound_payment_for_hash`]: Self::create_inbound_payment_for_hash
					/// [`get_and_clear_pending_msg_events`]: MessageSendEventsProvider::get_and_clear_pending_msg_events
					public func claimFunds(paymentPreimage: [UInt8]) {
						// native call variable prep
						
						let paymentPreimagePrimitiveWrapper = ThirtyTwoBytes(value: paymentPreimage)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_claim_funds(thisArgPointer, paymentPreimagePrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						paymentPreimagePrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Gets the node_id held by this ChannelManager
					public func getOurNodeId() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_get_our_node_id(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// Accepts a request to open a channel after a [`Event::OpenChannelRequest`].
					/// 
					/// The `temporary_channel_id` parameter indicates which inbound channel should be accepted,
					/// and the `counterparty_node_id` parameter is the id of the peer which has requested to open
					/// the channel.
					/// 
					/// The `user_channel_id` parameter will be provided back in
					/// [`Event::ChannelClosed::user_channel_id`] to allow tracking of which events correspond
					/// with which `accept_inbound_channel`/`accept_inbound_channel_from_trusted_peer_0conf` call.
					/// 
					/// Note that this method will return an error and reject the channel, if it requires support
					/// for zero confirmations. Instead, `accept_inbound_channel_from_trusted_peer_0conf` must be
					/// used to accept such channels.
					/// 
					/// [`Event::OpenChannelRequest`]: events::Event::OpenChannelRequest
					/// [`Event::ChannelClosed::user_channel_id`]: events::Event::ChannelClosed::user_channel_id
					public func acceptInboundChannel(temporaryChannelId: [UInt8], counterpartyNodeId: [UInt8], userChannelId: UInt64) -> Result_NoneAPIErrorZ {
						// native call variable prep
						
						let tupledTemporaryChannelId = Bindings.arrayToUInt8Tuple32(array: temporaryChannelId)
					
						let counterpartyNodeIdPrimitiveWrapper = PublicKey(value: counterpartyNodeId)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				
						withUnsafePointer(to: tupledTemporaryChannelId) { (tupledTemporaryChannelIdPointer: UnsafePointer<UInt8Tuple32>) in
				ChannelManager_accept_inbound_channel(thisArgPointer, tupledTemporaryChannelIdPointer, counterpartyNodeIdPrimitiveWrapper.cType!, userChannelId)
						}
				
						}
				

						// cleanup
						
						// for elided types, we need this
						counterpartyNodeIdPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_NoneAPIErrorZ(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Accepts a request to open a channel after a [`events::Event::OpenChannelRequest`], treating
					/// it as confirmed immediately.
					/// 
					/// The `user_channel_id` parameter will be provided back in
					/// [`Event::ChannelClosed::user_channel_id`] to allow tracking of which events correspond
					/// with which `accept_inbound_channel`/`accept_inbound_channel_from_trusted_peer_0conf` call.
					/// 
					/// Unlike [`ChannelManager::accept_inbound_channel`], this method accepts the incoming channel
					/// and (if the counterparty agrees), enables forwarding of payments immediately.
					/// 
					/// This fully trusts that the counterparty has honestly and correctly constructed the funding
					/// transaction and blindly assumes that it will eventually confirm.
					/// 
					/// If it does not confirm before we decide to close the channel, or if the funding transaction
					/// does not pay to the correct script the correct amount, *you will lose funds*.
					/// 
					/// [`Event::OpenChannelRequest`]: events::Event::OpenChannelRequest
					/// [`Event::ChannelClosed::user_channel_id`]: events::Event::ChannelClosed::user_channel_id
					public func acceptInboundChannelFromTrustedPeer_0conf(temporaryChannelId: [UInt8], counterpartyNodeId: [UInt8], userChannelId: UInt64) -> Result_NoneAPIErrorZ {
						// native call variable prep
						
						let tupledTemporaryChannelId = Bindings.arrayToUInt8Tuple32(array: temporaryChannelId)
					
						let counterpartyNodeIdPrimitiveWrapper = PublicKey(value: counterpartyNodeId)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				
						withUnsafePointer(to: tupledTemporaryChannelId) { (tupledTemporaryChannelIdPointer: UnsafePointer<UInt8Tuple32>) in
				ChannelManager_accept_inbound_channel_from_trusted_peer_0conf(thisArgPointer, tupledTemporaryChannelIdPointer, counterpartyNodeIdPrimitiveWrapper.cType!, userChannelId)
						}
				
						}
				

						// cleanup
						
						// for elided types, we need this
						counterpartyNodeIdPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_NoneAPIErrorZ(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Gets a payment secret and payment hash for use in an invoice given to a third party wishing
					/// to pay us.
					/// 
					/// This differs from [`create_inbound_payment_for_hash`] only in that it generates the
					/// [`PaymentHash`] and [`PaymentPreimage`] for you.
					/// 
					/// The [`PaymentPreimage`] will ultimately be returned to you in the [`PaymentReceived`], which
					/// will have the [`PaymentReceived::payment_preimage`] field filled in. That should then be
					/// passed directly to [`claim_funds`].
					/// 
					/// See [`create_inbound_payment_for_hash`] for detailed documentation on behavior and requirements.
					/// 
					/// Note that a malicious eavesdropper can intuit whether an inbound payment was created by
					/// `create_inbound_payment` or `create_inbound_payment_for_hash` based on runtime.
					/// 
					/// # Note
					/// 
					/// If you register an inbound payment with this method, then serialize the `ChannelManager`, then
					/// deserialize it with a node running 0.0.103 and earlier, the payment will fail to be received.
					/// 
					/// Errors if `min_value_msat` is greater than total bitcoin supply.
					/// 
					/// [`claim_funds`]: Self::claim_funds
					/// [`PaymentReceived`]: events::Event::PaymentReceived
					/// [`PaymentReceived::payment_preimage`]: events::Event::PaymentReceived::payment_preimage
					/// [`create_inbound_payment_for_hash`]: Self::create_inbound_payment_for_hash
					public func createInboundPayment(minValueMsat: UInt64?, invoiceExpiryDeltaSecs: UInt32) -> Result_C2Tuple_PaymentHashPaymentSecretZNoneZ {
						// native call variable prep
						
						let minValueMsatOption = Option_u64Z(some: minValueMsat).danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_create_inbound_payment(thisArgPointer, minValueMsatOption.cType!, invoiceExpiryDeltaSecs)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_PaymentHashPaymentSecretZNoneZ(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Legacy version of [`create_inbound_payment`]. Use this method if you wish to share
					/// serialized state with LDK node(s) running 0.0.103 and earlier.
					/// 
					/// May panic if `invoice_expiry_delta_secs` is greater than one year.
					/// 
					/// # Note
					/// This method is deprecated and will be removed soon.
					/// 
					/// [`create_inbound_payment`]: Self::create_inbound_payment
					public func createInboundPaymentLegacy(minValueMsat: UInt64?, invoiceExpiryDeltaSecs: UInt32) -> Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ {
						// native call variable prep
						
						let minValueMsatOption = Option_u64Z(some: minValueMsat).danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_create_inbound_payment_legacy(thisArgPointer, minValueMsatOption.cType!, invoiceExpiryDeltaSecs)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Gets a [`PaymentSecret`] for a given [`PaymentHash`], for which the payment preimage is
					/// stored external to LDK.
					/// 
					/// A [`PaymentReceived`] event will only be generated if the [`PaymentSecret`] matches a
					/// payment secret fetched via this method or [`create_inbound_payment`], and which is at least
					/// the `min_value_msat` provided here, if one is provided.
					/// 
					/// The [`PaymentHash`] (and corresponding [`PaymentPreimage`]) should be globally unique, though
					/// note that LDK will not stop you from registering duplicate payment hashes for inbound
					/// payments.
					/// 
					/// `min_value_msat` should be set if the invoice being generated contains a value. Any payment
					/// received for the returned [`PaymentHash`] will be required to be at least `min_value_msat`
					/// before a [`PaymentReceived`] event will be generated, ensuring that we do not provide the
					/// sender \"proof-of-payment\" unless they have paid the required amount.
					/// 
					/// `invoice_expiry_delta_secs` describes the number of seconds that the invoice is valid for
					/// in excess of the current time. This should roughly match the expiry time set in the invoice.
					/// After this many seconds, we will remove the inbound payment, resulting in any attempts to
					/// pay the invoice failing. The BOLT spec suggests 3,600 secs as a default validity time for
					/// invoices when no timeout is set.
					/// 
					/// Note that we use block header time to time-out pending inbound payments (with some margin
					/// to compensate for the inaccuracy of block header timestamps). Thus, in practice we will
					/// accept a payment and generate a [`PaymentReceived`] event for some time after the expiry.
					/// If you need exact expiry semantics, you should enforce them upon receipt of
					/// [`PaymentReceived`].
					/// 
					/// Note that invoices generated for inbound payments should have their `min_final_cltv_expiry`
					/// set to at least [`MIN_FINAL_CLTV_EXPIRY`].
					/// 
					/// Note that a malicious eavesdropper can intuit whether an inbound payment was created by
					/// `create_inbound_payment` or `create_inbound_payment_for_hash` based on runtime.
					/// 
					/// # Note
					/// 
					/// If you register an inbound payment with this method, then serialize the `ChannelManager`, then
					/// deserialize it with a node running 0.0.103 and earlier, the payment will fail to be received.
					/// 
					/// Errors if `min_value_msat` is greater than total bitcoin supply.
					/// 
					/// [`create_inbound_payment`]: Self::create_inbound_payment
					/// [`PaymentReceived`]: events::Event::PaymentReceived
					public func createInboundPaymentForHash(paymentHash: [UInt8], minValueMsat: UInt64?, invoiceExpiryDeltaSecs: UInt32) -> Result_PaymentSecretNoneZ {
						// native call variable prep
						
						let paymentHashPrimitiveWrapper = ThirtyTwoBytes(value: paymentHash)
				
						let minValueMsatOption = Option_u64Z(some: minValueMsat).danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_create_inbound_payment_for_hash(thisArgPointer, paymentHashPrimitiveWrapper.cType!, minValueMsatOption.cType!, invoiceExpiryDeltaSecs)
						}
				

						// cleanup
						
						// for elided types, we need this
						paymentHashPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentSecretNoneZ(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Legacy version of [`create_inbound_payment_for_hash`]. Use this method if you wish to share
					/// serialized state with LDK node(s) running 0.0.103 and earlier.
					/// 
					/// May panic if `invoice_expiry_delta_secs` is greater than one year.
					/// 
					/// # Note
					/// This method is deprecated and will be removed soon.
					/// 
					/// [`create_inbound_payment_for_hash`]: Self::create_inbound_payment_for_hash
					public func createInboundPaymentForHashLegacy(paymentHash: [UInt8], minValueMsat: UInt64?, invoiceExpiryDeltaSecs: UInt32) -> Result_PaymentSecretAPIErrorZ {
						// native call variable prep
						
						let paymentHashPrimitiveWrapper = ThirtyTwoBytes(value: paymentHash)
				
						let minValueMsatOption = Option_u64Z(some: minValueMsat).danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_create_inbound_payment_for_hash_legacy(thisArgPointer, paymentHashPrimitiveWrapper.cType!, minValueMsatOption.cType!, invoiceExpiryDeltaSecs)
						}
				

						// cleanup
						
						// for elided types, we need this
						paymentHashPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentSecretAPIErrorZ(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Gets an LDK-generated payment preimage from a payment hash and payment secret that were
					/// previously returned from [`create_inbound_payment`].
					/// 
					/// [`create_inbound_payment`]: Self::create_inbound_payment
					public func getPaymentPreimage(paymentHash: [UInt8], paymentSecret: [UInt8]) -> Result_PaymentPreimageAPIErrorZ {
						// native call variable prep
						
						let paymentHashPrimitiveWrapper = ThirtyTwoBytes(value: paymentHash)
				
						let paymentSecretPrimitiveWrapper = ThirtyTwoBytes(value: paymentSecret)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_get_payment_preimage(thisArgPointer, paymentHashPrimitiveWrapper.cType!, paymentSecretPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						paymentHashPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						paymentSecretPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentPreimageAPIErrorZ(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Gets a fake short channel id for use in receiving [phantom node payments]. These fake scids
					/// are used when constructing the phantom invoice's route hints.
					/// 
					/// [phantom node payments]: crate::chain::keysinterface::PhantomKeysManager
					public func getPhantomScid() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_get_phantom_scid(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Gets route hints for use in receiving [phantom node payments].
					/// 
					/// [phantom node payments]: crate::chain::keysinterface::PhantomKeysManager
					public func getPhantomRouteHints() -> PhantomRouteHints {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_get_phantom_route_hints(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PhantomRouteHints(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Constructs a new MessageSendEventsProvider which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned MessageSendEventsProvider must be freed before this_arg is
					public func asMessageSendEventsProvider() -> MessageSendEventsProvider {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_as_MessageSendEventsProvider(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedMessageSendEventsProvider(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Constructs a new EventsProvider which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned EventsProvider must be freed before this_arg is
					public func asEventsProvider() -> EventsProvider {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_as_EventsProvider(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedEventsProvider(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Constructs a new Listen which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned Listen must be freed before this_arg is
					public func asListen() -> Listen {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_as_Listen(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedListen(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Constructs a new Confirm which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned Confirm must be freed before this_arg is
					public func asConfirm() -> Confirm {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_as_Confirm(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedConfirm(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Blocks until ChannelManager needs to be persisted or a timeout is reached. It returns a bool
					/// indicating whether persistence is necessary. Only one listener on
					/// `await_persistable_update` or `await_persistable_update_timeout` is guaranteed to be woken
					/// up.
					/// 
					/// Note that this method is not available with the `no-std` feature.
					public func awaitPersistableUpdateTimeout(maxWait: UInt64) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_await_persistable_update_timeout(thisArgPointer, maxWait)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Blocks until ChannelManager needs to be persisted. Only one listener on
					/// `await_persistable_update` or `await_persistable_update_timeout` is guaranteed to be woken
					/// up.
					public func awaitPersistableUpdate() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_await_persistable_update(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Gets a [`Future`] that completes when a persistable update is available. Note that
					/// callbacks registered on the [`Future`] MUST NOT call back into this [`ChannelManager`] and
					/// should instead register actions to be taken later.
					public func getPersistableUpdateFuture() -> Future {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_get_persistable_update_future(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Future(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Gets the latest best block which was connected either via the [`chain::Listen`] or
					/// [`chain::Confirm`] interfaces.
					public func currentBestBlock() -> BestBlock {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_current_best_block(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = BestBlock(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Constructs a new ChannelMessageHandler which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned ChannelMessageHandler must be freed before this_arg is
					public func asChannelMessageHandler() -> ChannelMessageHandler {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_as_ChannelMessageHandler(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedChannelMessageHandler(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Serialize the ChannelManager object into a byte array which can be read by ChannelManager_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// Constructs a new Payer which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned Payer must be freed before this_arg is
					public func asPayer() -> Payer {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
				ChannelManager_as_Payer(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedPayer(cType: nativeCallResult, anchor: self)
						

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
		

					internal func dangle() -> ChannelManager {
						self.dangling = true
						return self
					}

					
					internal func setCFreeability(freeable: Bool) -> ChannelManager {
						self.cType!.is_owned = freeable
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing ChannelManager \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ChannelManager \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		