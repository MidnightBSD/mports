# $MidnightBSD$

PORTNAME=	rrdtool
PORTVERSION=	1.5.5
PORTREVISION=	0
CATEGORIES=	databases graphics
MASTER_SITES=	http://oss.oetiker.ch/rrdtool/pub/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Round Robin Database Tools

LICENSE=	gpl2

CONFLICTS=	rrdtool10-* rrdtool12-*

USE_RC_SUBR=	rrdcached
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USES=		gmake libtool pathfix pkgconfig
USE_GNOME=	glib20 libxml2
INSTALL_TARGET=	install-strip

CONFIGURE_ARGS=	--disable-tcl --program-prefix="" --disable-silent-rules

PORTEXAMPLES=	4charts.pl bigtops.pl cgi-demo.cgi minmax.pl perftest.pl \
		piped-demo.pl shared-demo.pl stripes.pl

OPTIONS_DEFINE=	DEJAVU GRAPH MMAP NLS PERL_MODULE PYTHON_MODULE \
		RUBY_MODULE EXAMPLES DOCS
OPTIONS_DEFAULT=	GRAPH MMAP PERL_MODULE
GRAPH_DESC=		Enable the rrdtool graph command (needs cairo)
DEJAVU_DESC=		Use DejaVu fonts (requires X11)
MMAP_DESC=		Use mmap in rrd_update
PERL_MODULE_DESC=	Build PERL module
PYTHON_MODULE_DESC=	Build PYTHON bindings
RUBY_MODULE_DESC=	Build RUBY bindings

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MPYTHON_MODULE}
USE_PYTHON=	yes
INSTALLS_EGGINFO=yes
PYDISTUTILS_EGGINFO=py_rrdtool-0.2.2-${PYTHON_VERSION:S/thon//}.egg-info
EXTENSIONS+=	python
PLIST_SUB+=	PYTHON=""
CONFIGURE_ARGS+=	--enable-python
.else
CONFIGURE_ARGS+=	--disable-python
PLIST_SUB+=	PYTHON="@comment "
.endif

.if ${PORT_OPTIONS:MRUBY_MODULE}
USE_RUBY=	yes
EXTENSIONS+=	ruby
PLIST_SUB+=	RUBY=""
CONFIGURE_ARGS+=	--enable-ruby
.else
CONFIGURE_ARGS+=	--disable-ruby
PLIST_SUB+=	RUBY="@comment "
.endif

.if ${PORT_OPTIONS:MPERL_MODULE}
USES+=		perl5
USE_PERL5+=	build run fixpacklist
CONFIGURE_ARGS+=	--enable-perl --enable-perl-site-install
PLIST_SUB+=	PERL=""
.else
CONFIGURE_ARGS+=	--disable-perl
PLIST_SUB+=	PERL="@comment "
.endif

.if ! ${PORT_OPTIONS:MMMAP}
CONFIGURE_ARGS+=	--disable-mmap
.endif

.if ${PORT_OPTIONS:MGRAPH}
LIB_DEPENDS+=	libfreetype.so:${PORTSDIR}/print/freetype2 \
		libpng.so:${PORTSDIR}/graphics/png
USE_GNOME+=	cairo pango
PLIST_SUB+=	GRAPH=""
.else
CONFIGURE_ARGS+=--disable-rrdcgi --disable-rrd_graph
PLIST_SUB+=	GRAPH="@comment "
.endif

.if ${PORT_OPTIONS:MNLS}
USES+=	gettext
USE_GNOME+=	intltool
.else
CONFIGURE_ARGS+=--disable-nls
.endif

.if exists(${LOCALBASE}/lib/X11/fonts/dejavu) || ${PORT_OPTIONS:MDEJAVU}
RUN_DEPENDS+=	${LOCALBASE}/lib/X11/fonts/dejavu:${PORTSDIR}/x11-fonts/dejavu
.endif

CPPFLAGS+=	-I${LOCALBASE}/include -I${LOCALBASE}/include/freetype2

post-extract:
.if ! ${PORT_OPTIONS:MDOCS}
	@${REINPLACE_CMD} -e '/^SUBDIRS = /s| doc | |' \
		${WRKSRC}/Makefile.in
.endif
.if ! ${PORT_OPTIONS:MEXAMPLES}
	@${REINPLACE_CMD} -e '/^SUBDIRS = /s| examples | |' \
		${WRKSRC}/Makefile.in
.endif
	@${REINPLACE_CMD} -E 's|(^rrdcached_LDADD = librrd_th.la)|\1 $$\(ALL_LIBS\)|' \
		${WRKSRC}/src/Makefile.in

	@${REINPLACE_CMD} -E 's|(^rrdtool_LDADD = librrd.la)|\1 $$\(ALL_LIBS\)|' \
		${WRKSRC}/src/Makefile.in

post-install:
.if !defined(BATCH) && ${PORT_OPTIONS:MEXAMPLES}
	@${ECHO_MSG} ""
	@${ECHO_MSG} "############################################################################"
	@${ECHO_MSG} "# See ${EXAMPLESDIR} for some demonstration code        #"
	@${ECHO_MSG} "############################################################################"
.endif

.include <bsd.port.mk>
