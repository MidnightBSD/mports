PORTNAME=	yash
DISTVERSION=	2.52
CATEGORIES=	shells
MASTER_SITES=	OSDN/yash

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	POSIX-compliant command line shell
WWW=		https://yash.osdn.jp/index.html.en

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		tar:xz

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--prefix=${PREFIX} --mandir=${MANPREFIX}/man
CPPFLAGS+=	-std=c99

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

NLS_USES=	gettext-runtime
NLS_CONFIGURE_ENABLE=	nls
NLS_CPPFLAGS=	-I${LOCALBASE}/include
NLS_LDFLAGS=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
