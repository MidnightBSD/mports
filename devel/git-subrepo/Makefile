PORTNAME=	git-subrepo
DISTVERSION=	0.4.3
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Git command for managing subrepositories

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/License

RUN_DEPENDS=	bash:shells/bash \
		git:devel/git
BUILD_DEPENDS+=	${RUN_DEPENDS}

USES=		gmake

USE_GITHUB=	yes
GH_ACCOUNT=	ingydotnet

NO_ARCH=	yes
NO_BUILD=	yes

MAKE_ARGS=	INSTALL_MAN1="\$${PREFIX}/share/man/man1"

.include <bsd.port.mk>
