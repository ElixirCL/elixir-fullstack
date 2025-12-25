import { Facebook, Instagram, Twitter, Youtube } from "lucide-react";

const Footer = () => {
  return (
    <footer className="bg-primary text-primary-foreground py-12">
      <div className="container mx-auto px-4">
        <div className="grid md:grid-cols-4 gap-8 mb-8">
          {/* Brand */}
          <div className="space-y-4">
            <h3 className="text-2xl font-bold">Rancho Ruta UFO Tennis Club</h3>
            <p className="text-primary-foreground/80 text-sm">
              Tenis, Naturaleza y UFOs
            </p>
          </div>

          {/* Quick Links */}
          <div>
            <h4 className="font-bold mb-4">Enlaces Rápidos</h4>
            <ul className="space-y-2 text-sm">
              <li>
                <a
                  href="#inicio"
                  className="text-primary-foreground/80 hover:text-primary-foreground transition-colors"
                >
                  Inicio
                </a>
              </li>
              <li>
                <a
                  href="#canchas"
                  className="text-primary-foreground/80 hover:text-primary-foreground transition-colors"
                >
                  Canchas
                </a>
              </li>
              <li>
                <a
                  href="#clases"
                  className="text-primary-foreground/80 hover:text-primary-foreground transition-colors"
                >
                  Clases
                </a>
              </li>
              <li>
                <a
                  href="#tienda"
                  className="text-primary-foreground/80 hover:text-primary-foreground transition-colors"
                >
                  Tienda
                </a>
              </li>
            </ul>
          </div>

          {/* Services */}
          <div>
            <h4 className="font-bold mb-4">Servicios</h4>
            <ul className="space-y-2 text-sm">
              <li className="text-primary-foreground/80">
                Clases de Tenis y Entrenamiento Funcional
              </li>
              <li className="text-primary-foreground/80">
                Arriendo de Canchas y Espacios para Eventos
              </li>
              <li className="text-primary-foreground/80">
                Construcción de Canchas
              </li>
              <li className="text-primary-foreground/80">
                Venta de Arcilla e Implementos Deportivos
              </li>
            </ul>
          </div>

          {/* Social Media */}
          <div>
            <h4 className="font-bold mb-4">Síguenos</h4>
            <div className="flex gap-4">
              <a
                href="https://www.instagram.com/Ranchorutaufotenisclub/"
                className="p-2 rounded-full bg-primary-foreground/10 hover:bg-primary-foreground/20 transition-colors"
                aria-label="Instagram"
              >
                <Instagram className="w-5 h-5" />
              </a>
            </div>
          </div>
        </div>

        {/* Copyright */}
        <div className="border-t border-primary-foreground/20 pt-8 text-center text-sm text-primary-foreground/80">
          <p>
            &copy; {new Date().getFullYear()} Rancho Ruta UFO Tennis Club. Todos
            los derechos e izquierdos reservados.
          </p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
