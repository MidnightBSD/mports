PORTNAME=	npth
PORTVERSION=	1.6
CATEGORIES=	devel
MASTER_SITES=	GNUPG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	New GNU Portable Threads

LICENSE=	lgpl3 gpl3
LICENSE_COMB=	dual

USES=		tar:bzip2 libtool
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
