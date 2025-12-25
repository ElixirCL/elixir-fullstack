import { ChevronDown } from "lucide-react";
import { Button } from "@/components/ui/button";
import heroImage from "@/assets/hero-tennis.jpg";

const Hero = () => {
  return (
    <section
      id="inicio"
      className="relative min-h-screen flex items-center justify-center overflow-hidden"
    >
      {/* Background Image with Overlay */}
      <div className="absolute inset-0 z-0">
        <img
          src={heroImage}
          alt="Rancho Tenis & Naturaleza"
          className="w-full h-full object-cover"
        />
        <div className="absolute inset-0 bg-gradient-to-b from-primary/80 via-primary/60 to-background/95" />
      </div>

      {/* Content */}
      <div className="relative z-10 container mx-auto px-4 text-center animate-fade-in">
        <div className="max-w-4xl mx-auto space-y-8">
          <h1 className="text-5xl md:text-7xl font-bold text-primary-foreground leading-tight">
            Donde el Tenis es una experiencia de otro mundo.
          </h1>
          <p className="text-xl md:text-2xl text-primary-foreground/90 max-w-2xl mx-auto">
            Juega tenis rodeado de naturaleza, participa en avistamiento de UFOs
            y otras actividades recreativas y deportivas.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center items-center pt-4">
            <a href="https://api.whatsapp.com/send?phone=56977449637&text=Hola%20Rancho%20UFO%2C%20me%20gustar%C3%ADa%20hacer%20una%20reserva%20">
              <Button variant="hero" size="lg">
                ¡Haz click y reserva tu cancha ya!
              </Button>
            </a>
          </div>
        </div>
      </div>

      {/* Scroll Indicator */}
      <div className="absolute bottom-8 left-1/2 transform -translate-x-1/2 z-10 animate-float">
        <ChevronDown className="w-8 h-8 text-primary-foreground" />
      </div>
    </section>
  );
};

export default Hero;
