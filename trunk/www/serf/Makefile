# $MidnightBSD$

PORTNAME=	serf
PORTVERSION=	1.2.1
CATEGORIES=	www
MASTER_SITES=	GOOGLE_CODE
MASTER_SITE_SUBDIR=	db

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Serf HTTP client library

LICENSE=	apache2

LIB_DEPENDS+=	apr-1:${PORTSDIR}/devel/apr

USE_BZIP2=	yes
USES=		pathfix
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS+=	--with-apr=${LOCALBASE}/bin/apr-1-config \
			--with-apr-util=${LOCALBASE}/bin/apu-1-config

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e '/^Requires.private/d' ${WRKSRC}/serf.pc.in

post-install:
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/design-guide.txt ${DOCSDIR}
.endif

regression-test:
	@(cd ${WRKSRC} && ${MAKE} check)

.include <bsd.port.mk>
