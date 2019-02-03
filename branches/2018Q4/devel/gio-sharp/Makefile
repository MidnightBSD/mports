# $MidnightBSD$

PORTNAME=	gio-sharp
PORTVERSION=	2.22.3
CATEGORIES=	devel
MASTER_SITES=	http://download.mono-project.com/sources/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GIO bindings not available in gtk-sharp

LICENSE=	mit

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	ac_cv_path_CSC=${LOCALBASE}/bin/mcs
USES=		gmake pathfix pkgconfig tar:bzip2
USE_GNOME=	gtksharp20

MAKE_JOBS_UNSAFE=yes

.include <bsd.port.mk>
