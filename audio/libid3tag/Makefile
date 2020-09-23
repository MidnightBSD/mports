PORTNAME=	libid3tag
PORTVERSION=	0.15.1b
PORTREVISION=	3
CATEGORIES=	audio
MASTER_SITES=	SF/mad/${PORTNAME}/${PORTVERSION} \
		ftp://ftp.mars.org/pub/mpeg/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ID3 tags library (part of MAD project)

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		libtool pkgconfig
USE_LDCONFIG=	yes

BUILD_DEPENDS=	gsed:textproc/gsed

post-patch:
	@${REINPLACE_CMD} -e '/genre.dat.in/s/sed -/g&/g' ${WRKSRC}/Makefile.in

pre-build:
	cd ${WRKSRC} && ${MAKE} ./genre.dat

post-build:
	cd ${WRKSRC} && CONFIG_FILES=id3tag.pc CONFIG_HEADERS= ${SH} ./config.status

post-install:
	${MKDIR} ${PREFIX}/libdata/pkgconfig
	${INSTALL_DATA} ${WRKSRC}/id3tag.pc ${PREFIX}/libdata/pkgconfig

.include <bsd.port.mk>
