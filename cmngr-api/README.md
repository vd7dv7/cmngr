# cmngr-API

cmngr-API is the websocket API endpoint of cmngr, which would allow users to interact with cmngr through API interface. With cmngr-API, anyone can convinienlty build interactive application that incorporates the emerging human-like capability from LLM.

cmngr-API is built on top of [langchain-serve](https://github.com/jina-ai/langchain-serve/tree/main) with websocket, and makes use of the [Human-in-the-loop](https://github.com/jina-ai/langchain-serve/tree/main/examples/websockets/hitl) capability to provide an interactive API experience just like running the cmngr application through python natively and locally.

## Endpoint

`/runcmngr`: the websocket endpoint to start and run a cmngr session.

### How the enpoint works

To initialize the cmngr session, a user needs to send the agent configurations in the json format.

Once the websocket session is initiated, the endpoint will return the instructions of what user inputs are needed, and the web app can send the user inputs to the existing session through the established websocket and continue the cmngr session.

More information about how to use the `/runcmngr` endpoint can be found through the example app.

### How to use the endpoint 

#### Use public cloud deployment
The cloud cmngr websocket API is deployed at wss://langchain-558b0f2c14.wolf.jina.ai.

#### Use local deployment for testing

cmngr-API supports a local deployment for testing. To run the endpoint locally, follow the steps blew:
* Install langchain-serve
```
pip install langchain-serve
```
* Deploy cmngr-API locally
```
git clone https://github.com/vd7dv7/cmngr.git
cd cmngr/cmngr-api
lc-serve deploy local cmngr-api
```
* Run the example client app
```
cd cmngr/cmngr-api/example
python cmngr-api-client.py -f <path-to-agent-config-json-files> -m <llm-model>
```

## TODO
- [X] Return the error message with termination
- [X] Stream output back to client
- [X] Extend the client example to match the BigBangTheory from the example folder
- [X] Deployment on Jina cloud: requires new cmngr python package release
- [ ] Implement API auth on Jina cloud