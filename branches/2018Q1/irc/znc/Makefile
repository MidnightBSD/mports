# $MidnightBSD$

PORTNAME=	znc
PORTVERSION=	1.6.0
CATEGORIES=	irc ipv6
MASTER_SITES=	http://znc.in/releases/ \
		http://znc.in/releases/archive/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An advanced IRC bouncer

LICENSE=	apache2

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--disable-perl --disable-python
USE_RC_SUBR=	znc
USES=		compiler:c++11-lib cpe gmake iconv pkgconfig

NO_OPTIONS_SORT=	yes

OPTIONS_DEFINE=	DEBUG IPV6 OPENSSL CYRUS TCL CHARSET DOCS
OPTIONS_DEFAULT=	OPENSSL
OPTIONS_SUB=	yes

CYRUS_DESC=	Cyrus SASL module
DEBUG_DESC=	Debugging support
CHARSET_DESC=	Character encoding support via ICU
TCL_DESC=	Tcl scripting module

CYRUS_CONFIGURE_ON=	--enable-cyrus
CYRUS_LDFLAGS=	-L${LOCALBASE}/lib
CYRUS_LIB_DEPENDS=	libsasl2.so:${PORTSDIR}/security/cyrus-sasl2
DEBUG_CONFIGURE_ON=	--enable-debug
IPV6_CONFIGURE_OFF=	--disable-ipv6
OPENSSL_CONFIGURE_OFF=	--disable-openssl
CHARSET_CONFIGURE_OFF=	--disable-charset
CHARSET_LIB_DEPENDS=	libicuuc.so.53:${PORTSDIR}/devel/icu \
			libicudata.so.53:${PORTSDIR}/devel/icu
TCL_CONFIGURE_ENABLE=	tcl

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MOPENSSL}
EXTENSIONS+=		openssl
CONFIGURE_ARGS+=	--with-openssl=${OPENSSLBASE}
.endif

.if ${PORT_OPTIONS:MTCL}
USES+=			tcl
CONFIGURE_ARGS+=	--with-tcl=${TCL_LIBDIR}
.endif

PORTDOCS=		README.md

pre-configure:
# No need to cast to char** in AM_ICONV, fixes charset/iconv detection
# and by extension, successfully builds charset module
	@${REINPLACE_CMD} -e \
		's#(char \*\*)##g' \
		${WRKSRC}/configure
# Instead of using bundled swig generated files, delete them to force
# regeneration using swig 2.0.11+ (fixes port compilation using clang)
.if ${PORT_OPTIONS:MPERL}
	@${RM} ${WRKSRC}/modules/modperl/ZNC.cpp
.endif
.if ${PORT_OPTIONS:MPYTHON}
	@${RM} ${WRKSRC}/modules/modpython/_znc_core.cpp
.endif

post-patch:
	@${REINPLACE_CMD} -e \
		's#$$(libdir)/pkgconfig#${PREFIX}/libdata/pkgconfig#' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e \
		's#/usr/local#${LOCALBASE}#' ${WRKSRC}/configure

post-install:
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${STAGEDIR}${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${STAGEDIR}${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
