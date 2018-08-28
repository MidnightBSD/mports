# $MidnightBSD$

PORTNAME=	upnp
PORTVERSION=	1.6.19
PORTREVISION=	2
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	SF/p${PORTNAME}/p${PORTNAME}/libUPnP%20${PORTVERSION}
DISTNAME=	lib${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Universal Plug and Play Software Development Kit

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

CONFLICTS=	upnp-1.0.*

USES=		libtool tar:bzip2
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

MAKE_ENV=	PTHREAD_LIBS=${PTHREAD_LIBS}
CONFIGURE_ENV+=	LIBS="-llwres -lcompat"

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDOCS}
CONFIGURE_ARGS+=	--with-documentation=${DOCSDIR}
PORTDOCS=	*
.else
CONFIGURE_ARGS+=	--without-documentation
.endif

.if ${PORT_OPTIONS:MDEBUG}
CONFIGURE_ARGS+=	--enable-debug
.endif

post-patch:	.SILENT
	${REINPLACE_CMD} '/^pkgconfigexecdir/s|$$(libdir)|$$(prefix)/libdata|' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
