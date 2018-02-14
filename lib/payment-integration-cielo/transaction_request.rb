require "nokogiri"
require "uuidtools"

module Cielo
  class TransactionRequest
    def serialize(transaction)
     builder = Nokogiri::XML::Builder.new(:encoding =>"ISO-8859-1") do |xml|
       xml.send("requisicao-transacao",
                "versao" => PaymentIntegrationCielo::CieloCardPayment::XML_VERSION,
                "id" => UUIDTools::UUID.random_create){

                     xml.send("dados-ec") {
                         xml.send("numero", transaction.merchant.affiliation)
                         xml.send("chave", transaction.merchant.affiliation_key)
                      }

                    xml.send("dados-portador"){
                       if transaction.holder.token != nil
                         xml.send("token", transaction.holder.token)
                       else
                         xml.send("numero",transaction.holder.number)
                         xml.send("validade",transaction.holder.expiration)
                         xml.send("indicador",transaction.holder.indicator)
                         xml.send("codigo-seguranca",transaction.holder.cvv)
                         xml.send("nome-portador",transaction.holder.name)
                       end
                     }

                     xml.send("dados-pedido") {
                     xml.send("numero", transaction.order.number)
                     xml.send("valor", transaction.order.total)
                     xml.send("moeda", transaction.order.currency)
                     xml.send("data-hora", transaction.order.date_time)
                     xml.send("descricao", transaction.order.description)
                     xml.send("idioma", transaction.order.language)
                     xml.send("taxa-embarque", transaction.order.shipping)
                     xml.send("soft-descriptor", transaction.order.soft_descriptor)
                   }

                   xml.send("forma-pagamento") {
                   xml.send("bandeira", transaction.payment_method.issuer)
                   xml.send("produto", transaction.payment_method.product)
                   xml.send("parcelas", transaction.payment_method.installment)
                 }

                 xml.send("url-retorno", transaction.return_url)
                 xml.send("autorizar", transaction.authorize)
                 xml.send("capturar", transaction.do_capture)
                 xml.send("campo-livre", transaction.free_field)

                 if transaction.bin != nil
                   xml.send("bin", transaction.bin)
                 end

                 if transaction.generate_token != nil
                   xml.send("gerar-token", transaction.generate_token)
                 end
             }
       end

       return  builder.to_xml

     end
   end
 end
