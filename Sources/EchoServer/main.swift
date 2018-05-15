let server = EchoServer(host: "localhost", port: 3010)
do {
    try server.start()
    print("Server listening on port \(String(describing: server.port))")
} catch let error {
    print("Error: \(error.localizedDescription)")
    server.stop()
}
