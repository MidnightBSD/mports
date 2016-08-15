# $MidnightBSD$

PORTNAME=	libmpd
PORTVERSION=	11.8.17
CATEGORIES=	audio
MASTER_SITES=	http://download.sarine.nl/Programs/gmpc/11.8.16/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Abstraction around libmpdclient

LICENSE=	gpl2

GNU_CONFIGURE=	yes
USES=		libtool pathfix pkgconfig
USE_GNOME=	glib20
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's,libmpd-1.0\/libmpd,libmpd,' \
		${WRKSRC}/src/Makefile.in

.include <bsd.port.mk>
