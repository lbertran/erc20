### Diferencias de los ERC777 ante los ERC20

- Debe tener 18 decimales.
- Usa send(dest, amount, data) como alternativa a transfer(dest, amount). Se parece a cómo manejamos Ether y nos permite enviar data que puede ser manejada como a nuestra voluntad.
- Tiene hooks de tokensToSend y tokensReceived que nos permiten prohibir la entrada y salida de fondos. Esto con el fin de prevenir enviar tokens a addresses que no los manejen.
- Sistema de operators en vez de approve

#### Para deploy en redes no públicas

I am trying to deploy ERC777 on a private chain and i’m trying to use the tokensReceived feature. I notice that in order to do this with _send I need to register with the ERC1820 contract, which doesn’t exist on my private chain yet. Is there any example I can use to deploy the ERC1820 contract to the exact address that is required?

https://forum.openzeppelin.com/t/request-guide-to-deploy-erc1820/1007