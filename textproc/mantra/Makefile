PORTNAME=	mantra
DISTVERSION=	0.1.1
CATEGORIES=	textproc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CLI for previewing mandoc manual pages with live auto-reload in a pager

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	entr:sysutils/entr \
		tmux:sysutils/tmux

USE_GITHUB=	yes
GH_ACCOUNT=	0mp

MAKE_ENV=	VERSION=${DISTVERSION}

NO_ARCH=	yes

PLIST_FILES=	bin/${PORTNAME}

.include <bsd.port.mk>
