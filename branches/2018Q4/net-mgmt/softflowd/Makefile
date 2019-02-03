# $MidnightBSD$

PORTNAME=	softflowd
PORTVERSION=	0.9.8
PORTREVISION=	1
CATEGORIES=	net-mgmt ipv6
MASTER_SITES=	http://www2.mindrot.org/files/softflowd/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Softflowd is flow-based network traffic analyser with export
LICENSE=	bsd2

GNU_CONFIGURE=	yes
USES=		gmake
PLIST_FILES=	sbin/softflowd sbin/softflowctl \
		man/man8/softflowd.8.gz \
		man/man8/softflowctl.8.gz
PORTDOCS=	README
USE_RC_SUBR=	softflowd

OPTIONS_DEFINE=	DOCS

post-install:
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${DOCSDIR}

.include <bsd.port.mk>
