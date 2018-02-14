require "nokogiri"
require "uuidtools"


module Cielo
  class CaptureRequest

    def serialize(tid,total=nil,affiliation,affiliation_key)
     builder = Nokogiri::XML::Builder.new(:encoding =>"ISO-8859-1") do |xml|
       xml.send("requisicao-captura",
                "versao" => CredCardCielo::CredCardCieloIe::XML_VERSION,
                "id" => UUIDTools::UUID.random_create){

                xml.send("tid", tid)

                xml.send("dados-ec") {
                    xml.send("numero", "#{affiliation}")
                    xml.send("chave",  "#{affiliation_key}" )
                 }

                 if total !=nil
                   xml.send("valor",total)
                 end
               }
     end

       return  builder.to_xml

     end
   end
 end
