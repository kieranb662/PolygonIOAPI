# Polygon IO API

An unofficial Swift API for polygon.io API. Makes use of Combine to make calls to the server and publish the results. 

Make the PolygonIO object 

```
let polygonIO = PolygonIO(apiKey: "Replace with your key",
                          baseURL: "api.polygon.io",
                          sessionManager: SessionManager())
```

Then when you want to fetch something like a ticker for instance. 

```
polygonIO.tickers(search: "AAPL") // Returns a Publisher 
```
