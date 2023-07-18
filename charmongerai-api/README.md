# charmongerai-API

charmongerai-API is the websocket API endpoint of charmongerai, which would allow users to interact with charmongerai through API interface. With charmongerai-API, anyone can convinienlty build interactive application that incorporates the emerging human-like capability from LLM.

charmongerai-API is built on top of [langchain-serve](https://github.com/jina-ai/langchain-serve/tree/main) with websocket, and makes use of the [Human-in-the-loop](https://github.com/jina-ai/langchain-serve/tree/main/examples/websockets/hitl) capability to provide an interactive API experience just like running the charmongerai application through python natively and locally.

## Endpoint

`/runcharmongerai`: the websocket endpoint to start and run a charmongerai session.

### How the enpoint works

To initialize the charmongerai session, a user needs to send the agent configurations in the json format.

Once the websocket session is initiated, the endpoint will return the instructions of what user inputs are needed, and the web app can send the user inputs to the existing session through the established websocket and continue the charmongerai session.

More information about how to use the `/runcharmongerai` endpoint can be found through the example app.

### How to use the endpoint 

#### Use public cloud deployment
The cloud charmongerai websocket API is deployed at wss://langchain-558b0f2c14.wolf.jina.ai.

#### Use local deployment for testing

charmongerai-API supports a local deployment for testing. To run the endpoint locally, follow the steps blew:
* Install langchain-serve
```
pip install langchain-serve
```
* Deploy charmongerai-API locally
```
git clone https://github.com/vd7dv7/charmongerai.git
cd charmongerai/charmongerai-api
lc-serve deploy local charmongerai-api
```
* Run the example client app
```
cd charmongerai/charmongerai-api/example
python charmongerai-api-client.py -f <path-to-agent-config-json-files> -m <llm-model>
```

## TODO
- [X] Return the error message with termination
- [X] Stream output back to client
- [X] Extend the client example to match the BigBangTheory from the example folder
- [X] Deployment on Jina cloud: requires new charmongerai python package release
- [ ] Implement API auth on Jina cloud