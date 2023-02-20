import 'dart:convert';

// configuração padrão para o ApplePay
String defaultConfigApplepay = jsonEncode({
  // pode ser apple_pay ou google_pay
  "provider": "apple_pay",
  // este é o núcleo do PaymentRequest que é um JSON em si
  "data": {
    "merchantIdentifier": "merchant.com.sams.fish",
    "displayName": "Sam's Fish",
    "merchantCapabilities": ["3DS", "debit", "credit"],
    "supportedNetworks": ["amex", "visa", "discover", "masterCard"],
    // Código alfabético da moeda ISO 4217
    "countryCode": "US",
    // ISO 3166–1 alpha-2 código do país onde a transação é processada.
    "currencyCode": "USD",
    "requiredBillingContactFields": [
      "emailAddress",
      "name",
      "phoneNumber",
      "postalAddress"
    ],
    "requiredShippingContactFields": [],
    "shippingMethods": [
      {
        "amount": "0.00",
        "detail": "Available within an hour",
        "identifier": "in_store_pickup",
        "label": "In-Store Pickup"
      },
      {
        "amount": "4.99",
        "detail": "5-8 Business Days",
        "identifier": "flat_rate_shipping_id_2",
        "label": "UPS Ground"
      },
      {
        "amount": "29.99",
        "detail": "1-3 Business Days",
        "identifier": "flat_rate_shipping_id_1",
        "label": "FedEx Priority Mail"
      }
    ]
  }
});
