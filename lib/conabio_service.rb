#encoding: utf-8
# Call the SOAP service from COANBIO

require 'timeout'
require 'uri'

class ConabioService
  def initialize(options = {})
    @server = options[:server] || 'conabioweb.conabio.gob.mx'
    @service_name = 'CONABIO'
    @wsdl = "http://#{@server}/webservice/conabio_varias_fichas.wsdl"
    @key = 'La completa armonia de una obra imaginativa con frecuencia es la causa que los irreflexivos la supervaloren.'
    @timeout = options[:timeout] || 5
    @debug = options[:debug] || false
    @photos = options[:photos] || false
    @photo_id = options[:photo_id] || false
  end

  #
  #Search for the specific cientific name
  #
  def search(q)
    begin
      client=Savon.client(wsdl: @wsdl)
      begin
            Timeout::timeout(@timeout) do
          @response = client.call(:data_taxon, message: { scientific_name: @photo_id ? q : URI.encode(q.gsub(' ', '_')), key: @key, photos: @photos, photo_id: @photo_id })
        end
      rescue Timeout::Error, Errno::ECONNRESET
        raise Timeout::Error, "Conabio didn't respond within #{@timeout} seconds."
      end
    rescue Savon::SOAPFault => e
      puts e.message
    end
    @response.body[:data_taxon_response][:return].encode('iso-8859-1').force_encoding('UTF-8').gsub(/\n/,'<br>') if
        @response.body[:data_taxon_response][:return].present?
  end

end

