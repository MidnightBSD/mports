<head>
<meta name="robots" content="nofollow" />
<meta name="generator" content="FreeBSD-CVSweb 3.0.6" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<title>CVS log for ports/net-p2p/libtorrent/files/patch-src_data_memory__chunk.cc</title>
<meta http-equiv='content-type' content='text/html; charset=iso-8859-1' >
<meta name='robots' content='nofollow' >
    <link rel="stylesheet" media="screen"
    href="http://www.FreeBSD.org/layout/css/fixed.css" type="text/css"
    title="Normal Text" >
    <link rel="alternate stylesheet" media="screen"
    href="http://www.FreeBSD.org/layout/css/fixed_large.css" type="text/css"
    title="Large Text" >
    <link rel="shortcut icon" href="../../favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="../../favicon.ico" type="image/x-icon" />

<script type="text/javascript" src="http://www.FreeBSD.org/layout/js/styleswitcher.js">
</script>

<link rel="search" type="application/opensearchdescription+xml" href="http://www.freebsd.org/search/opensearch/cvsweb.xml" title="FreeBSD cvsweb" />

</head>
<body>

    <div id="containerwrap">
      <div id="container">
        <span class="txtoffscreen"><a href="#content"
        title="Skip site navigation" accesskey="1">Skip site
        navigation</a> (1)</span><span class="txtoffscreen"><a
        href="#content" title="Skip section navigation"
        accesskey="2">Skip section navigation</a> (2)</span>

        <div id="headercontainer">
          <div id="header">
            <h2 class="blockhide">Header And Logo</h2>

            <div id="headerlogoleft">
              <a href="http://www.FreeBSD.org" title="FreeBSD"><img
              src="http://www.FreeBSD.org/layout/images/logo-red.png" width="457"
              height="75" alt="FreeBSD" /></a>
            </div>

            <div id="headerlogoright">
              <h2 class="blockhide">Peripheral Links</h2>

              <div id="searchnav">
                <ul id="searchnavlist">
                  <li>Text Size: <a href="#"
                  onkeypress="return false;"
                  onclick="setActiveStyleSheet('Normal Text'); return false;"
                   title="Normal Text Size">Normal</a> / <a
                  href="#" onkeypress="return false;"
                  onclick="setActiveStyleSheet('Large Text'); return false;"
                   title="Large Text Size">Large</a></li>

                  <li><a href="http://www.FreeBSD.org/donations/"
                  title="Donate">Donate</a></li>

                  <li class="last-child"><a href="http://www.FreeBSD.org/mailto.html"
                  title="Contact">Contact</a></li>
                </ul>
              </div>

              <div id="search">
                <form
                action="http://www.FreeBSD.org/cgi/search.cgi"
                method="get">
                  <div>
                    <h2 class="blockhide"><label
                    for="words">Search</label></h2>
                    <input type="hidden" name="max"
                    value="25" /><input type="hidden" name="source"
                    value="www" /><input id="words" name="words"
                    type="text" size="20" maxlength="255"
                    onfocus="if( this.value==this.defaultValue ) this.value='';"
                     value="Search" />&nbsp;<input id="submit"
                    name="submit" type="submit" value="Search" />
                  </div>
                </form>
              </div>
            </div>
          </div>

          <h2 class="blockhide">Site Navigation</h2>

	  <div id="MENU">
	    <ul class="first">
	      <li><a href="http://www.FreeBSD.org/">Home</a></li>
	    </ul>
	    <ul>
	      <li><a href="http://www.FreeBSD.org/about.html">About</a>
		<ul>
		  <li><a href="http://www.FreeBSD.org/projects/newbies.html">Introduction</a></li>
		  <li><a href="http://www.FreeBSD.org/features.html">Features</a></li>
		  <li><a href="http://www.FreeBSD.org/advocacy/">Advocacy</a></li>
		  <li><a href="http://www.FreeBSD.org/marketing/">Marketing</a></li>
		</ul>
	      </li>
	    </ul>
	    <ul>
	      <li><a href="http://www.FreeBSD.org/where.html">Get FreeBSD</a>
		<ul>
		  <li><a href="http://www.FreeBSD.org/releases/">Release Information</a></li>
		  <li><a href="http://www.FreeBSD.org/releng/">Release Engineering</a></li>
		</ul>
	      </li>
	    </ul>
	    <ul>
	      <li><a href="http://www.FreeBSD.org/docs.html">Documentation</a>
		<ul>
		  <li><a href="http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/faq/">FAQ</a></li>
		  <li><a href="http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/">Handbook</a></li>
		  <li><a href="http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/porters-handbook">Porter's Handbook</a></li>
		  <li><a href="http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/developers-handbook">Developer's Handbook</a></li>
		  <li><a href="http://www.FreeBSD.org/cgi/man.cgi">Manual Pages</a></li>
		</ul>
	      </li>
	    </ul>
	    <ul>
	      <li><a href="http://www.FreeBSD.org/community.html">Community</a>
		<ul>
		  <li><a href="http://www.FreeBSD.org/community/mailinglists.html">Mailing Lists</a></li>
		  <li><a href="http://forums.freebsd.org">Forums</a></li>
		  <li><a href="http://www.FreeBSD.org/usergroups.html">User Groups</a></li>
		  <li><a href="http://www.FreeBSD.org/events/events.html">Events</a></li>
		</ul>
	      </li>
	    </ul>
	    <ul>
	      <li><a href="http://www.FreeBSD.org/projects/index.html">Developers</a>
		<ul>
		  <li><a href="http://www.FreeBSD.org/projects/ideas/ideas.html">Project Ideas</a></li>
		  <li><a href="http://svn.FreeBSD.org/viewvc/base/">SVN Repository</a></li>
		  <li><a href="http://cvsweb.FreeBSD.org">CVS Repository</a></li>
		  <li><a href="http://p4web.FreeBSD.org">Perforce Repository</a></li>
		</ul>
	      </li>
	    </ul>
	    <ul>
	      <li><a href="http://www.FreeBSD.org/support.html">Support</a>
		<ul>
		  <li><a href="http://www.FreeBSD.org/commercial/commercial.html">Vendors</a></li>
		  <li><a href="http://security.FreeBSD.org/">Security Information</a></li>
		  <li><a href="http://www.FreeBSD.org/cgi/query-pr-summary.cgi">Bug Reports</a></li>
		  <li><a href="http://www.FreeBSD.org/send-pr.html">Submit Bug-report</a></li>
		</ul>
	      </li>
	    </ul>
	    <ul>
	      <li><a href="http://www.freebsdfoundation.org/">Foundation</a>
		<ul>
		  <li><a href="http://www.freebsdfoundation.org/donate/">Donate</a></li>
		</ul>
	      </li>
	    </ul>
	  </div> <!-- MENU -->
        </div>

	<div id="content">

<h1>CVS log for ports/net-p2p/libtorrent/files/patch-src_data_memory__chunk.cc</h1>
<link rel="stylesheet" type="text/css" href="/layout/css/cvsweb.css" />
<p>
 <a href="./#patch-src_data_memory__chunk.cc"><img src="/gifs/back.gif" alt="[BACK]" border="0" width="20" height="22" /></a> <b>Up to  <a href="/cgi/cvsweb.cgi/#dirlist">[FreeBSD]</a> / <a href="/cgi/cvsweb.cgi/ports/#dirlist">ports</a> / <a href="/cgi/cvsweb.cgi/ports/net-p2p/#dirlist">net-p2p</a> / <a href="/cgi/cvsweb.cgi/ports/net-p2p/libtorrent/#dirlist">libtorrent</a> / <a href="/cgi/cvsweb.cgi/ports/net-p2p/libtorrent/files/#dirlist">files</a></b>
</p>
<p>
 <a href="#diff">Request diff between arbitrary revisions</a>
</p>
<hr />
<p>
Keyword substitution: kv<br />
Default branch: MAIN<br />
</p>
<hr />
<a name="rev1.1"></a><a name="RELEASE_7_3_0"></a><a name="HEAD"></a><a name="MAIN"></a>
 Revision <b>1.1</b>: <a href="/cgi/cvsweb.cgi/~checkout~/ports/net-p2p/libtorrent/files/patch-src_data_memory__chunk.cc?rev=1.1;content-type=text%2Fplain" class="download-link">download</a> - view: <a href="patch-src_data_memory__chunk.cc?rev=1.1;content-type=text%2Fplain" class="display-link">text</a>, <a href="patch-src_data_memory__chunk.cc?rev=1.1;content-type=text%2Fx-cvsweb-markup" class="display-link">markup</a>, <a href="patch-src_data_memory__chunk.cc?annotate=1.1">annotated</a> - <a href="patch-src_data_memory__chunk.cc?r1=1.1#rev1.1">select&nbsp;for&nbsp;diffs</a><br />
<i>Mon Feb 22 18:36:25 2010 UTC</i> (4 weeks, 3 days ago) by <i>flz</i><br />
Branches: <a href="./patch-src_data_memory__chunk.cc?only_with_tag=MAIN">MAIN</a><br />
CVS tags: <a href="./patch-src_data_memory__chunk.cc?only_with_tag=RELEASE_7_3_0">RELEASE_7_3_0</a>,
<a href="./patch-src_data_memory__chunk.cc?only_with_tag=HEAD">HEAD</a><br />
<pre class="log">
Add local patch to release memory more efficiently.

Submitted by:	Thomas Burgess
Feature safe:	yes
</pre>
<hr />
<form method="get" action="/cgi/cvsweb.cgi/ports/net-p2p/libtorrent/files/patch-src_data_memory__chunk.cc.diff" id="diff_select">
<fieldset>
<legend>Diff request</legend>
<p>
 <a name="diff">
  This form allows you to request diffs between any two revisions of a file.
  You may select a symbolic revision name using the selection box or you may
  type in a numeric name using the type-in text box.
 </a>
</p>
<table summary="Diff between arbitrary revisions">
<tr>
<td class="opt-label">
<label for="r1" accesskey="1">Diffs between</label>
</td>
<td class="opt-value">
<select id="r1" name="r1">
<option value="text" selected="selected">Use Text Field</option>
<option value="1.1:RELEASE_7_3_0">RELEASE_7_3_0</option>
<option value="1:MAIN">MAIN</option>
<option value="1.1:HEAD">HEAD</option>
</select>
<input type="text" size="12" name="tr1" value="1.1" onchange="this.form.r1.selectedIndex=0" />
</td>
<td></td>
</tr>
<tr>
<td class="opt-label">
<label for="r2" accesskey="2">and</label>
</td>
<td class="opt-value">
<select id="r2" name="r2">
<option value="text" selected="selected">Use Text Field</option>
<option value="1.1:RELEASE_7_3_0">RELEASE_7_3_0</option>
<option value="1:MAIN">MAIN</option>
<option value="1.1:HEAD">HEAD</option>
</select>
<input type="text" size="12" name="tr2" value="1.1" onchange="this.form.r2.selectedIndex=0" />
</td>
<td><input type="submit" value="Get Diffs" accesskey="G" /></td>
</tr>
</table>
</fieldset>
</form>
<form method="get" action="/cgi/cvsweb.cgi/ports/net-p2p/libtorrent/files/patch-src_data_memory__chunk.cc">
<fieldset>
<legend>Log view options</legend>
<table summary="Log view options">
<tr>
<td class="opt-label">
<label for="f" accesskey="D">Preferred diff type:</label>
</td>
<td class="opt-value">
<select id="f" name="f" onchange="this.form.submit()">
<option value="h">Colored</option>
<option value="H">Long colored</option>
<option value="u" selected="selected">Unified</option>
<option value="c">Context</option>
<option value="s">Side by side</option>
</select></td>
<td></td>
</tr>
<tr>
<td class="opt-label">
<label for="only_with_tag" accesskey="B">View only branch:</label>
</td>
<td class="opt-value">
<a name="branch">
<select id="only_with_tag" name="only_with_tag" onchange="this.form.submit()">
<option value="" selected="selected">Show all branches</option>
<option>MAIN</option></select>
</a>
</td>
<td></td>
</tr>
<tr>
<td class="opt-label">
<label for="logsort" accesskey="L">Sort log by:</label>
</td>
<td>
<select id="logsort" name="logsort" onchange="this.form.submit()">
<option value="cvs">Not sorted</option>
<option value="date" selected="selected">Commit date</option>
<option value="rev">Revision</option>
</select></td>
<td><input type="submit" value="Set" accesskey="S" /></td>
</tr>
</table>
</fieldset>
</form>

	</div>
        <div id="footer">
          <a href="http://www.FreeBSD.org/copyright/">Legal Notices</a> | &copy; 1995-2010
          The FreeBSD Project. All rights reserved.<br />
	  <address><a href='http://www.FreeBSD.org/mailto.html'>www@FreeBSD.org</a><br />2008/09/23 16:31:45</address>
        </div>
      </div>
    </div>
  </body>
</html>
