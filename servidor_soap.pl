use SOAP::Lite;
use SOAP::Transport::HTTP;  # Para crear un servidor HTTP

# Definir el servicio SOAP
my $service = SOAP::Lite
    ->on_fault(sub {
        my ($soap, $res) = @_;
        print "Error: " . $res->{faultstring} . "\n";
        return $res;
    })
    ->uri('http://localhost:8000/ServicioSoap/Service1')
    ->proxy('http://localhost:8000/ServicioSoap/Service1');

# Crear un servicio de transporte HTTP
SOAP::Transport::HTTP::CGI
    ->dispatch_to('Service1')  # Nombre del servicio
    ->handle;

package Service1;

# Definir el método Saludar
sub Saludar {
    my ($self, $nombre) = @_;
    return "¡Hola, $nombre!";
}
