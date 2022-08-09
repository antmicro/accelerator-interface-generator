## Configuration
The AIG is configured with the JSON configuration file (`config.json` by default)

Here's a template for a configuration file, with explanation of each field below.
```json
{
    "busConfiguration": <busConfiguration>,
    
    "DMAIn": {
        "baseAddress": <dmaInAddr>
    },
    
    "DMAOut": {
        "baseAddress": <dmaOutAddr>
    },
    
    "Accelerator": {
    
        "sourceFile": <acceleratorFilename>,
        "topName": <acceleratorTopModule>,
        "baseAddress": <AcceleratorAddr>,
        
        "params": {
            "addrWidth": <addrWidth>,
            "dataWidth": <dataWidth>,
            "maxBurst": <maxBurst>,
            "controlAddrWidth": <controlAddrWidth>,
            "controlDataWidth": <controlDataWidth>,
            "fifoDepth": <fifoDepth>
        },
        
        "signals": {
            "clock": <clock>,
            "reset": <reset>,
            "input": {
                "tdata": <tdata>,
                "tvalid": <tvalid>,
                "tready": <tready>,
                "tuser": <tuser>,
                "tlast": <tlast>
            },
            "output": {
                "tdata": <tdata>,
                "tvalid": <tvalid>,
                "tready": <tready>,
                "tuser": <tuser>,
                "tlast": <tlast>
            }
        },
        
        "csr": [
            {
                "name": <csrName>,
                "type": <csrType>,
                "address": <csrAddress>,
                "fields": [
                    {
                        "name": <fieldName>,
                        "type": <fieldType>,
                        "direction": <fieldDirection>,
                        "size": <fieldSize>
                    },
                    ...
                ]
            },
            ...
        ]
    }
}
```

JSON SCHEMA????
### busConfiguration: string
---
Declaration of bus type configuration that will handle input/output data and CSRs.




### DMAIn
---
#### baseAddress
#### params

### DMAOut
---
#### baseAddress
#### params

### Accelerator
---
#### sourceFile 
#### topName
#### baseAddress
#### params
#### signals
#### csr
##### name
##### type
##### address
##### fields
###### name
###### type
###### direction
###### size


