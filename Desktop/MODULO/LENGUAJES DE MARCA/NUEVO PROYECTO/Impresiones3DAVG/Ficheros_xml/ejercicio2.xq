<html>
<head>
  <link rel="stylesheet" type="text/css" href="estilos/estilos.css"/>
</head>
<body>
  <div align="center">
    <h1>Obtener los datos de todas las impresoras, mostrar el primer programa utilizado por cada una y dividirlas en tablas según su tipo ordenandolas por precio de mayor a menor.</h1>
    <h2>Impresoras FDM</h2>
    <table border="1">
      <tr>
        <th>Impresora</th>
        <th>Modelo</th>
        <th>Precio</th>
        <th>Programa</th>
      </tr>
      {
        for $impresora in doc("Impresiones3DAVG_xsd.xml")//Marca/Impresora[Tipo = 'FDM']
        order by xs:decimal($impresora/Precio) descending
        return
        <tr>
          <td>{data($impresora/@nombre)}</td>
          <td>{data($impresora/Modelo)}</td>
          <td>{data($impresora/Precio)}€</td>
          <td>{
            let $programa := doc("Impresiones3DAVG_xsd.xml")//Impresion[Impresora = $impresora/@nombre][1]/Programas/Programa
            return if (exists($programa)) then data($programa) else "No ha sido utilizada"
          }</td>
        </tr>
      }
    </table>
    <h2>Impresoras SLA</h2>
    <table border="1">
      <tr>
        <th>Impresora</th>
        <th>Modelo</th>
        <th>Precio</th>
        <th>Programa</th>
      </tr>
      {
        for $impresora in doc("Impresiones3DAVG_xsd.xml")//Marca/Impresora[Tipo = 'SLA']
        order by xs:decimal($impresora/Precio) descending
        return
        <tr>
          <td>{data($impresora/@nombre)}</td>
          <td>{data($impresora/Modelo)}</td>
          <td>{data($impresora/Precio)}€</td>
          <td>{
            let $programa := doc("Impresiones3DAVG_xsd.xml")//Impresion[Impresora = $impresora/@nombre][1]/Programas/Programa
            return if (exists($programa)) then data($programa) else "No ha sido utilizada"
          }</td>
        </tr>
      }
    </table>
  </div>
</body>
</html>