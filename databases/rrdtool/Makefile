PORTNAME=	rrdtool
DISTVERSION=	1.9.0
PORTREVISION=	0
CATEGORIES=	databases graphics
MASTER_SITES=	https://github.com/oetiker/rrdtool-1.x/releases/download/v${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Round Robin Database Tools
WWW=		https://oss.oetiker.ch/rrdtool/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cpe gmake gnome libtool pathfix pkgconfig shebangfix
CPE_VENDOR=	rrdtool_project
USE_GNOME=	glib20 libxml2
USE_LDCONFIG=	yes
USE_RC_SUBR=	rrdcached
SHEBANG_FILES=	examples/rrdcached/rrdcached-size.pl examples/stripes.py
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=	${PREFIX}/share
CONFIGURE_ARGS=	--disable-tcl
CONFIGURE_ENV=	RRDDOCDIR=${DOCSDIR:Q}
INSTALL_TARGET=	install-strip
CPPFLAGS+=	-I${LOCALBASE}/include -I${LOCALBASE}/include/freetype2
# Some symbols in the linker version script librrd.sym are undefined when the
# CACHE option is off. Suppress errors with lld >= 17 due to these undefined
# symbols.
LDFLAGS+=	-Wl,--undefined-version
CONFLICTS=	rrdtool12
PORTDOCS=	*
PORTEXAMPLES=	cgi-demo.cgi

OPTIONS_DEFINE=		DEJAVU DOCS EXAMPLES GRAPH LOCKTIMEOUT MMAP NLS PERL \
			PYTHON RUBY
OPTIONS_DEFAULT=	DEJAVU GRAPH MMAP PERL
OPTIONS_SUB=		yes
DEJAVU_DESC=		Use DejaVu fonts (requires X11)
GRAPH_DESC=		Enable the rrdtool graph command (needs cairo)
LOCKTIMEOUT_DESC=	Enable the patch for lock timeout
MMAP_DESC=		Use mmap in rrd_update
PERL_DESC=		Build PERL module
PYTHON_DESC=		Build PYTHON bindings
RUBY_DESC=		Build RUBY bindings

DEJAVU_RUN_DEPENDS=		dejavu>0:x11-fonts/dejavu
DOCS_USES=			groff
DOCS_CONFIGURE_ENABLE=		docs
EXAMPLES_CONFIGURE_ENABLE=	examples
GRAPH_LIB_DEPENDS=		libfreetype.so:print/freetype2 \
				libharfbuzz.so:print/harfbuzz \
				libpng.so:graphics/png
GRAPH_USE=			GNOME=cairo,pango
GRAPH_CONFIGURE_OFF=		--disable-rrd_graph \
				--disable-rrdcgi
LOCKTIMEOUT_EXTRA_PATCHES=	${PATCHDIR}/extra-patch-locktimeout
MMAP_CONFIGURE_ENABLE=		mmap
NLS_USES=			gettext localbase
NLS_USE=			GNOME=intltool
NLS_CONFIGURE_ENABLE=		nls
PERL_USES=			perl5
PERL_CONFIGURE_ON=		--enable-perl \
				--enable-perl-site-install
PERL_CONFIGURE_OFF=		--disable-perl
PERL_MAKE_ARGS=			PERL_MAKE_OPTIONS='PREFIX="${PREFIX}" INSTALLPRIVLIB="${PREFIX}/lib" INSTALLARCHLIB="${PREFIX}/lib"'
PERL_PORTEXAMPLES=		4charts.pl bigtops.pl minmax.pl perftest.pl \
				piped-demo.pl rrdcached/rrdcached-size.pl \
				rrdcached/RRDCached.pm shared-demo.pl \
				stripes.pl
PYTHON_BUILD_DEPENDS=		${PY_SETUPTOOLS}
PYTHON_USES=			python
PYTHON_USE=			PYTHON=flavors,optsuffix
PYTHON_CONFIGURE_ENABLE=	python
PYTHON_PORTEXAMPLES=		stripes.py
RUBY_USES=			ruby
RUBY_CONFIGURE_ENABLE=		ruby

post-extract:
	@${REINPLACE_CMD} -E 's|(^rrdtool_LDADD = librrd.la)|\1 $$\(ALL_LIBS\)|' \
		${WRKSRC}/src/Makefile.in

post-install-EXAMPLES-on:
.if !defined(BATCH)
	@${ECHO_MSG} ""
	@${ECHO_MSG} "############################################################################"
	@${ECHO_MSG} "# See ${EXAMPLESDIR} for some demonstration code        #"
	@${ECHO_MSG} "############################################################################"
.endif

post-install-PERL-on:
	${STRIP_CMD} ${FAKE_DESTDIR}${PREFIX}/${SITE_ARCH_REL}/auto/RRDs/RRDs.so

post-install-PERL-off:
	${RM} ${FAKE_DESTDIR}${EXAMPLESDIR}/*.pl
	${RM} -r ${FAKE_DESTDIR}${EXAMPLESDIR}/rrdcached

post-install-PYTHON-on:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/rrdtool.so

post-install-PYTHON-off:
	${RM} ${FAKE_DESTDIR}${EXAMPLESDIR}/stripes.py

post-install-RUBY-on:
	${STRIP_CMD} ${FAKE_DESTDIR}${RUBY_SITEARCHLIBDIR}/RRD.so

.include <bsd.port.mk>
