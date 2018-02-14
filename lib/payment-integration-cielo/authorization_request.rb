require "nokogiri"
require "uuidtools"

module Cielo
  class AuthorizationRequest
   def serialize(tid,affiliation, affiliation_key)
     builder = Nokogiri::XML::Builder.new(:encoding =>"ISO-8859-1") do |xml|
       xml.send("requisicao-autorizacao-tid",
                "versao" => CredCardCielo::CredCardCielo::XML_VERSION,
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
