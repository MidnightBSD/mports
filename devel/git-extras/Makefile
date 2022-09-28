PORTNAME=	git-extras
PORTVERSION=	6.4.0
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sub-commands for repo summary, repl, changelog population, and more

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	bash:shells/bash \
		git:devel/git

USES=		gmake

USE_GITHUB=	yes
GH_ACCOUNT=	tj

NO_ARCH=	yes
NO_BUILD=	yes

.include <bsd.port.mk>
