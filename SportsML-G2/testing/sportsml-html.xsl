<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:sportsml="http://iptc.org/std/SportsML/2008-04-01/">

<xsl:template match="/sportsml:sports-content">
  <html>
  <body>
  <h2>Competition Name: <xsl:value-of select="sportsml:sports-metadata/sportsml:sports-title"/></h2>
    <xsl:for-each select="sportsml:tournament/sportsml:tournament-division">
      <table>
        <tr><td>Age</td><td><xsl:value-of select="sportsml:tournament-division-metadata/@division-name"/></td></tr>
        <tr><td>Gender</td><td><xsl:value-of select="sportsml:tournament-division-metadata/sportsml:sports-content-qualifier/@gender"/></td></tr>
        <tr><td>Weapon</td><td><xsl:value-of select="sportsml:tournament-division-metadata/sportsml:sports-content-codes/sportsml:sports-content-code/@code-name"/></td></tr>
      </table>
      <xsl:for-each select="sportsml:tournament-stage">
        <h3>Stage: <xsl:value-of select="sportsml:tournament-stage-metadata/@stage-name"/></h3>
        <h4>Standings after <xsl:value-of select="sportsml:standing/@content-label"/></h4>
        <table>
          <tr><th>Position</th><th>Fencer</th><th>Nationality</th></tr>
          <xsl:for-each select="sportsml:standing/sportsml:player">
            <tr>
              <td>
                <xsl:value-of select="sportsml:player-stats/sportsml:rank/@value"/>
              </td>
              <td>
                <xsl:value-of select="sportsml:player-metadata/sportsml:name/@full"/>
              </td>
              <td>
                <xsl:value-of select="sportsml:player-metadata/sportsml:home-location/@country"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <h4>Bouts during <xsl:value-of select="sportsml:tournament-stage-metadata/@stage-name"/></h4>
        <table>
          <xsl:for-each select="sportsml:sports-event">
            <tr>
              <td><xsl:value-of select="sportsml:player[1]/sportsml:player-metadata/sportsml:name/@full"/></td>
              <td><xsl:value-of select="sportsml:player[1]/sportsml:player-stats/@score"/></td>
              <td>vs.</td>
              <td><xsl:value-of select="sportsml:player[2]/sportsml:player-stats/@score"/></td>
              <td><xsl:value-of select="sportsml:player[2]/sportsml:player-metadata/sportsml:name/@full"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </xsl:for-each>
    </xsl:for-each>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>