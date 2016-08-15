# $MidnightBSD$

PORTNAME=	softflowd
PORTVERSION=	0.9.8
CATEGORIES=	net-mgmt ipv6
MASTER_SITES=	http://www2.mindrot.org/files/softflowd/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Softflowd is flow-based network traffic analyser with export
LICENSE=	bsd2

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
PLIST_FILES=	sbin/softflowd sbin/softflowctl
MAN8=		softflowd.8 softflowctl.8
PORTDOCS=	README
USE_RC_SUBR=	softflowd

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
