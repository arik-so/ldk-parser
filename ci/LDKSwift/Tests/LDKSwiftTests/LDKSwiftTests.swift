//
//  LDKExperimentTest.swift
//  LDKExperimentTest
//
//  Created by Arik Sosman on 7/27/21.
//

#if SWIFT_PACKAGE
import LDKSwift
import LDKHeaders
#endif
import XCTest

class LDKSwiftTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        Bindings.setLogThreshold(severity: .DEBUG)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testVersionSanity() throws {
        check_get_ldk_version()
        check_get_ldk_bindings_version()
        // check_platform()
    }

    private func incrementalMemoryLeakTest() throws {
        let filter = TestFilter()
        let broadcaster = TestBroadcasterInterface()
        let logger = TestLogger()
        let feeEstimator = TestFeeEstimator()
        let persister = TestPersister()
        
        let chainMonitor = ChainMonitor(chainSource: filter, broadcaster: broadcaster, logger: logger, feeest: feeEstimator, persister: persister)

        let seed: [UInt8] = [UInt8](Data(base64Encoded: "//////////////////////////////////////////8=")!)
        let timestamp_seconds = UInt64(NSDate().timeIntervalSince1970)
        let timestamp_nanos = UInt32(truncating: NSNumber(value: timestamp_seconds * 1000 * 1000))

        let keysManager = KeysManager(seed: seed, startingTimeSecs: timestamp_seconds, startingTimeNanos: timestamp_nanos)
        let config = UserConfig.initWithDefault()

        let keysInterface = keysManager.asKeysInterface()

        let serialized_channel_manager = LDKTestFixtures.serializedChannelManager

        let serializedChannelMonitors: [[UInt8]] = LDKTestFixtures.serializedChannelMonitors

        var monitors: [LDKChannelMonitor] = []

        let channel_manager_constructor = try ChannelManagerConstructor(
                channel_manager_serialized: serialized_channel_manager,
                channel_monitors_serialized: serializedChannelMonitors,
                keys_interface: keysInterface,
                fee_estimator: feeEstimator,
                chain_monitor: chainMonitor,
                filter: filter,
                net_graph_serialized: nil,
                tx_broadcaster: broadcaster,
                logger: logger
        )

        let channel_manager = channel_manager_constructor.channelManager;
        let cmPersister = TestChannelManagerPersister(channelManager: channel_manager)

        let header = Self.hexStringToBytes(hexString: "f5591ea0b69ae3edc0de11497ffb0fdd91f769ede96c5d662c805364e9bf8b2243e8e5b9d1833eff7cb19abd9fc9da3cd26fe84d718bbf8a336966ae4f7dea6a81372961ffff7f200400000001020000")
        channel_manager.asConfirm().transactionsConfirmed(header: header, txdata: [(2, Self.hexStringToBytes(hexString: "020000000001010000000000000000000000000000000000000000000000000000000000000000ffffffff03530101ffffffff0200f2052a0100000017a9149e6d815a46cd349527961f58cc20d41d15fcb99e870000000000000000266a24aa21a9ede2f61c3f71d1defd3fa999dfa36953755c690689799962b48bebd836974e8cf90120000000000000000000000000000000000000000000000000000000000000000000000000")!)], height: 525)

        /*
        let amtSat: NSNumber = 2
        let sendRes = payer.pay_invoice(invoice: parsedInvoiceValue)
        if amtSat != 0 {
            let sendRes = payer.pay_zero_value_invoice(invoice: parsedInvoiceValue, amount_msats: UInt64(truncating: amtSat) * 1000)
            if let sendError = sendRes.getError(){
                print("pay_zero_value_invoice error type: \(sendError.getValueType())")
                if let sendRoutingError = sendError.getValueAsRouting() {
                    print("pay_zero_value_invoice routing error: \(sendRoutingError.get_err())")
                } else if let sendInvoiceError = sendError.getValueAsInvoice() {
                    print("pay_zero_value_invoice invoice error: \(sendInvoiceError)")
                } else if let sendSendingError = sendError.getValueAsSending() {
                    print("pay_zero_value_invoice sending error type: \(sendSendingError.getValueType())")
                    if let sendingParameterError = sendSendingError.getValueAsParameterError() {
                        print("pay_zero_value_invoice sending parameter error type: \(sendingParameterError.getValueType())")
                        if let parameterRouteError = sendingParameterError.getValueAsRouteError() {
                            print("pay_zero_value_invoice sending parameter route error: \(parameterRouteError.getErr())")
                        } else if let parameterChannelUnavailableError = sendingParameterError.getValueAsChannelUnavailable() {
                            print("pay_zero_value_invoice sending parameter channel unavailable error: \(parameterChannelUnavailableError.getErr())")
                        } else if let parameterAPIMisuseError = sendingParameterError.getValueAsAPIMisuseError() {
                            print("pay_zero_value_invoice sending parameter API misuse error: \(parameterAPIMisuseError.getErr())")
                        } else if let parameterFeeRateTooHighError = sendingParameterError.getValueAsFeeRateTooHigh() {
                            print("pay_zero_value_invoice sending parameter excessive fee rate error: \(parameterFeeRateTooHighError.getErr())")
                        } else if let parameterIncompatibleShutdownScriptError = sendingParameterError.getValueAsIncompatibleShutdownScript() {
                            print("pay_zero_value_invoice sending parameter incompatible shutdown script error: \(parameterIncompatibleShutdownScriptError.getScript().write())")
                        }
                    } else if let sendingPartialFailureError = sendSendingError.getValueAsPartialFailure() {
                        print("pay_zero_value_invoice sending parameter error payment id: \(sendingPartialFailureError.getPayment_id())")
                    } else if let sendingPathParameterError = sendSendingError.getValueAsPathParameterError() {
                        print("pay_zero_value_invoice sending path parameter errors: \(sendingPathParameterError.count)")
                    } else if let sendingAllFailedError = sendSendingError.getValueAsAllFailedRetrySafe() {
                        print("pay_zero_value_invoice sending all failed retry safe errors: \(sendingAllFailedError.count)")
                    }
                }
            }
            assert(sendRes.isOk())
        } else {
            let sendRes = payer.pay_invoice(invoice: parsedInvoiceValue)
            assert(sendRes.isOk())
        }
        */

        channel_manager_constructor.chain_sync_completed(persister: cmPersister, scorer: nil)
        channel_manager_constructor.interrupt()
    }

    func testMemoryLeaksIncrementally() throws {
        try incrementalMemoryLeakTest()
    }

    func testInvoiceSerialization() throws {
		let invoiceString = "lnbc100u1p38tg4pdqlf9h8vmmfvdjjqer9wd3hy6tsw35k7msnp4qvwaqdzmlur2m5hea2da3c4zhwhyxrgxe49yrq854vqw4kckrtvygpp58qkwaky9l09g332372qnr8kcdafvrf7re9z0l5vw9xa2kvdhglfqsp5axgjhklwf08jg7w57wvlk8yksgttcxkl7rjmjy8zqzpxslme5xcs9qyysgqcqpcrzjqve0ahnleay8csatqrugw062f43cyxhxq4gj6c4a2fgr5alr84a3wp66yqqqslcqqqqqqqlgqqqqqqqqfqfjudghme9fqk4mrqmw9n2g44navk3dnvn4en8yxxf7fcwhk7wp884j43etfyc5vzp2ss6g2dgrr285kd0lmsa5mjtnzd4d583rfjl3gpprr8ru"
		let invoiceResult = Invoice.fromStr(s: invoiceString)
		XCTAssertEqual(invoiceResult.isOk(), true)
		guard let invoice = invoiceResult.getValue() else { return }
		let regeneratedInvoiceString = invoice.toStr()
		print("restored invoice string: \(regeneratedInvoiceString)")
	}

	func testWeirdChannelManagerMemoryLeak() async throws {
        let reversedGenesisHashHex = "6fe28c0ab6f1b372c1a6a246ae63f74f931e8365e15a089c68d6190000000000"
        let reversedGenesisHash = Self.hexStringToBytes(hexString: reversedGenesisHashHex)!

        let seed: [UInt8] = [UInt8](Data(base64Encoded: "//////////////////////////////////////////8=")!)
        let timestamp_seconds = UInt64(NSDate().timeIntervalSince1970)
        let timestamp_nanos = UInt32(truncating: NSNumber(value: timestamp_seconds * 1000 * 1000))

        let keysManager = KeysManager(seed: seed, startingTimeSecs: timestamp_seconds, startingTimeNanos: timestamp_nanos)
        let keysInterface = keysManager.asKeysInterface()

        let logger = TestLogger()

        let config = UserConfig.initWithDefault()
        let networkGraph = NetworkGraph(genesisHash: reversedGenesisHash, logger: logger)

        let scoringParams = ProbabilisticScoringParameters.initWithDefault()
        let probabalisticScorer = ProbabilisticScorer(params: scoringParams, networkGraph: networkGraph, logger: logger)
        let score = probabalisticScorer.asScore()
        let multiThreadedScorer = MultiThreadedLockableScore(score: score)

        let feeEstimator = TestFeeEstimator()
        let broadcaster = TestBroadcasterInterface()

        let channelMonitorPersister = TestPersister()
        let chainMonitor = ChainMonitor(chainSource: nil, broadcaster: broadcaster, logger: logger, feeest: feeEstimator, persister: channelMonitorPersister)

        let channelManagerConstructor = ChannelManagerConstructor(network: .Bitcoin, config: config, current_blockchain_tip_hash: reversedGenesisHash, current_blockchain_tip_height: 0, keys_interface: keysInterface, fee_estimator: feeEstimator, chain_monitor: chainMonitor, net_graph: networkGraph, tx_broadcaster: broadcaster, logger: logger)
        let channelManager = channelManagerConstructor.channelManager
        let peerManager = channelManagerConstructor.peerManager
        let tcpPeerHandler = channelManagerConstructor.getTCPPeerHandler()
        if channelManagerConstructor.net_graph != nil {
            print("net graph available!")
        }

        let channelManagerAndNetworkGraphPersisterAndEventHandler = FloatingChannelManagerPersister(channelManager: channelManager)
    }
    
    func testChannelCreationResultError() async throws {
        let reversedGenesisHashHex = "6fe28c0ab6f1b372c1a6a246ae63f74f931e8365e15a089c68d6190000000000"
        let reversedGenesisHash = Self.hexStringToBytes(hexString: reversedGenesisHashHex)!

        let seed: [UInt8] = [UInt8](Data(base64Encoded: "//////////////////////////////////////////8=")!)
        let timestamp_seconds = UInt64(NSDate().timeIntervalSince1970)
        let timestamp_nanos = UInt32(truncating: NSNumber(value: timestamp_seconds * 1000 * 1000))

        let keysManager = KeysManager(seed: seed, startingTimeSecs: timestamp_seconds, startingTimeNanos: timestamp_nanos)
        let keysInterface = keysManager.asKeysInterface()

        let logger = TestLogger()

        let config = UserConfig.initWithDefault()
        let lightningNetwork = LDKNetwork_Bitcoin
        let networkGraph = NetworkGraph(genesisHash: reversedGenesisHash, logger: logger)

        let scoringParams = ProbabilisticScoringParameters.initWithDefault()
        let probabalisticScorer = ProbabilisticScorer(params: scoringParams, networkGraph: networkGraph, logger: logger)
        let score = probabalisticScorer.asScore()
        let multiThreadedScorer = MultiThreadedLockableScore(score: score)

        let feeEstimator = TestFeeEstimator()
        let broadcaster = TestBroadcasterInterface()

        let channelMonitorPersister = TestPersister()
        let chainMonitor = ChainMonitor(chainSource: nil, broadcaster: broadcaster, logger: logger, feeest: feeEstimator, persister: channelMonitorPersister)

        let channelManagerConstructor = ChannelManagerConstructor(network: .Bitcoin, config: config, current_blockchain_tip_hash: reversedGenesisHash, current_blockchain_tip_height: 0, keys_interface: keysInterface, fee_estimator: feeEstimator, chain_monitor: chainMonitor, net_graph: networkGraph, tx_broadcaster: broadcaster, logger: logger)
        let channelManager = channelManagerConstructor.channelManager
        
        let channelValue: UInt64 = 1_300_000 // 1.3 million satoshis, or 0.013 BTC
        let channelValueBtcString = "0.013"
        let reserveAmount: UInt64 = 1000 // a thousand satoshis rserve
        let peerPubkey = Self.hexStringToBytes(hexString: "02deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef")!
        let channelOpenResult = channelManager.createChannel(theirNetworkKey: peerPubkey, channelValueSatoshis: channelValue, pushMsat: reserveAmount, userChannelId: 42, overrideConfig: config)
        
        let channelOpenError = channelOpenResult.getError()!
        print("error type: \(channelOpenError.getValueType())")
        
        let channelUnavailableError = channelOpenError.getValueAsChannelUnavailable()!
        print("channel unavailable error: \(channelUnavailableError.getErr())")
    }

    
	func testMainnetGraphSync() async throws {
        let reversedGenesisHashHex = "6fe28c0ab6f1b372c1a6a246ae63f74f931e8365e15a089c68d6190000000000"
        let reversedGenesisHash = Self.hexStringToBytes(hexString: reversedGenesisHashHex)!

        let seed: [UInt8] = [UInt8](Data(base64Encoded: "//////////////////////////////////////////8=")!)
		let timestamp_seconds = UInt64(NSDate().timeIntervalSince1970)
		let timestamp_nanos = UInt32(truncating: NSNumber(value: timestamp_seconds * 1000 * 1000))
        let keysManager = KeysManager(seed: seed, startingTimeSecs: timestamp_seconds, startingTimeNanos: timestamp_nanos)
        let keysInterface = keysManager.asKeysInterface()

        let logger = MuteLogger()

        let config = UserConfig.initWithDefault()
        let lightningNetwork: Bindings.Network = .Bitcoin
        let networkGraph = NetworkGraph(genesisHash: reversedGenesisHash, logger: logger)

        let scoringParams = ProbabilisticScoringParameters.initWithDefault()
        let probabalisticScorer = ProbabilisticScorer(params: scoringParams, networkGraph: networkGraph, logger: logger)
        let score = probabalisticScorer.asScore()
        let multiThreadedScorer = MultiThreadedLockableScore(score: score)

        let feeEstimator = TestFeeEstimator()
        let broadcaster = TestBroadcasterInterface()

        let channelMonitorPersister = TestPersister()
        let chainMonitor = ChainMonitor(chainSource: nil, broadcaster: broadcaster, logger: logger, feeest: feeEstimator, persister: channelMonitorPersister)

        let channelManagerConstructor = ChannelManagerConstructor(network: lightningNetwork, config: config, current_blockchain_tip_hash: reversedGenesisHash, current_blockchain_tip_height: 0, keys_interface: keysInterface, fee_estimator: feeEstimator, chain_monitor: chainMonitor, net_graph: networkGraph, tx_broadcaster: broadcaster, logger: logger)
        let channelManager = channelManagerConstructor.channelManager
        let peerManager = channelManagerConstructor.peerManager
        let tcpPeerHandler = channelManagerConstructor.getTCPPeerHandler()
        if channelManagerConstructor.net_graph != nil {
            print("net graph available!")
        }

        Bindings.setLogThreshold(severity: .WARNING)

        // bitrefill
        tcpPeerHandler.connect(address: "52.50.244.44", port: 9735, theirNodeId: Self.hexStringToBytes(hexString: "030c3f19d742ca294a55c00376b3b355c3c90d61c6b6b39554dbc7ac19b141c14f")!)

        // River
        tcpPeerHandler.connect(address: "104.196.249.140", port: 9735, theirNodeId: Self.hexStringToBytes(hexString: "03037dc08e9ac63b82581f79b662a4d0ceca8a8ca162b1af3551595b8f2d97b70a")!)

        // Acinq
        tcpPeerHandler.connect(address: "3.33.236.230", port: 9735, theirNodeId: Self.hexStringToBytes(hexString: "03864ef025fde8fb587d989186ce6a4a186895ee44a926bfc370e2c366597a3f8f")!)

        // Kraken
        tcpPeerHandler.connect(address: "52.13.118.208", port: 9735, theirNodeId: Self.hexStringToBytes(hexString: "02f1a8c87607f415c8f22c00593002775941dea48869ce23096af27b0cfdcc0b69")!)

        // Matt
        tcpPeerHandler.connect(address: "69.59.18.80", port: 9735, theirNodeId: Self.hexStringToBytes(hexString: "03db10aa09ff04d3568b0621750794063df401e6853c79a21a83e1a3f3b5bfb0c8")!)


        let channelManagerAndNetworkGraphPersisterAndEventHandler = TestChannelManagerPersister()
        channelManagerConstructor.chain_sync_completed(persister: channelManagerAndNetworkGraphPersisterAndEventHandler, scorer: multiThreadedScorer)

        // run this for one minute
        for _ in 0..<600 {
            // sleep for 100ms
            try! await Task.sleep(nanoseconds: 0_100_000_000)
        }

		Bindings.setLogThreshold(severity: .DEBUG)
    }
    

    func testRouteConstruction() throws {

        let destPubkeyHex = "03c2abfa93eacec04721c019644584424aab2ba4dff3ac9bdab4e9c97007491dda"
        let short_channel_id_arg: UInt64 = 762615767524704256
        let paymentValueMsat: UInt64 = 666000
        let finalCltvValue: UInt32 = 40

        let routeHop = RouteHop(
            pubkeyArg: Self.hexStringToBytes(hexString: destPubkeyHex)!,
            nodeFeaturesArg: NodeFeatures.initWithEmpty(),
            shortChannelIdArg: short_channel_id_arg,
            channelFeaturesArg: ChannelFeatures.initWithEmpty(),
            feeMsatArg: paymentValueMsat,
            cltvExpiryDeltaArg: finalCltvValue
        )

        var path: [RouteHop] = [routeHop]

        for _ in 0..<3 {

            let extraHop = RouteHop(
                pubkeyArg: Self.hexStringToBytes(hexString: destPubkeyHex)!,
                nodeFeaturesArg: NodeFeatures.initWithEmpty(),
                shortChannelIdArg: short_channel_id_arg,
                channelFeaturesArg: ChannelFeatures.initWithEmpty(),
                feeMsatArg: paymentValueMsat,
                cltvExpiryDeltaArg: finalCltvValue
            )
            path.append(extraHop)
        }

        let paymentParams = PaymentParameters.initWithForKeysend(payeePubkey: Self.hexStringToBytes(hexString: destPubkeyHex)!)
        let route = Route(pathsArg: [path], paymentParamsArg: paymentParams)
    }

    #if !SWIFT_PACKAGE
    public func testRapidGossipSync() async throws {
		// first, download the gossip data
		print("Sending rapid gossip sync request…");
		var request = URLRequest(url: URL(string: "https://rapidsync.lightningdevkit.org/snapshot/0")!)
		request.httpMethod = "GET"

		let startA = DispatchTime.now()
		let (data, _) = try await URLSession.shared.data(for: request)
		let finishA = DispatchTime.now()
		let elapsedA = Double(finishA.uptimeNanoseconds-startA.uptimeNanoseconds)/1_000_000_000
		print("Received rapid gossip sync response: \(data.count) bytes! Time: \(elapsedA)s");

		let reversedGenesisHashHex = "6fe28c0ab6f1b372c1a6a246ae63f74f931e8365e15a089c68d6190000000000"
		let reversedGenesisHash = LDKSwiftTests.hexStringToBytes(hexString: reversedGenesisHashHex)!

		let logger = TestLogger()
        let networkGraph = NetworkGraph(genesisHash: reversedGenesisHash, logger: logger)
        let rapidSync = RapidGossipSync(networkGraph: networkGraph)

		let gossipDataRaw = [UInt8](data)
		print("Applying rapid sync data…")
		let startB = DispatchTime.now()
		let timestamp = rapidSync.updateNetworkGraph(updateData: gossipDataRaw)
		if let error = timestamp.getError() {
			print("error! type: \(error.getValueType())")
			let specificError = error.getValueAsLightningError()
			print("details: \(specificError?.getErr())")
		}
		let finishB = DispatchTime.now()
		let elapsedB = Double(finishB.uptimeNanoseconds-startB.uptimeNanoseconds)/1_000_000_000
		print("Applied rapid sync data: \(timestamp.getValue())! Time: \(elapsedB)s")

        /*
		print("Measuring graph size…")
		let startC = DispatchTime.now()
		let graphBytes = networkGraph.write()
		let finishC = DispatchTime.now()
		let elapsedC = Double(finishC.uptimeNanoseconds-startC.uptimeNanoseconds)/1_000_000_000
		print("Network graph size: \(graphBytes.count)! Time: \(elapsedC)s")
        */

        let scoringParams = ProbabilisticScoringParameters.initWithDefault()
        let scorer = ProbabilisticScorer(params: scoringParams, networkGraph: networkGraph, logger: logger)
        let score = scorer.asScore()
        // let lockableScore = LockableScore()
        // let defaultRouter = DefaultRouter(network_graph: networkGraph, logger: logger, random_seed_bytes: [UInt8](repeating: 0, count: 32), scorer: lockableScore)
		// let router = defaultRouter.as_Router()
		
		// let multiThreadedScorer = MultiThreadedLockableScore(score: score)


        
        let payerPubkey = LDKSwiftTests.hexStringToBytes(hexString: "0242a4ae0c5bef18048fbecf995094b74bfb0f7391418d71ed394784373f41e4f3")!
        let recipientPubkey = LDKSwiftTests.hexStringToBytes(hexString: "03864ef025fde8fb587d989186ce6a4a186895ee44a926bfc370e2c366597a3f8f")!

        let paymentParameters = PaymentParameters.initWithForKeysend(payeePubkey: recipientPubkey)
        let routeParameters = RouteParameters(paymentParamsArg: paymentParameters, finalValueMsatArg: 500, finalCltvExpiryDeltaArg: 3)

		print("STEP A")

		let firstHops: [ChannelDetails]? = nil
		print("STEP B")
        let randomSeedBytes: [UInt8] = [UInt8](repeating: 0, count: 32)
        let foundRoute = Bindings.swiftFindRoute(ourNodePubkey: payerPubkey, routeParams: routeParameters, networkGraph: networkGraph, firstHops: [], logger: logger, scorer: score, randomSeedBytes: randomSeedBytes)
//        let foundRoute = router.find_route(payer: payerPubkey, route_params: routeParameters, payment_hash: nil, first_hops: firstHops, inflight_htlcs: <#T##InFlightHtlcs#>)
        
        if let routeError = foundRoute.getError() {
            print("routing error: \(routeError.getErr())")
        }
        
        if let route = foundRoute.getValue() {
            let paths = route.getPaths()
            print("found route with \(paths.count) paths!")
            for currentPath in paths {
                print("\nPath Option:")
                for currentHop in currentPath {
                    print("scid: \(currentHop.getShortChannelId()), pubkey: \(currentHop.getPubkey()), fee (msat): \(currentHop.getFeeMsat()), CLTV delta: \(currentHop.getCltvExpiryDelta())")
                }
            }
        }
        
	}
    #endif

    func testExtendedActivity() async throws {
		// for i in 0...(1 << 7) {
        let combinationCount = HumanObjectPeerTestInstance.Configuration.combinationCount()
        for i in 0..<combinationCount { // only do one test run initially
            
            print("Running test with flags \(i)");
            
            let config = HumanObjectPeerTestInstance.Configuration()
            
            config.shouldRecipientRejectPayment = (i & (1 << 0)) != 0
            print("shouldRecipientRejectPayment: \(config.shouldRecipientRejectPayment)")
            
            config.useFilter = (i & (1 << 1)) != 0
            print("useFilter: \(config.useFilter)")
            
            config.useRouter = (i & (1 << 2)) != 0
            print("useRouter: \(config.useRouter)")
            
            /*
            config.nice_close = (i & (1 << 0)) != 0;
            config.use_km_wrapper = (i & (1 << 1)) != 0;
            config.use_manual_watch = (i & (1 << 2)) != 0;
            config.reload_peers = (i & (1 << 3)) != 0;
            config.break_cross_peer_refs = (i & (1 << 4)) != 0;
            config.use_nio_peer_handler = true // (i & (1 << 5)) != 0;
            config.useChannelManagerConstructor = true //  (i & (1 << 6)) != 0;

            if (config.break_cross_peer_refs && !config.reload_peers) {
				// There are no cross refs to break without reloading peers.
				continue;
			}

            if (config.useChannelManagerConstructor && (config.use_manual_watch || !config.use_nio_peer_handler)) {
				// ChannelManagerConstructor requires a ChainMonitor as the Watch and creates a NioPeerHandler for us.
				continue;
			}
            */

            let instance = HumanObjectPeerTestInstance(configuration: config)
            await instance.testMessageHandling()
		}

	}

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        Bindings.setLogThreshold(severity: .WARNING)
        measure {
            // Put the code you want to measure the time of here.
            // try! incrementalMemoryLeakTest()
        }
        Bindings.setLogThreshold(severity: .DEBUG)
    }

    internal class func hexStringToBytes(hexString: String) -> [UInt8]? {
        let hexStr = hexString.dropFirst(hexString.hasPrefix("0x") ? 2 : 0)

        guard hexStr.count % 2 == 0 else {
            return nil
        }

        var newData = [UInt8]()

        var indexIsEven = true
        for i in hexStr.indices {
            if indexIsEven {
                let byteRange = i...hexStr.index(after: i)
                guard let byte = UInt8(hexStr[byteRange], radix: 16) else {
                    return nil
                }
                newData.append(byte)
            }
            indexIsEven.toggle()
        }
        return newData
    }

    internal class func bytesToHexString(bytes: [UInt8]) -> String {
        let format = "%02hhx" // "%02hhX" (uppercase)
        return bytes.map {
            String(format: format, $0)
        }.joined()
    }

}
