# $MidnightBSD$

PORTNAME=	security-advisory-client
PORTVERSION=	1.0.2
CATEGORIES=	security

MAINTAINER=	luke@midnightbsd.org
COMMENT=	Checks installed packages for vulnerabilities

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS+=	p5-LWP-Protocol-https>=0:www/p5-LWP-Protocol-https

WRKSRC=         ${WRKDIR}/${PORTNAME}-${PORTVERSION}
USE_GITHUB=     yes
GH_PROJECT=     security-advisory-client
GH_ACCOUNT=     laffer1
GH_TAGNAME=     ${PORTVERSION}
GH_COMMIT=      853ee15

NO_BUILD=	yes

PORTDOCS=	*

do-install:
	${MKDIR} ${PREFIX}/etc/periodic/daily
	${INSTALL_SCRIPT} ${WRKSRC}/advisory.pl ${PREFIX}/bin/advisory.pl
	${INSTALL_SCRIPT} ${WRKSRC}/310.advisorymport ${PREFIX}/etc/periodic/daily/

.include <bsd.port.mk>
