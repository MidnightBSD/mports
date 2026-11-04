PORTNAME=	freecolor
PORTVERSION=	0.9.3
CATEGORIES=	sysutils
MASTER_SITES=	http://www.rkeene.org/files/oss/freecolor/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Displays free memory as a bargraph
WWW=		https://www.rkeene.org/oss/freecolor/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libstatgrab.so:devel/libstatgrab

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4
MAKE_ENV+=	INSTALL="${INSTALL}" INSTALL_PROGRAM="${INSTALL_PROGRAM}"
USES=		pkgconfig

PLIST_FILES=	bin/freecolor share/man/man1/freecolor.1.gz

.include <bsd.port.mk>
