import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Rocket, Shirt, Mountain, Hammer } from "lucide-react";
import storeImage from "@/assets/zoshua-colah-1a605a2N914-unsplash.jpg";

const Nature = () => {
  const experiences = [
    {
      icon: Rocket,
      title: "Raquetas y Pelotas",
      description:
        "Tanto raquetas como pelotas, nuevas y de segunda mano. Además de servicios de reparación y encordado para raquetas.",
      highlight: "Precios Accesibles",
    },
    {
      icon: Shirt,
      title: "Ropa Deportiva",
      description: "Para un juego impecable se necesita la mejor indumentaria.",
      highlight: "Marcas seleccionadas",
    },
    {
      icon: Mountain,
      title: "Arcilla y Tiza",
      description:
        "Elaborada por nosotros para asegurar la mejor calidad y el menor precio.",
      highlight: "Alta Calidad",
    },
    {
      icon: Hammer,
      title: "Equipos Especializados",
      description:
        "Todo lo necesario para mantención de canchas de tenis como máquinas y herramientas relacionadas.",
      highlight: "Gran variedad",
    },
  ];

  return (
    <section
      id="tienda"
      className="py-24 bg-background relative overflow-hidden"
    >
      {/* Background Pattern */}
      <div className="absolute inset-0 opacity-5">
        <div
          className="absolute inset-0"
          style={{
            backgroundImage: `radial-gradient(circle at 2px 2px, currentColor 1px, transparent 0)`,
            backgroundSize: "40px 40px",
          }}
        />
      </div>

      <div className="container mx-auto px-4 relative z-10">
        <div className="text-center mb-16">
          <h2 className="text-4xl md:text-5xl font-bold text-foreground mb-4">
            Tienda Deportiva
          </h2>
          <p className="text-xl text-muted-foreground max-w-2xl mx-auto">
            Todos los implementos deportivos necesarios de las marcas más
            reconocidas a precios insuperables.
          </p>
        </div>

        {/* Hero Image */}
        <div className="relative mb-16 rounded-3xl overflow-hidden shadow-2xl">
          <img
            src={storeImage}
            alt="Foto de Zoshua Colah en Unsplash"
            className="w-full h-[500px] object-cover"
          />
          <div className="absolute inset-0 bg-gradient-to-t from-background via-background/50 to-transparent" />
          <div className="absolute bottom-0 left-0 right-0 p-8 md:p-12 text-center"></div>
        </div>

        {/* Experiences Grid */}
        <div className="grid md:grid-cols-2 gap-8 mb-12">
          {experiences.map((experience, index) => (
            <Card
              key={index}
              className="hover:shadow-2xl transition-all duration-500 hover:-translate-y-2 border-2 hover:border-accent/50"
            >
              <CardContent className="p-8">
                <div className="flex items-start gap-6">
                  <div className="p-4 rounded-xl bg-accent/20 flex-shrink-0">
                    <experience.icon className="w-10 h-10 text-accent" />
                  </div>
                  <div className="flex-1">
                    <div className="flex justify-between items-start mb-3">
                      <h3 className="text-2xl font-bold text-foreground">
                        {experience.title}
                      </h3>
                      <span className="text-xs font-semibold text-accent bg-accent/10 px-3 py-1 rounded-full whitespace-nowrap">
                        {experience.highlight}
                      </span>
                    </div>
                    <p className="text-muted-foreground leading-relaxed">
                      {experience.description}
                    </p>
                  </div>
                </div>
              </CardContent>
            </Card>
          ))}
        </div>

        {/* CTA Section */}
        <div className="bg-gradient-to-br from-primary to-primary/80 rounded-3xl p-8 md:p-12 text-center shadow-2xl">
          <h3 className="text-3xl md:text-4xl font-bold text-primary-foreground mb-4">
            ¿Listo para Practicar Tenis?
          </h3>
          <p className="text-lg text-primary-foreground/90 mb-8 max-w-2xl mx-auto">
            Asesórate con nosotros para obtener el mejor equipo, ropa y
            accesorios para jugar tenis.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <a href="https://api.whatsapp.com/send?phone=56977449637&text=Hola%20Rancho%20UFO%2C%20me%20gustar%C3%ADa%20hacer%20una%20cotización%20">
              <Button variant="secondary" size="lg" className="shadow-xl">
                Deseo Cotizar Productos de Tenis
              </Button>
            </a>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Nature;
