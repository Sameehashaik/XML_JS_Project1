<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ns="http://www.adventure-works.com">

    <!-- Template for the root element -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Orders Information</title>
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
                    .highlight {
                        color: red;
                    }
                </style>
            </head>
            <body>
                <h2>Orders Information</h2>
                <table border="1">
                    <tr>
                        <th>CustomerID</th>
                        <th>EmployeeID</th>
                        <th>OrderDate</th>
                        <th>RequiredDate</th>
                    </tr>
                    <xsl:apply-templates select="ns:Root/ns:Orders/ns:Order"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <!-- Template for each Order element -->
    <xsl:template match="ns:Order">
        <tr>
            <xsl:choose>
                <xsl:when test="not(ns:ShipInfo/@ShippedDate)">
                    <xsl:attribute name="class">highlight</xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <td><xsl:value-of select="ns:CustomerID"/></td>
            <td><xsl:value-of select="ns:EmployeeID"/></td>
            <td><xsl:value-of select="ns:OrderDate"/></td>
            <td><xsl:value-of select="ns:RequiredDate"/></td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>
