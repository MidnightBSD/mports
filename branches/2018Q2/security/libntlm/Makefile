# $MidnightBSD$

PORTNAME=	libntlm
PORTVERSION=	1.3
PORTREVISION=	1
CATEGORIES=	security
MASTER_SITES=	http://www.nongnu.org/libntlm/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library that implement Microsoft's NTLM authentication

LICENSE=	lgpl2.1

USES=	pathfix pkgconfig libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

PORTDOCS=	AUTHORS ChangeLog NEWS README THANKS

.include <bsd.mport.options.mk>

post-install:
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
.endif

.include <bsd.port.mk>
