PORTNAME=	git-lfs
DISTVERSIONPREFIX=	v
DISTVERSION=	2.7.2
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Git extension for versioning large files

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	bash:shells/bash
RUN_DEPENDS=	bash:shells/bash \
		git:devel/git

USES=		go:modules
USE_GITHUB=	yes
PLIST_FILES=	bin/git-lfs

GO_PKGNAME=	github.com/${PORTNAME}/${PORTNAME}

# see https://github.com/git-lfs/git-lfs/wiki/Installation

do-build:
	cd ${WRKSRC} && ${MKDIR} ${WRKSRC}/.tmp && TMPDIR=${WRKSRC}/.tmp script/bootstrap

pre-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/git-lfs ${STAGEDIR}${PREFIX}/bin/git-lfs

.include <bsd.port.mk>
