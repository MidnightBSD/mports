PORTNAME=	atf
PORTVERSION=	0.21
CATEGORIES=	devel
MASTER_SITES=	https://github.com/jmmv/${PORTNAME}/releases/download/${PORTNAME}-${PORTVERSION}/ \
		FREEBSD_LOCAL/jmmv

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C, C++ and shell libraries to write ATF-compliant test programs

LICENSE=	bsd3

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
USES=		libtool

OPTIONS_DEFINE=	DOCS TEST
OPTIONS_DEFAULT=TEST

.include <bsd.mport.options.mk>

MAKE_FLAGS+=	atf_pkgconfigdir=${PREFIX}/libdata/pkgconfig
.if empty(PORT_OPTIONS:MDOCS)
MAKE_FLAGS+=	doc_DATA=
.endif
.if empty(PORT_OPTIONS:MTEST)
PLIST_SUB+=	TEST="@comment "
.else
PLIST_SUB+=	TEST=
.endif

post-install:
.if empty(PORT_OPTIONS:MTEST)
	@${RM} -r ${STAGEDIR}${PREFIX}/tests
.endif

.include <bsd.port.mk>
