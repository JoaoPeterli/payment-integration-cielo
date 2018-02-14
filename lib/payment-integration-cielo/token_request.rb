require "nokogiri"
require "uuidtools"

module Cielo
  class TokenRequest

    def serialize(merchant, holder,affiliation,affiliation_key)
     builder = Nokogiri::XML::Builder.new(:encoding =>"ISO-8859-1") do |xml|
       xml.send("requisicao-token",
                "versao" => CredCardCielo::CredCardCieloIe::XML_VERSION,
                "id" => UUIDTools::UUID.random_create){

                xml.send("dados-ec") {
                  xml.send("numero", "#{affiliation}")
                  xml.send("chave",  "#{affiliation_key}" )
                }

                xml.send("dados-portador") {
                xml.send("numero", holder.number)
                xml.send("validade", holder.expiration)
                xml.send("indicador", holder.indicator)
                xml.send("codigo-seguranca", holder.cvv)
                xml.send("nome-portador", holder.name)
            }
          }
     end

       return  builder.to_xml

     end
   end
 end
