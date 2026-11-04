PORTNAME=	git-codereview
PORTVERSION=	1.0.3
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command-line tool for working with Gerrit

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go

USE_GITHUB=	yes
GH_ACCOUNT=	golang
GH_PROJECT=	review

GO_PKGNAME=	golang.org/x/review
GO_TARGET=	./git-codereview

PLIST_FILES=	bin/git-codereview

.include <bsd.port.mk>
