PORTNAME=	security-advisory-client
PORTVERSION=	1.0.7
CATEGORIES=	security

MAINTAINER=	luke@midnightbsd.org
COMMENT=	Checks installed packages for vulnerabilities

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS+=	p5-LWP-Protocol-https>=0:www/p5-LWP-Protocol-https \
		p5-JSON>=0:converters/p5-JSON \
		p5-version>=0:devel/p5-version \
		p5-Try-Tiny>=0:lang/p5-Try-Tiny \
		p5-URI-Encode>=0:www/p5-URI-Encode

USE_GITHUB=     yes
GH_PROJECT=     security-advisory-client
GH_ACCOUNT=     midnightbsd
GH_TAGNAME=     ${PORTVERSION}

NO_BUILD=	yes

do-install:
	${MKDIR} ${PREFIX}/etc/periodic/daily
	${INSTALL_SCRIPT} ${WRKSRC}/advisory.pl ${PREFIX}/bin/advisory.pl
	${INSTALL_SCRIPT} ${WRKSRC}/310.advisorymport ${PREFIX}/etc/periodic/daily/

.include <bsd.port.mk>
