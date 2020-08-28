PORTNAME=	git-sync
PORTVERSION=	1.1.0
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Util to keep branches in sync with remotes in git

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	yes
GH_ACCOUNT=	ctubbsii
GH_PROJECT=	git-sync
GH_TAGNAME=	067ec32

RUN_DEPENDS=	bash:shells/bash \
		git:devel/git
NO_BUILD=	yes
NO_TEST=	yes

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/git-sync ${PREFIX}/bin/git-sync

.include <bsd.port.mk>
