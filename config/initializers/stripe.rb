Rails.configuration.stripe = {
  :publishable_key => 'pk_test_pneDY2JGHXD2HBEux97vY3Nu',
  :secret_key      => 'sk_test_eHmp0BlJlI2lrv2C0n8gM5Du'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]