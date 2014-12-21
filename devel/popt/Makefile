# $MidnightBSD$

PORTNAME=	popt
PORTVERSION=	1.16
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	http://rpm5.org/files/popt/

MAINTAINER=	ports@MidnigghtBSD.org
COMMENT=	getopt(3) like library with a number of enhancements, from Redhat

LICENSE=	mit

CONFIGURE_ARGS=	--with-libiconv-prefix=${LOCALBASE} \
		--program-prefix=""
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
GNU_CONFIGURE=	yes
USES=		libtool pathfix iconv
USE_LDCONFIG=	yes

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.else
CONFIGURE_ARGS+=--enable-nls
PLIST_SUB+=	NLS=""
USE_GETTEXT=	yes
.endif

.include <bsd.port.mk>
