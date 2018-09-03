# $MidnightBSD$

PORTNAME=	exiv2
PORTVERSION=	0.23
CATEGORIES=	graphics
MASTER_SITES=	http://www.exiv2.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Exif and Iptc metadata manipulation library and tools

LICENSE=	gpl2

LIB_DEPENDS=	libexpat.so:textproc/expat2

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

USES=		gmake
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
ALLTARGET=	all
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

post-patch:
	@${REINPLACE_CMD} -e 's|echo aout|echo elf|' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|(libdir)/pkgconfig|(prefix)/libdata/pkgconfig|' ${WRKSRC}/src/Makefile

.include <bsd.port.mk>
