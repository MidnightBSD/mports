PORTNAME=	gccmakedep
PORTVERSION=	1.0.4
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create dependencies in makefiles using 'gcc -M'

LICENSE=	unknown

USES=		tar:xz xorg-cat:util

BUILD_DEPENDS=	tradcpp:devel/tradcpp

PLIST_FILES=	bin/gccmakedep share/man/man1/gccmakedep.1.gz
GNU_CONFIGURE_MANPREFIX=	${PREFIX}/share
CONFIGURE_ENV+=	ac_cv_path_RAWCPP=tradcpp

NO_ARCH=	yes

.include <bsd.port.mk>
