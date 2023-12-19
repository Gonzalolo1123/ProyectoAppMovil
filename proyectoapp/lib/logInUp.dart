import 'package:flutter/material.dart';
import 'index.dart';
class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(width: 10.0),
                const Text(
                  'JudgeSync',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Iniciar Sesión',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(height: 40.0),
            SizedBox(
              width: 300, // Ajusta el ancho según tus necesidades
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: 300, // Ajusta el ancho según tus necesidades
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 70.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Index()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 50),
                padding: const EdgeInsets.all(15.0),
              ),
              child: const Text('Iniciar Sesión'),
            ),
            const SizedBox(height: 10.0),
            const Text(
              '¿Aun no tienes cuenta?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogUp()),
                );
              },
              child: const Text(
                'Crear Cuenta',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogUp extends StatelessWidget {
  const LogUp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(width: 10.0),
                const Text(
                  'JudgeSync',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Crear Cuenta',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: 300, // Ajusta el ancho según tus necesidades
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: 300, // Ajusta el ancho según tus necesidades
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Correo',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: 300, // Ajusta el ancho según tus necesidades
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: 300, // Ajusta el ancho según tus necesidades
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Repetir Contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Index()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 50),
                padding: const EdgeInsets.all(15.0),
              ),
              child: const Text('Crear Cuenta'),
            ),
            const SizedBox(height: 10.0),
            const Text(
              '¿Ya tienes Cuenta?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogIn()),
                );
              },
              child: const Text(
                'Iniciar Sesión',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}