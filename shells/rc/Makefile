

PORTNAME=	rc
PORTVERSION=	1.7.4
PORTREVISION=	2
CATEGORIES=	shells plan9
MASTER_SITES=	http://static.tobold.org/rc/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Unix incarnation of the plan9 shell

LICENSE=	zlib
LICENSE_FILE=	${WRKSRC}/COPYING

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-history

OPTIONS_DEFINE=	READLINE

READLINE_USES=		readline
READLINE_CONFIGURE_ON=	--with-edit=readline
READLINE_MAKE_ARGS_OFF=	CFLAGS="${CFLAGS} -static"

.include <bsd.port.mk>
