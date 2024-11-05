# mejorCDT-prueba

Este aplicativo fue construido con el manejador de estados BLOC/CUBIT igualmente implementado una arquitectura limpia (clean architecture) y todo lo solicitado en el caso.

# Documentos de proceso, analisis y construccion del caso

Word y excel : 

[Excel](https://correouisedu-my.sharepoint.com/:x:/g/personal/jhoann2171995_correo_uis_edu_co/EUdmT_c9W1FHon1VBjvBP14BkTYEvJX_phGe2QcoA4JO5g?e=LfwSmb)

[Word](https://correouisedu-my.sharepoint.com/:w:/g/personal/jhoann2171995_correo_uis_edu_co/EcOJL-joQ95Dl-dLlwHmXzgBHN4VQagXt8xePAtmaKCobA?e=LKYjeH)

video demo de la aplicacion:

[youtube](https://youtu.be/cTbGPM8PhsE)

# Uso del codigo

Para que todo funcione correctamente se debe descargar el [.env](https://res.cloudinary.com/dhopfnum1/raw/upload/v1730826238/wvulqto09mkva9sjhhru.env) ya que por temas de buenas practicas se omite en el .gitignore, solo se descarga el .env se re nombra y se posiciona en la raiz del direcotiro server.

para ejecutar de manera local el aplicativo debe correrse el comando npm run start:dev dentro del directorio server para montar el servidor en local, y en flutter se debe configurar para ejecutar en dispositivos android debe dirijirse al path lib/constants/environments y modificar "YOUR_IP" por su IP local en ios si se desea probar en emulador no se debe configurar algo mas, sin embargo si se quiere probar en un dispositivo fisico al igual que en android debe cambiarse el localHost por su direccion IP.
