PORTNAME=	liburcu
PORTVERSION=	0.15.3
CATEGORIES=	sysutils
MASTER_SITES=	http://lttng.org/files/urcu/
DISTNAME=	userspace-rcu-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Userspace read-copy-update (RCU) data synchronization library
WWW=		https://liburcu.org/

LICENSE=	lgpl2.1

PLIST_SUB=	SO_SHORT_VER=6 \
		SO_VER=6.0.0

USES=		pathfix libtool tar:bzip2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--docdir=${DOCSDIR}
INSTALL_TARGET=	install-strip
NO_TEST=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
