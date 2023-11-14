PORTNAME=	git-absorb
DISTVERSION=	0.6.10
CATEGORIES=	devel

MAINTAINER=	ports@MidightBSD.org
COMMENT=	Git command for automating fixup/autosquash commits
WWW=		https://github.com/tummychow/git-absorb

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.md

LIB_DEPENDS=	libgit2.so:devel/libgit2

USES=		cargo
USE_GITHUB=	yes
GH_ACCOUNT=	tummychow

PLIST_FILES=	bin/git-absorb

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/git-absorb

.include <bsd.port.mk>
