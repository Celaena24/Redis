import net, json, strutils, os

const port = Port(5000)

proc main() =
    # Initializing
    echo "Creating server..."

    # Create socket and listen for connections
    let socket = newSocket()
    socket.bindAddr(port)
    socket.listen()

    var client: Socket
    var address = ""
    while true:
        # Accept connection
        socket.acceptAddr(client, address)
        echo "Client connected from: ", address

when isMainModule:
    main()

