<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>

    <!-- ключи -->
    <xsl:key name="byTeacher" match="course" use="teacher"/>
    <xsl:key name="byTopic" match="course" use="topics/topic"/>

    <xsl:template match="/">
        <html>
            <body>
                <h1>Наши курсы</h1>

                <!-- Курсы Борисова И.О. -->
                <h3>Курсы, которые читает Борисов И.О.</h3>
                <ul>
                    <xsl:for-each select="key('byTeacher', 'Борисов И.О.')">
                        <li><xsl:value-of select="name"/></li>
                    </xsl:for-each>
                </ul>

                <!-- Курсы с темой XML -->
                <h3>Курсы, которые используют XML</h3>
                <ul>
                    <xsl:for-each select="key('byTopic', 'XML')">
                        <li><xsl:value-of select="name"/></li>
                    </xsl:for-each>
                </ul>

                <!-- Курсы Борисова И.О. с темой XSLT -->
                <h3>Курсы Борисова И.О., в которых есть тема XSLT</h3>
                <ul>
                    <xsl:for-each select="key('byTeacher', 'Борисов И.О.')">
                        <xsl:if test="topics/topic='XSLT'">
                            <li><xsl:value-of select="name"/></li>
                        </xsl:if>
                    </xsl:for-each>
                </ul>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>