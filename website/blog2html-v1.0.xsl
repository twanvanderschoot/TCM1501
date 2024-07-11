<?xml version="1.0" encoding="UTF-8"?>
<!-- Changes
    20150608 TvdS : Aanmaak.
-->
<!-- TO DO  
    
    
    
    
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd" xml:space="default" version="2.0">
    <xsl:output method="html"/>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jun 6, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b>Twan van der Schoot</xd:p>
            <xd:p><xd:b>Affiliation</xd:b>TWAN.COM</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> article </xd:desc>
    </xd:doc>
    <xsl:template match="article">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html lang="en">
            <head>
                <meta charset="utf-8"/>
                <title>
                    <xsl:value-of select="header/title"/>
                </title>
                <link rel="stylesheet" href="css/reset.css"/>
                <link rel="stylesheet" href="css/blog.twan.com.css"/>
                <xsl:if test="@stylesheet">
                    <xsl:element name="link">
                        <xsl:attribute name="rel">stylesheet</xsl:attribute>
                        <xsl:attribute name="href">css/<xsl:value-of select="@stylesheet"/></xsl:attribute>
                    </xsl:element>
                </xsl:if>
            </head>
            <body>
                <div id="page">
                    <div id="header">
                        <a href="http://www.twan.com" title="Back to the home page.">
                            <img src="images/twan.com-header-50x470.png" alt="TWAN.COM logo"/>
                        </a>
                    </div>
                    <div id="floater-top" title="Back to the home page.">HOME</div>
                    <div id="body">
                        <article>
                            <xsl:apply-templates/>
                        </article>
                    </div>
                    <!-- /body -->
                    <div id="footer" title="To the index.">
                        <div id="floater-mask"/>
                        <div id="index">INDEX</div>
                    </div>
                    <div id="floater-bottom" title="To the index."/>
                </div>
            </body>
            <script src="scripts/lib/jquery-1.9.1.min.js"/>
            <script src="scripts/blog.js"/>
            <xsl:if test="//math">
                <script type="text/x-mathjax-config"><![CDATA[
                    MathJax.Hub.Config({
                    jax : ["output/HTML-CSS"], // To prevent centering of equations in align-environment.
                    tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]},
                    TeX: { equationNumbers: { autoNumber: "AMS" } } 
                    });]]>
                </script>
                <script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

            </xsl:if>
            <xsl:if test="//pre[attribute::type='code']">
                <script src="scripts/lib/google-code-prettify/run_prettify.js"/>
            </xsl:if>
        </html>
    </xsl:template>
    
    
    
    
    <xd:doc>
        <xd:desc> section and sections </xd:desc>
    </xd:doc>
    <xsl:template match="sections">
        <sections>
            <xsl:apply-templates select="section"/>
            <hr></hr>
            <xsl:apply-templates select="references"/>
        </sections>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="section">
        <section>
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="hr">
        <hr/>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> header </xd:desc>
    </xd:doc>
    <xsl:template match="header">
        <header>
            <h1>
                <xsl:value-of select="title"/>
            </h1>
            <p class="date">
                <xsl:value-of select="date"/>
            </p>
            <xsl:apply-templates select="author"/>
            <xsl:apply-templates select="affiliation"/>
            <xsl:apply-templates select="abstract"/>
        </header>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="author">
        <xsl:element name="a" xml:space="default">
            <xsl:attribute name="rel">author</xsl:attribute>
            <xsl:attribute name="href">mailto:<xsl:value-of select="attribute::href"
            /></xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="affiliation" xml:space="default">
        <xsl:element name="a">
            <xsl:attribute name="rel">affiliation</xsl:attribute>
            <xsl:attribute name="href">
                <xsl:value-of select="attribute::href"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="abstract">
        <div class="abstract">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="h">
        <h2>
            <!-- <xsl:value-of select="."/> -->
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="p">
        <xsl:element name="p">
            <xsl:if test="@noindent">
                <xsl:attribute name="class">noindent</xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>    
        </xsl:element>
    </xsl:template>
    
    
    
    <xd:doc>
        <xd:desc> miscellanneous inline mark-yp </xd:desc>
    </xd:doc>
    <xsl:template match="emphasis">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="strong">
        <strong>
            <xsl:apply-templates/>
        </strong>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="nobr">
        <xsl:element name="span">
            <xsl:attribute name="class">nobr</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="link">
        <xsl:element name="a" xml:space="default">
            <xsl:attribute name="href">
            <xsl:choose>
                <xsl:when test="@href">
                    <xsl:value-of select="attribute::href"/>
                </xsl:when>
                <xsl:otherwise>#<xsl:value-of select="."/></xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="span">
        <xsl:element name="span">
            <xsl:if test="@class">
                <xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
            </xsl:if>
            <xsl:if test="@style">
                <xsl:attribute name="style"><xsl:value-of select="@style"/></xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>subscript</xd:desc>
    </xd:doc>
    <xsl:template match="sub">
        <xsl:element name="sub">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>superscript</xd:desc>
    </xd:doc>
    <xsl:template match="sup">
        <xsl:element name="sup">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="normal">
        <span class="normal">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- math display --> 
    
    
    <xd:doc>
        <xd:desc> We want 'inline' as the default format for math formula's </xd:desc>
    </xd:doc>
    <xsl:template match="math[not(@display)]"><![CDATA[\(]]><xsl:value-of select="."/><![CDATA[\)]]></xsl:template>
    
    
    <xd:doc>
        <xd:desc> $...$ zet spaties voor en na de gerenderde expressie [CDATA[$]]&gt;&lt;xsl:value-of select="."/&gt;&lt;![CDATA[$]] </xd:desc>
    </xd:doc>
    <xsl:template match="math[(@display='inline')]"><![CDATA[\(]]><xsl:value-of select="."/><![CDATA[/)]]></xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="math[attribute::display='display']">
        <xsl:element name="div">
            <xsl:attribute name="class">mathdisplay</xsl:attribute>
            <p><![CDATA[$$]]><xsl:value-of select="."/><![CDATA[$$]]></p>
            <p class="equation">
                <xsl:value-of select="@equation"/>
            </p>
        </xsl:element>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="math[@display='hidden']"/>
    
    
    <!-- Margin texts -->
    
    
    <xd:doc>
        <xd:desc>    &lt;xsl:template match="margin"&gt;
            &lt;xsl:element name="margin" xml:space="default"&gt;
            &lt;xsl:attribute name="class"&gt;
            &lt;xsl:value-of select="attribute::position"/&gt;
            &lt;/xsl:attribute&gt;
            &lt;xsl:apply-templates/&gt;
            &lt;/xsl:element&gt;
            &lt;/xsl:template&gt;
            
            System ID: /Users/twan/projecten/TWAN.COM/TCM/TCM1501/website/blog2html-v1.0.xsl
            Scenario: blog2html-v1.0
            XML file: /Users/twan/projecten/TWAN.COM/TCM/TCM1501/website/blog-test.xml
            XSL file: /Users/twan/projecten/TWAN.COM/TCM/TCM1501/website/blog2html-v1.0.xsl
            Engine name: Saxon6.5.5
            Severity: warning
            Description: Cannot write an attribute node when no element start tag is open
            Start location: 141:0
            
            Hoe los je dat op?
        </xd:desc>
    </xd:doc>
    <xsl:template match="margin[attribute::position='left']">
        <margin class="left">
            <xsl:apply-templates/>
        </margin>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="margin[attribute::position='right']">
        <margin class="right">
            <xsl:apply-templates/>
        </margin>
    </xsl:template>
    
    
    
    
    <xd:doc>
        <xd:desc> lists: ordered (ol), unordered (ul) and items (li) </xd:desc>
    </xd:doc>
    <xsl:template match="ol">
        <ol>
            <xsl:apply-templates select="li"/>
        </ol>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="ul">
        <ul>
            <xsl:apply-templates select="li"/>
        </ul>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="li">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
    
     
    <xd:doc>
        <xd:desc> code and pre(-formatted) text </xd:desc>
    </xd:doc>
    <xsl:template match="pre[not(ancestor::code)]">
        <pre><xsl:copy-of select="child::node()" xml:space="preserve"/></pre>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="pre[ancestor::code]">
        <xsl:element name="pre">
            <xsl:attribute name="class"> prettyprint <xsl:if test="attribute::language">
                lang-<xsl:value-of select="@language"/>
            </xsl:if>
                <xsl:if test="@linenums">
                    linenums
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="attribute::fromline">
                        linenums=<xsl:value-of select="@fromline"/>
                    </xsl:when>
                    <xsl:otherwise/>
                </xsl:choose>
            </xsl:attribute>
            <xsl:value-of select="text()" xml:space="preserve"/>
        </xsl:element>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="label">
        <p class="codesnippet">
            <xsl:value-of select="text()"/>
        </p>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="code[descendant::pre]">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="code[not(descendant::pre)]">
        <xsl:copy-of select="." xml:space="preserve"/>
    </xsl:template>
    
    
    
    <xd:doc>
        <xd:desc> image </xd:desc>
    </xd:doc>
    <xsl:template match="img">
        <div class="image">
            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="attribute::href"/>
                </xsl:attribute>
                <xsl:if test="@width">
                    <xsl:attribute name="height">
                        <xsl:value-of select="attribute::height"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:if test="@height">
                    <xsl:attribute name="width">
                        <xsl:value-of select="attribute::width"/>
                    </xsl:attribute>
                </xsl:if>
            </xsl:element>
            <xsl:if test="string-length(text())>0">
                <p class="caption">
                    <xsl:value-of select="./text()"/>
                </p>
            </xsl:if>
        </div>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            Create a link to the entry in references with a corresponding citekey.
        </xd:desc>
    </xd:doc>
    <xsl:template match="cite">
        <xsl:element name="a">
            <xsl:attribute name="href">#<xsl:value-of select="."/></xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> blockquote and attribution </xd:desc>
    </xd:doc>
    <xsl:template match="blockquote">
        <blockquote>
            <xsl:apply-templates/>
        </blockquote>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="footer">
        <footer>
            <xsl:value-of select="text()"/>
        </footer>
    </xsl:template>
    
    
    
    
    <xd:doc>
        <xd:desc>  References/Bibliography </xd:desc>
    </xd:doc>
    <xsl:template match="references">
        <xsl:element name="section">
            <xsl:attribute name="class">bibliography</xsl:attribute>
            <xsl:attribute name="id">references</xsl:attribute>
            <h2>Bibliografie</h2>
            <dl>
                <xsl:apply-templates/>
            </dl>
        </xsl:element>
        <hr></hr>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="reference">
        <dt>
            <xsl:element name="a">
                <xsl:attribute name="id"><xsl:value-of select="citekey"/></xsl:attribute>
            <xsl:value-of select="citekey"/>
            </xsl:element>
        </dt>
        <dd>
            <xsl:apply-templates select="./*[not(self::citekey)]"/>
        </dd>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="authors[ancestor::reference]">
        <xsl:element name="authors">
            <xsl:for-each select="author"> 
                <xsl:if test="position()=last() and position()>1"> and </xsl:if>
                <xsl:value-of select="."/>, 
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="title[ancestor::reference]">
 <!--       <cite><xsl:value-of select="."/></cite>-->
        <xsl:element name="cite">
            <xsl:apply-templates select="node() except title"/>
        </xsl:element>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="year[ancestor::reference]">, <xsl:element name="time"><xsl:attribute name="datetime"><xsl:value-of select="."/></xsl:attribute><xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="publication[ancestor::reference]">, <xsl:element name="span">
            <xsl:attribute name="class">publication</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="pages[ancestor::reference]">, <xsl:element name="span">
            <xsl:attribute name="class">pages</xsl:attribute>
            pp. <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template  match="publisher[ancestor::reference]">, <xsl:element name="span">
                    <xsl:attribute name="class">name</xsl:attribute>
                    <xsl:value-of select="name"/>
                </xsl:element>, <xsl:element name="span">
                    <xsl:attribute name="class">location</xsl:attribute>
                    <xsl:value-of select="location"/>
                </xsl:element>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="isbn[ancestor::reference]">, <xsl:element name="span">
                <xsl:attribute name="class">isbn</xsl:attribute>
                <xsl:value-of select="."/>
            </xsl:element>       
    </xsl:template>
    
    
</xsl:stylesheet>
