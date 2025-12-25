import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import courtImage from "@/assets/tennis-court.jpg";

const Courts = () => {
  const courtTypes = [
    {
      name: "Canchas de Arcilla",
      description:
        "Superficie profesional tipo Roland Garros, ideal para juego técnico y desarrollo de fundamentos.",
      features: [
        "Iluminación LED",
        "Mantenimiento diario",
        "Equipamiento profesional",
      ],
    },
  ];

  return (
    <section id="canchas" className="py-24 bg-background">
      <div className="container mx-auto px-4">
        <div className="text-center mb-16">
          <h2 className="text-4xl md:text-5xl font-bold text-foreground mb-4">
            Fabricamos Nuestras Canchas
          </h2>
          <p className="text-xl text-muted-foreground max-w-2xl mx-auto">
            Instalaciones de clase mundial para una experiencia de juego
            excepcional. Ofrecemos servicio de construcción y mantenimiento de
            canchas de arcilla en todo el territorio nacional.
          </p>
        </div>

        <div className="grid lg:grid-cols-2 gap-12 items-center mb-16">
          <div className="space-y-8">
            {courtTypes.map((court, index) => (
              <Card
                key={index}
                className="hover:shadow-xl transition-all duration-300"
              >
                <CardContent className="p-6">
                  <h3 className="text-2xl font-bold text-foreground mb-3">
                    {court.name}
                  </h3>
                  <p className="text-muted-foreground mb-4">
                    {court.description}
                  </p>
                  <ul className="space-y-2">
                    {court.features.map((feature, idx) => (
                      <li
                        key={idx}
                        className="flex items-center text-sm text-muted-foreground"
                      >
                        <span className="w-2 h-2 bg-secondary rounded-full mr-3" />
                        {feature}
                      </li>
                    ))}
                  </ul>
                </CardContent>
              </Card>
            ))}
          </div>

          <div className="relative">
            <img
              src={courtImage}
              alt="Canchas de tenis profesionales"
              className="rounded-2xl shadow-2xl w-full h-[600px] object-cover"
            />
            <div className="absolute inset-0 bg-gradient-to-t from-background/80 to-transparent rounded-2xl" />
          </div>
        </div>
      </div>
    </section>
  );
};

export default Courts;
