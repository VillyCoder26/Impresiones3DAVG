<html>
<head>
  <link rel="stylesheet" type="text/css" href="estilos/estilos.css"/>
</head>
<body>
  <div align="center">
    <h1>Información Estadística de Impresoras e Impresiones</h1>
    <table border="1">
      <tr>
        <th>Estadística</th>
        <th>Valor</th>
      </tr>
      
      <!-- Consulta para obtener el nombre de la impresora más cara -->
      
      <tr>
        <td>Nombre de la impresora más cara</td>
        <td>{
          let $impresoras := doc("Impresiones3DAVG_xsd.xml")//Impresora
          let $precio_maximo := max($impresoras/Precio)
          return $impresoras[Precio = $precio_maximo]/@nombre/string()
        }</td>
      </tr>
      
      <!-- Consulta para obtener el nombre de la impresora más barata -->
      
      <tr>
        <td>Nombre de la impresora más Barata</td>
        <td>{
          let $impresoras := doc("Impresiones3DAVG_xsd.xml")//Impresora
          let $precio_maximo := min($impresoras/Precio)
          return $impresoras[Precio = $precio_maximo]/@nombre/string()
        }</td>
      </tr>
      
      <!-- Consulta para obtener el precio medio de todas las impresoras -->
      
      <tr>
        <td>Precio medio de todas las impresoras</td>
        <td>{
          let $precios := doc("Impresiones3DAVG_xsd.xml")//Impresora/Precio
          let $precio_medio := avg($precios)
          return concat(format-number($precio_medio, '0.00'), '€')
        }</td>
      </tr>
      
      <!-- Consulta para obtener el número total de impresiones -->
      
      <tr>
        <td>Número total de impresiones</td>
        <td>{
          let $numero_impresiones := count(doc("Impresiones3DAVG_xsd.xml")//Impresion)
          return $numero_impresiones
        }</td>
      </tr>
      
      <!-- Consulta para obtener el precio medio de las impresiones -->
      
      <tr>
        <td>Precio medio de las impresiones</td>
        <td>{
          let $precios_impresiones := doc("Impresiones3DAVG_xsd.xml")//Impresion/Precio
          let $precio_medio_impresiones := avg($precios_impresiones)
          return concat(format-number($precio_medio_impresiones, '0.00'), '€')
        }</td>
      </tr>
      
      <!-- Consulta para obtener los tipos de filamentos mas usados -->
      
      <tr>
        <td>Tipos de filamentos mas usados</td>
        <td>
          <table border="1">
            <tr>
              <th>Tipo de Filamento</th>
              <th>Cantidad de Usos</th>
            </tr>
            {
              for $tipo in distinct-values(doc("Impresiones3DAVG_xsd.xml")//Impresion/Filamento)
              let $cantidad := count(doc("Impresiones3DAVG_xsd.xml")//Impresion[Filamento = $tipo])
              order by $cantidad descending
              return
              <tr>
                <td>{$tipo}</td>
                <td>{$cantidad}</td>
              </tr>
            }
          </table>
        </td>
      </tr>
      
      <!-- Consulta para obtener los tipos de archivo mas usados -->
      
      <tr>
        <td>Tipos de archivo mas usados</td>
        <td>
          <table border="1">
            <tr>
              <th>Tipo de Archivo</th>
              <th>Cantidad de Usos</th>
            </tr>
            {
              for $tipo_archivo in distinct-values(doc("Impresiones3DAVG_xsd.xml")//Impresion/TipoArchivo)
              let $cantidad_usos := count(doc("Impresiones3DAVG_xsd.xml")//Impresion[TipoArchivo = $tipo_archivo])
              order by $cantidad_usos descending
              return
              <tr>
                <td>{$tipo_archivo}</td>
                <td>{$cantidad_usos}</td>
              </tr>
            }
          </table>
        </td>
      </tr>
      
       <!-- Consulta para obtener los programas más usados -->
       
      <tr>
        <td>Programas más usados</td>
        <td>
          <table border="1">
            <tr>
              <th>Programa</th>
              <th>Cantidad de Usos</th>
            </tr>
            {
              for $programa in distinct-values(doc("Impresiones3DAVG_xsd.xml")//Impresion/Programas/Programa)
              let $cantidad_usos := count(doc("Impresiones3DAVG_xsd.xml")//Impresion/Programas/Programa[. = $programa])
              order by $cantidad_usos descending
              return
              <tr>
                <td>{$programa}</td>
                <td>{$cantidad_usos}</td>
              </tr>
            }
          </table>
        </td>
      </tr>
    </table>
  </div>
</body>
</html>
