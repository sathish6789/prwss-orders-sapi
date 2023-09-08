%dw 2.0
output application/json
---
if(!isEmpty(error.errorMessage.payload) and !isEmpty(error.errorMessage.payload.errorOrigin)) 
	error.errorMessage.payload
else { 
  "errorOrigin": p('application.name'),
  "status" : "ERROR",
  "message" :  error.description,
  "description" : if(!isEmpty(error.muleMessage.payload.description)) (error.muleMessage.payload.description) else error.detailedDescription,
  "correlationId" : vars.correlationId default "",
  "timestamp": now() as DateTime
}