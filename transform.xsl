<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes" />

  <xsl:key name="teacher-key" match="teacher" use="." />
  <xsl:key name="keyword-key" match="keyword" use="." />

  <xsl:template match="/">
    <html>
      <head>
        <title>Наши курсы</title>
        <meta charset="UTF-8" />
      </head>
      <body>
        <h1>Наши курсы</h1>

        <h3>Курсы, которые читает Борисов И.О.</h3>
        <ul>
          <xsl:for-each select="key('teacher-key', 'Борисов И.О.')">
            <xsl:variable name="course" select="ancestor::course" />
            <li><xsl:value-of select="$course/title" /></li>
          </xsl:for-each>
        </ul>

        <h3>Курсы, которые используют XML</h3>
        <ul>
          <xsl:for-each select="key('keyword-key', 'XML')">
            <xsl:variable name="course" select="ancestor::course" />
            <li><xsl:value-of select="$course/title" /></li>
          </xsl:for-each>
        </ul>
    
        <h3>Курсы, которые читает Борисов И.О. и используют XSLT</h3>
        <ul>
          <xsl:for-each select="key('teacher-key', 'Борисов И.О.')">
            <xsl:variable name="course" select="ancestor::course" />
            <xsl:if test="$course/keywords/keyword = 'XSLT'">
              <li><xsl:value-of select="$course/title" /></li>
            </xsl:if>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>