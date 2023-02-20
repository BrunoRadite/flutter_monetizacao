import 'dart:convert';

// configuração padrão para o Gpay
String defaultConfigGpay = jsonEncode({
  // pode ser apple_pay ou google_pay
  "provider": "google_pay",
  // este é o núcleo do PaymentRequest que é um JSON em si
  "data": {
    // pode ser TEST ou PRODUCTION
    "environment": "TEST",
    "apiVersion": 2,
    "apiVersionMinor": 0,
    // é do tipo PaymentMethod e especifica o suporte para um ou mais métodos de pagamento suportados pela API do G Pay.
    "allowedPaymentMethods": [
      {
        // só suporta CARD mesmo
        "type": "CARD",
        // é do tipo TokenizationSpecification
        "tokenizationSpecification": {
          // para CARDmétodo de pagamento, use PAYMENT_GATEWAY.
          "type": "PAYMENT_GATEWAY",
          // compreende um objeto Gateway
          "parameters": {
            "gateway": "example",
            "gatewayMerchantId": "gatewayMerchantId"
          }
        },
        // é do tipo CardParameter
        "parameters": {
          // uma ou mais redes de cartão compatíveis com você e a API do Google Pay. por exemplo , AMEX, DISCOVER, INTERAC, JCB, MASTERCARD, VISA
          "allowedCardNetworks": ["VISA", "MASTERCARD"],
          // matriz de string de campos que são suportados para autenticar uma transação de cartão.
          "allowedAuthMethods": ["PAN_ONLY", "CRYPTOGRAM_3DS"],
          // opcional: defina como truese você precisar de um endereço de cobrança. Isso pode aumentar o atrito.
          "billingAddressRequired": true,
          // é do tipo BillingAddressParameters
          "billingAddressParameters": {
            // formato do endereço de cobrança necessário para concluir a transação.
            // por exemplo , MIN( Nome, código do país e código postal ) e FULL (longa lista de parâmetros)
            "format": "FULL",
            // defina como truese um número de telefone for necessário para processar a transação.
            "phoneNumberRequired": true
          }
        }
      }
    ],
    // tipo MerchantInfo fornece informações sobre o comerciante que solicita dados de pagamento
    "merchantInfo": {
      "merchantId": "01234567890123456789",
      // nome é renderizado na folha de pagamento. No ambiente de TEST, ou caso o lojista não seja reconhecido,
      // é exibida na folha de pagamento a mensagem “Pay Unverified Merchant”.
      "merchantName": "Example Merchant Name"
    },
    // TransactionInfo é usado para apresentar um diálogo de autorização de pagamento
    "transactionInfo": {
      // Código alfabético da moeda ISO 4217
      "countryCode": "US",
      // ISO 3166–1 alpha-2 código do país onde a transação é processada.
      "currencyCode": "USD"
    }
  }
});
