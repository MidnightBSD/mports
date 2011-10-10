# $MidnightBSD: mports/graphics/jpeg/Makefile,v 1.12 2011/02/02 21:04:18 laffer1 Exp $

PORTNAME=	jpeg
PORTVERSION=	8
PORTREVISION=	3
CATEGORIES=	graphics
MASTER_SITES=	http://www.ijg.org/files/ \
		http://sylvana.net/jpegcrop/:exif
DISTNAME=	jpegsrc.v${DISTVERSION2}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		jpegexiforient.c:exif exifautotran.txt:exif
DIST_SUBDIR=	${PORTNAME}${DISTVERSION2}2
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IJG's jpeg compression utilities
LICENSE=	other

CONFLICTS=	libjpeg-turbo-[0-9]*
WRKSRC=		${WRKDIR}/${PORTNAME}-${DISTVERSION2}

DISTVERSION2=	8b
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-shared --enable-static
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd7.0
ADDITIONAL_HEADER=	jinclude.h jpegint.h

# define J_MAXMEM like "make J_MAXMEM=32" to limit max processing memory to 32Mb
.if defined(J_MAXMEM)
CONFIGURE_ARGS+=	--enable-maxmem=${J_MAXMEM}
.endif

MAN1=		cjpeg.1 djpeg.1 jpegtran.1 rdjpgcom.1 wrjpgcom.1

post-extract:
	@${CP} ${DISTDIR}/${DIST_SUBDIR}/jpegexiforient.c ${WRKSRC}/
	@${CP} ${DISTDIR}/${DIST_SUBDIR}/exifautotran.txt ${WRKSRC}/exifautotran

post-build:
	@cd ${WRKSRC} && ${CC} ${CFLAGS} -o jpegexiforient jpegexiforient.c

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${PREFIX}/share/doc/jpeg
	@${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/jpeg/
	@${INSTALL_DATA} ${WRKSRC}/*.txt ${PREFIX}/share/doc/jpeg/
.endif
.for header in ${ADDITIONAL_HEADER}
	@${INSTALL_DATA} ${WRKSRC}/${header} ${PREFIX}/include/
.endfor
	${INSTALL_PROGRAM} ${WRKSRC}/jpegexiforient ${PREFIX}/bin/
	${INSTALL_SCRIPT} ${WRKSRC}/exifautotran ${PREFIX}/bin/

.include <bsd.port.mk>
