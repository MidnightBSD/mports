# Created by: Juraj Lutter <otis@sk.freebsd.org>

PORTNAME=	libconfuse
PORTVERSION=	3.3
CATEGORIES=	devel
MASTER_SITES=	https://github.com/libconfuse/libconfuse/releases/download/v${PORTVERSION}/
DISTNAME=	confuse-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Configuration file parsing library

LICENSE=	iscl

USES=		iconv libtool pathfix pkgconfig tar:xz
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared --disable-examples
INSTALL_TARGET=	install-strip
TEST_TARGET=	check

OPTIONS_DEFINE=		NLS
OPTIONS_SUB=		yes

NLS_USES=			gettext
NLS_CONFIGURE_ENABLE=		nls

.include <bsd.port.mk>
