PORTNAME=	sshguard
PORTVERSION=	2.4.3
PORTREVISION=	1
CATEGORIES=	security
MASTER_SITES=	SF/sshguard/sshguard/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Protect hosts from brute-force attacks against SSH and other services
WWW=		https://www.sshguard.net/

LICENSE=	bsd2

USES=		autoreconf
USE_RC_SUBR=	sshguard

GNU_CONFIGURE=	yes
SUB_FILES=	pkg-message

post-patch:
	@${REINPLACE_CMD} -e 's|%PREFIX%|${PREFIX}|' \
		${WRKSRC}/doc/sshguard.8.rst
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|' \
		${WRKSRC}/examples/sshguard.conf.sample

post-install:
	${INSTALL} -d ${STAGEDIR}${PREFIX}/etc
	${INSTALL_DATA} ${WRKSRC}/examples/sshguard.conf.sample \
		${STAGEDIR}${PREFIX}/etc

.include <bsd.port.mk>
