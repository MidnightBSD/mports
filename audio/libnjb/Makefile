PORTNAME=	libnjb
PORTVERSION=	2.2.7
PORTREVISION=	0
CATEGORIES=	audio
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C library, API for communicating with Creative and Dell audio players

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		pathfix libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDOCS}
BUILD_DEPENDS+=	doxygen:${PORTSDIR}/devel/doxygen
.else
CONFIGURE_ENV+=	ac_cv_prog_HAVE_DOXYGEN=no
.endif

post-patch:
	@${REINPLACE_CMD} -e \
		'/^SHOW_DIRECTORIES/d' ${WRKSRC}/doc/Doxyfile.in
	@${REINPLACE_CMD} -e \
		'/pkgdocdir/s|-$$(VERSION)||g' ${WRKSRC}/doc/Makefile.in

.include <bsd.port.mk>
