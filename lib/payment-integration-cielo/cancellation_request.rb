require "nokogiri"
require "uuidtools"

module CieloIe
  class CancellationRequest

    def serialize(tid,affiliation, affiliation_key)
     builder = Nokogiri::XML::Builder.new(:encoding =>"ISO-8859-1") do |xml|
       xml.send("requisicao-cancelamento",
                "versao" => CredCardCielo::CredCardCieloIe::XML_VERSION,
                "id" => UUIDTools::UUID.random_create){

                xml.send("tid", tid)

                xml.send("dados-ec") {
                    xml.send("numero", "#{affiliation}")
                    xml.send("chave",  "#{affiliation_key}")
                 }
               }
     end

       return  builder.to_xml

     end
   end
 end
