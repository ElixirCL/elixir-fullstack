import Navbar from "./components/Navbar";
import Hero from "./components/Hero";
import Services from "./components/Services";
import Courts from "./components/Courts";
import Classes from "./components/Classes";
import Store from "./components/Store";
import Contact from "./components/Contact";
import Footer from "./components/Footer";

const Home = () => {
  return (
    <div className="min-h-screen">
      <Navbar />
      <Hero />
      <Services />
      <Courts />
      <Classes />
      <Store />
      <Contact />
      <Footer />
    </div>
  );
};

export default Home;
