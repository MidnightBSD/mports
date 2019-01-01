# $MidnightBSD$

PORTNAME=	upnp
PORTVERSION=	1.6.25
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	SF/p${PORTNAME}/p${PORTNAME}/libUPnP%20${PORTVERSION}
DISTNAME=	lib${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Universal Plug and Play Software Development Kit

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

PORTSCOUT=	skipv:1.8.3	# released on 2017-11-14; older than 1.6.25

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--disable-samples
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4
INSTALL_TARGET=	install-strip
TEST_TARGET=	check
USES=		cpe libtool pathfix tar:bzip2
CPE_VENDOR=	libupnp_project
CPE_PRODUCT=	libupnp
USE_LDCONFIG=	yes

PORTDOCS=	ixml/*.html upnp/*.html

OPTIONS_DEFINE=	DEBUG DOCS IPV6
OPTIONS_SUB=	yes

DEBUG_CONFIGURE_ON=	--enable-debug
DOCS_CONFIGURE_ON=	--with-documentation=${DOCSDIR}
DOCS_CONFIGURE_OFF=	--without-documentation
IPV6_CONFIGURE_ON=	--enable-ipv6

pre-configure:
	${REINPLACE_CMD} -e '386s,docs/dist,,' ${WRKSRC}/Makefile.in

post-fake:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/docs/dist/html && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR})
	${RM} -r ${FAKE_DESTDIR}${DOCSDIR}/examples

.include <bsd.port.mk>
