PORTNAME=	git-sync
PORTVERSION=	1.2.1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Util to keep branches in sync with remotes in git

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	yes
GH_ACCOUNT=	ctubbsii
GH_PROJECT=	git-sync
GH_TAGNAME=	38cb886

RUN_DEPENDS=	bash:shells/bash \
		git:devel/git
NO_BUILD=	yes
NO_TEST=	yes

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/git-sync ${PREFIX}/bin/git-sync

.include <bsd.port.mk>
