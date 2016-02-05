<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:sportsml="http://iptc.org/std/SportsML/2008-04-01/">

<xsl:template match="/sportsml:sports-content">
  <html lang="en">
    <head>
      <meta charset="utf-8"/>
      <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"/>
      <title>
        <xsl:value-of select="sportsml:sports-metadata/sportsml:sports-title"/>
      </title>
    </head>
  <body>
  
      <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><xsl:value-of select="sportsml:sports-metadata/sportsml:sports-title"/></a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
        </div><!--/.nav-collapse -->
      </div>
    </nav>
  
    <div class="container" style="margin-top: 70px">
    <xsl:for-each select="sportsml:tournament/sportsml:tournament-division">
      <table class="table">
        <tr><td>Age</td><td><xsl:value-of select="sportsml:tournament-division-metadata/@division-name"/></td></tr>
        <tr><td>Gender</td><td><xsl:value-of select="sportsml:tournament-division-metadata/sportsml:sports-content-qualifier/@gender"/></td></tr>
        <tr><td>Weapon</td><td><xsl:value-of select="sportsml:tournament-division-metadata/sportsml:sports-content-codes/sportsml:sports-content-code/@code-name"/></td></tr>
      </table>
      <xsl:for-each select="sportsml:tournament-stage">
        <h3>Stage: <xsl:value-of select="sportsml:tournament-stage-metadata/@stage-name"/></h3>
        <h4>Standings after <xsl:value-of select="sportsml:standing/@content-label"/></h4>
        <table class="table table-striped">
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
        <table class="table table-striped">
          <xsl:for-each select="sportsml:sports-event">
            <tr>
              <td><xsl:value-of select="sportsml:player[1]/sportsml:player-metadata/sportsml:name/@full"/></td>
              <td><xsl:value-of select="sportsml:player[1]/sportsml:player-stats/@score"/></td>
              <td>vs.</td>
              <td><xsl:value-of select="sportsml:player[2]/sportsml:player-stats/@score"/></td>
              <td><xsl:value-of select="sportsml:player[2]/sportsml:player-metadata/sportsml:name/@full"/></td>
              <td>(Poule: <xsl:value-of select="sportsml:event-metadata/@heat-number"/>)</td>
            </tr>
          </xsl:for-each>
        </table>
        <hr />
      </xsl:for-each>
    </xsl:for-each>
    </div> <!-- .container -->
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>