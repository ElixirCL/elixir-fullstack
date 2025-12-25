import { Circle, Trees, Sparkles } from "lucide-react";
import { Card, CardContent } from "@/components/ui/card";

const Services = () => {
  const services = [
    {
      icon: Circle,
      title: "Tenis de Clase Mundial",
      description:
        "Canchas profesionales de arcilla. Clases para todos los niveles con entrenadores de amplia experiencia.",
      color: "text-clay",
    },
    {
      icon: Trees,
      title: "Conexión con la Naturaleza",
      description: "Ubicados a pasos del humedal Tranque Recreo de Quilpué.",
      color: "text-nature",
    },
    {
      icon: Sparkles,
      title: "Experiencias de Otro Mundo",
      description:
        "Noches de avistamiento de ovnis, torneos y eventos especiales.",
      color: "text-sky",
    },
  ];

  return (
    <section className="py-24 bg-muted">
      <div className="container mx-auto px-4">
        <div className="text-center mb-16 animate-slide-up">
          <h2 className="text-4xl md:text-5xl font-bold text-foreground mb-4">
            Una Experiencia Integral
          </h2>
          <p className="text-xl text-muted-foreground max-w-2xl mx-auto">
            Deporte, naturaleza y conexión espiritual en un solo lugar
          </p>
        </div>

        <div className="grid md:grid-cols-3 gap-8">
          {services.map((service, index) => (
            <Card
              key={index}
              className="group hover:shadow-2xl transition-all duration-500 hover:-translate-y-2 border-2 hover:border-primary/50"
            >
              <CardContent className="p-8 text-center space-y-4">
                <div className="flex justify-center">
                  <div className="p-4 rounded-full bg-primary/10 group-hover:bg-primary/20 transition-colors duration-300">
                    <service.icon className={`w-12 h-12 ${service.color}`} />
                  </div>
                </div>
                <h3 className="text-2xl font-bold text-foreground">
                  {service.title}
                </h3>
                <p className="text-muted-foreground leading-relaxed">
                  {service.description}
                </p>
              </CardContent>
            </Card>
          ))}
        </div>
      </div>
    </section>
  );
};

export default Services;
