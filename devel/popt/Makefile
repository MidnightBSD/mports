# $MidnightBSD: mports/devel/popt/Makefile,v 1.5 2011/02/02 20:17:34 laffer1 Exp $

PORTNAME=	popt
PORTVERSION=	1.16
CATEGORIES=	devel
MASTER_SITES=	http://rpm5.org/files/popt/

MAINTAINER=	ports@MidnigghtBSD.org
COMMENT=	A getopt(3) like library with a number of enhancements, from Redhat
LICENSE=	x11

CONFIGURE_ARGS=	--with-libiconv-prefix=${LOCALBASE} \
		--program-prefix=""
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomehack
USE_ICONV=	yes
USE_LDCONFIG=	yes

MAN3=		popt.3

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.else
CONFIGURE_ARGS+=--enable-nls
PLIST_SUB+=	NLS=""
USE_GETTEXT=	yes
.endif

.include <bsd.port.mk>
