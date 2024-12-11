use SOAP::Lite;  # Importar SOAP::Lite para trabajar con SOAP

# Crear un objeto cliente y configurar la URL del servicio
my $soap = SOAP::Lite
    ->uri('http://localhost:8000/ServicioSoap/Service1')  # URI del servicio SOAP
    ->proxy('http://localhost:8000/');  # URL del servicio SOAP

# Llamar al método Saludar del servicio SOAP
my $response = $soap->Saludar(SOAP::Data->name('nombre' => 'Juan'));

# Imprimir la respuesta
if ($response->fault) {
    print "Error: " . $response->faultstring . "\n";
} else {
    print "Respuesta del servicio: " . $response->result . "\n";
}
