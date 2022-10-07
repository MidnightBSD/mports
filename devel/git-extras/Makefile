PORTNAME=	git-extras
PORTVERSION=	6.4.0
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sub-commands for repo summary, repl, changelog population, and more
WWW=		https://github.com/tj/git-extras/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	bash:shells/bash \
		git:devel/git

USES=		gmake

USE_GITHUB=	yes
GH_ACCOUNT=	tj

NO_ARCH=	yes
NO_BUILD=	yes

post-install:
	${CP} -f ${WRKSRC}/man/git-*.1 ${PREFIX}/man/man1/


.include <bsd.port.mk>
