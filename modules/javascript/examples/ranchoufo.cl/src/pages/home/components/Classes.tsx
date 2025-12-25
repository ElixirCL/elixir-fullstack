import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Users, Target, Trophy, Heart } from "lucide-react";
import classesImage from "@/assets/tennis-classes.jpg";

const Classes = () => {
  const programs = [
    {
      icon: Heart,
      title: "Principiantes",
      description:
        "Aprende desde cero con técnicas fundamentales y un enfoque amigable.",
      duration: "8 sesiones",
    },
    {
      icon: Target,
      title: "Intermedios",
      description:
        "Perfecciona tu técnica y desarrolla estrategias de juego avanzadas.",
      duration: "12 sesiones",
    },
    {
      icon: Trophy,
      title: "Avanzados",
      description:
        "Entrenamiento intensivo para competición y perfeccionamiento técnico.",
      duration: "16 sesiones",
    },
    {
      icon: Users,
      title: "Programas para Niños",
      description:
        "Desarrollo deportivo y valores a través del tenis en ambiente seguro.",
      duration: "Flexible",
    },
  ];

  return (
    <section id="clases" className="py-24 bg-muted">
      <div className="container mx-auto px-4">
        <div className="text-center mb-16">
          <h2 className="text-4xl md:text-5xl font-bold text-foreground mb-4">
            Clases y Entrenamiento
          </h2>
          <p className="text-xl text-muted-foreground max-w-2xl mx-auto">
            Programas personalizados con entrenadores para todos los niveles
          </p>
        </div>

        <div className="grid lg:grid-cols-2 gap-12 items-center mb-16">
          <div className="relative order-2 lg:order-1">
            <img
              src={classesImage}
              alt="Clases de tenis profesionales"
              className="rounded-2xl shadow-2xl w-full h-[500px] object-cover"
            />
            <div className="absolute inset-0 bg-gradient-to-t from-background/80 to-transparent rounded-2xl" />
          </div>

          <div className="space-y-6 order-1 lg:order-2">
            {programs.map((program, index) => (
              <Card
                key={index}
                className="hover:shadow-xl transition-all duration-300 hover:scale-105"
              >
                <CardContent className="p-6 flex items-start gap-4">
                  <div className="p-3 rounded-lg bg-secondary/20">
                    <program.icon className="w-8 h-8 text-secondary" />
                  </div>
                  <div className="flex-1">
                    <div className="flex justify-between items-start mb-2">
                      <h3 className="text-xl font-bold text-foreground">
                        {program.title}
                      </h3>
                      <span className="text-sm font-medium text-muted-foreground bg-muted px-3 py-1 rounded-full">
                        {program.duration}
                      </span>
                    </div>
                    <p className="text-muted-foreground">
                      {program.description}
                    </p>
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>

        <div className="bg-card rounded-2xl p-8 md:p-12 shadow-xl">
          <div className="grid md:grid-cols-2 gap-8 items-center">
            <div>
              <h3 className="text-3xl font-bold text-foreground mb-4">
                Entrenadores de Amplia Experiencia
              </h3>
              <p className="text-muted-foreground mb-6 leading-relaxed">
                Nuestro equipo cuenta con años de experiencia en la enseñanza
                del tenis. Utilizamos metodologías modernas y personalizadas
                para garantizar tu progreso.
              </p>
              <ul className="space-y-3 mb-6">
                <li className="flex items-center text-muted-foreground">
                  <span className="w-2 h-2 bg-primary rounded-full mr-3" />
                  Experiencia en competición
                </li>
                <li className="flex items-center text-muted-foreground">
                  <span className="w-2 h-2 bg-primary rounded-full mr-3" />
                  Enfoque personalizado
                </li>
              </ul>
            </div>
            <div className="flex justify-center">
              <a href="https://api.whatsapp.com/send?phone=56977449637&text=Hola%20Rancho%20UFO%2C%20me%20gustar%C3%ADa%20hacer%20una%20reserva%20">
                <Button variant="hero" size="lg">
                  Agendar Clase de Prueba
                </Button>
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Classes;
