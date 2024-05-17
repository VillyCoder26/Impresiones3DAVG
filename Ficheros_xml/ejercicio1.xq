<html>
<head>
  <link rel="stylesheet" type="text/css" href="estilos/estilos.css"/>
</head>
<body>
  <div align="center">
    <h1>Obtener los datos de todas las impresoras que tenemos y hacer un recuento de impresiones realizadas por cada una de ellas.</h1>
    <table border="1">
      <tr>
        <th>Impresora</th>
        <th>Modelo</th>
        <th>Tipo</th>
        <th>Precio</th>
        <th>Impresiones</th>
        
        
      </tr>
      {
        for $impresora in doc("Impresiones3DAVG_xsd.xml")//Marca/Impresora
        return
        <tr>
          <td>{data($impresora/@nombre)}</td>
          <td>{data($impresora/Modelo)}</td>
          <td>{data($impresora/Tipo)}</td>
          <td>{data($impresora/Precio)}€</td>
          <td>
            <ul>
              <li>{count(doc("Impresiones3DAVG_xsd.xml")//Impresion[Impresora = $impresora/@nombre])}</li>
            </ul>
          </td>
        </tr>
      }
    </table> 
  </div>
</body>
</html>
