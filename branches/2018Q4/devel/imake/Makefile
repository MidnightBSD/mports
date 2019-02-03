# $MidnightBSD$

PORTNAME=	imake
PORTVERSION=	1.0.7
PORTEPOCH=	1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Imake and other utilities from X.Org

LICENSE=	mit

BUILD_DEPENDS=	tradcpp:devel/tradcpp
RUN_DEPENDS=	gccmakedep:devel/gccmakedep \
		makedepend:devel/makedepend \
		${LOCALBASE}/lib/X11/config/xorg.cf:x11/xorg-cf-files

USES=	shebangfix perl5 pkgconfig
USE_PERL5=	run

SHEBANG_FILES=	mkhtmlindex.pl

XORG_CAT=	util
USE_XORG=	xproto

CONFIGURE_ENV=	ac_cv_path_RAWCPP=tradcpp

.include <bsd.port.mk>
