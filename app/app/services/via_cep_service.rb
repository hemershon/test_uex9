class ViaCepService
  include HTTParty
  base_uri 'https://viacep.com.br/ws'

  def self.get_address(cep)
    get("/#{cep}/json/")
  end
end
