PORTNAME=	imake
PORTVERSION=	1.0.8
PORTEPOCH=	1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Imake and other utilities from X.Org

LICENSE=	mit

BUILD_DEPENDS=	tradcpp:devel/tradcpp
RUN_DEPENDS=	gccmakedep:devel/gccmakedep \
		makedepend:devel/makedepend \
		${LOCALBASE}/lib/X11/config/xorg.cf:x11/xorg-cf-files

USE_PERL5=	run

SHEBANG_FILES=	mkhtmlindex.pl

USES=		shebangfix perl5 pkgconfig xorg xorg-cat:util
USE_XORG=	xorgproto

CONFIGURE_ENV=	ac_cv_path_RAWCPP=tradcpp

.include <bsd.port.mk>
