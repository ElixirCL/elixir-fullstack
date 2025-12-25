import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { MapPin, Phone, Clock, Instagram } from "lucide-react";
import ranchoImage from "@/assets/ranchoufo.jpg";

const Contact = () => {
  const contactInfo = [
    {
      icon: MapPin,
      title: "Ubicación",
      detail:
        '<a href="https://www.google.com/maps/place/Rancho+Ruta+UFO+Tenis+Club/@-33.0819147,-71.3931549,659m/data=!3m1!1e3!4m6!3m5!1s0x9689d9c35da4e27b:0xc20ae4be0ed77c24!8m2!3d-33.0825334!4d-71.3916808!16s%2Fg%2F11xsnmz3g8?entry=ttu&g_ep=EgoyMDI1MTIwOS4wIKXMDSoASAFQAw%3D%3D">Ruta F-50, A pasos de Tranque Recreo, Quilpué, Chile</a>',
    },
    {
      icon: Phone,
      title: "Teléfono",
      detail: '<a href="tel:56977449637">+56 9 7744 9637</a>',
    },
    {
      icon: Instagram,
      title: "Instagram",
      detail:
        '<a href="https://www.instagram.com/Ranchorutaufotenisclub/">@ranchorutaufotenisclub</a>',
    },
    {
      icon: Clock,
      title: "Horario",
      detail: "Lunes a Domingo: 9:00 AM - 18:00 PM",
    },
  ];

  return (
    <section id="contacto" className="py-24 bg-muted">
      <div className="container mx-auto px-4">
        <div className="text-center mb-16">
          <h2 className="text-4xl md:text-5xl font-bold text-foreground mb-4">
            Contáctanos
          </h2>
          <p className="text-xl text-muted-foreground max-w-2xl mx-auto">
            Estamos aquí para responder tus preguntas y viajar hasta marte.
          </p>
        </div>

        <div className="grid lg:grid-cols-2 gap-12 max-w-6xl mx-auto">
          {/* Contact Form */}
          <Card className="shadow-xl">
            <CardContent className="p-8">
              <img
                src={ranchoImage}
                alt="Rancho Tenis & Naturaleza"
                className="w-full h-full object-cover"
              />

              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">&nbsp;</div>
              </div>

              <div className="space-y-2">
                <a href="https://api.whatsapp.com/send?phone=56977449637&text=Hola%20Rancho%20UFO%2C%20me%20gustar%C3%ADa%20hacer%20una%20reserva%20">
                  <Button variant="hero" size="lg" className="w-full">
                    Enviar Mensaje por Whatsapp
                  </Button>
                </a>
              </div>
            </CardContent>
          </Card>

          {/* Contact Information */}
          <div className="space-y-6">
            {contactInfo.map((info, index) => (
              <Card
                key={index}
                className="hover:shadow-lg transition-all duration-300"
              >
                <CardContent className="p-6 flex items-start gap-4">
                  <div className="p-3 rounded-lg bg-primary/10 flex-shrink-0">
                    <info.icon className="w-6 h-6 text-primary" />
                  </div>
                  <div>
                    <h3 className="font-bold text-foreground mb-1">
                      {info.title}
                    </h3>
                    <p
                      className="text-muted-foreground"
                      dangerouslySetInnerHTML={{ __html: info.detail }}
                    ></p>
                  </div>
                </CardContent>
              </Card>
            ))}

            {/* Map Placeholder */}
            <Card className="overflow-hidden shadow-xl">
              <CardContent className="p-0">
                <div className="h-[300px] bg-gradient-to-br from-primary/20 to-accent/20 flex items-center justify-center">
                  <div className="text-center p-8">
                    <MapPin className="w-16 h-16 text-primary mx-auto mb-4" />
                    <iframe
                      src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1509.8614375984203!2d-71.39102379845166!3d-33.082491868477135!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9689d9c35da4e27b%3A0xc20ae4be0ed77c24!2sRancho%20Ruta%20UFO%20Tenis%20Club!5e1!3m2!1ses!2scl!4v1765849062406!5m2!1ses!2scl"
                      width="550"
                      height="450"
                      loading="lazy"
                    ></iframe>
                  </div>
                </div>
              </CardContent>
            </Card>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Contact;
