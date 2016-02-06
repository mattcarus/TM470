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
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"/>
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
      
      <ul class="nav nav-tabs" role="tablist">
        <xsl:for-each select="sportsml:tournament-stage">
          <li role="presentation">
          <xsl:if test="position()=1">
            <xsl:attribute name="class">active</xsl:attribute>
          </xsl:if>
            <a role="tab" data-toggle="tab">
              <xsl:attribute name="href">#stage-<xsl:value-of select="sportsml:tournament-stage-metadata/@stage-key"/></xsl:attribute>
              <xsl:attribute name="aria-controls">stage-<xsl:value-of select="sportsml:tournament-stage-metadata/@stage-key"/></xsl:attribute>
              <xsl:value-of select="sportsml:tournament-stage-metadata/@stage-name"/>
            </a>
          </li>
        </xsl:for-each>
      </ul>
      
      <div class="tab-content">
      <xsl:for-each select="sportsml:tournament-stage">
       <div role="tabpanel" class="tab-pane">
        <xsl:if test="position()=1">
          <xsl:attribute name="class">tab-pane active</xsl:attribute>
        </xsl:if>
        <xsl:attribute name="id">stage-<xsl:value-of select="sportsml:tournament-stage-metadata/@stage-key"/></xsl:attribute>
        <h3>Stage: <xsl:value-of select="sportsml:tournament-stage-metadata/@stage-name"/></h3>
        <h4>Standings after <xsl:value-of select="sportsml:standing/@content-label"/></h4>
        <table class="table table-striped">
          <tr><th>Position</th><th>Fencer</th><th>Nationality</th></tr>
          <xsl:for-each select="sportsml:standing/sportsml:team/sportsml:player">
            <xsl:sort select="sportsml:player-stats/sportsml:rank/@value" data-type="number" order="ascending" />
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
              <td><xsl:value-of select="sportsml:team[1]/sportsml:player[1]/sportsml:player-metadata/sportsml:name/@full"/></td>
              <td><xsl:value-of select="sportsml:team[1]/sportsml:team-stats/@score"/></td>
              <td>vs.</td>
              <td><xsl:value-of select="sportsml:team[2]/sportsml:team-stats/@score"/></td>
              <td><xsl:value-of select="sportsml:team[2]/sportsml:player[1]/sportsml:player-metadata/sportsml:name/@full"/></td>
              <td>(Poule: <xsl:value-of select="sportsml:event-metadata/@heat-number"/>)</td>
            </tr>
          </xsl:for-each>
        </table>
       </div>
      </xsl:for-each>
    </div>
    </xsl:for-each>
    </div> <!-- .container -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>