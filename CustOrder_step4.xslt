<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns="http://www.adventure-works.com">
  <xsl:template match="/">
    <html>
      <head>
        <style>
          table {
            font-family: Arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
          }
          th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
          }
          th {
            background-color: #f2f2f2;
          }
        </style>
      </head>
      <body>
        <h2>Customer's Data</h2>
        <table>
          <tr>
            <th>Company Name</th>
            <th>Contact Name</th>
            <th>Contact Title</th>
            <th>Phone</th>
            <th>Fax</th>
            <th>Full Address</th>
          </tr>
          <xsl:for-each select="ns:Root/ns:Customers/ns:Customer">
            <tr>
              <td><xsl:value-of select="ns:CompanyName"/></td>
              <td><xsl:value-of select="ns:ContactName"/></td>
              <td><xsl:value-of select="ns:ContactTitle"/></td>
              <td><xsl:value-of select="ns:Phone"/></td>
              <td>
                <xsl:choose>
                  <xsl:when test="ns:Fax">
                    <xsl:value-of select="ns:Fax"/>
                  </xsl:when>
                  <xsl:otherwise>
                    No Fax Number
                  </xsl:otherwise>
                </xsl:choose>
              </td>
              <td>
                <xsl:value-of select="ns:FullAddress/ns:Address"/>,
                <xsl:value-of select="ns:FullAddress/ns:City"/>,
                <xsl:value-of select="ns:FullAddress/ns:Region"/>,
                <xsl:value-of select="ns:FullAddress/ns:PostalCode"/>,
                <xsl:value-of select="ns:FullAddress/ns:Country"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
