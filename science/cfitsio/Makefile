# $MidnightBSD: mports/science/cfitsio/Makefile,v 1.3 2009/12/28 17:22:29 laffer1 Exp $

PORTNAME=	cfitsio
PORTVERSION=	3.100
CATEGORIES=	science astro
MASTER_SITES=	ftp://heasarc.gsfc.nasa.gov/software/fitsio/c/ \
		ftp://heasarc.gsfc.nasa.gov/software/fitsio/c/oldvers/
DISTNAME=	${PORTNAME}${PORTVERSION:S/.//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for reading and writing files in FITS data format
LICENSE=	gpl2
# worst case..

LIB_DEPENDS=	f2c.2:${PORTSDIR}/lang/f2c

WRKSRC=		${WRKDIR}/${PORTNAME}

USE_GNOME=	 pkgconfig
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	ac_cv_prog_FC="f2c"
ALL_TARGET=	shared
USE_LDCONFIG=	yes

post-patch:
	@${GREP} -lR "<malloc.\h>" ${WRKSRC} | ${XARGS} ${REINPLACE_CMD} -e \
		's|<malloc\.h>|<stdlib.h>|g'
	@${REINPLACE_CMD} -e 's|="\.so"|=".so.0"|g' ${WRKSRC}/configure

do-install:
.for file in drvrsmem.h fitsio.h fitsio2.h longnam.h
	${INSTALL_DATA} ${WRKSRC}/${file} ${PREFIX}/include
.endfor
.for f in libcfitsio.so.0
	${INSTALL_DATA} ${WRKSRC}/${f} ${PREFIX}/lib
.endfor
	@${LN} -sf libcfitsio.so.0 ${PREFIX}/lib/libcfitsio.so
.for f in cfitsio.pc
	${INSTALL_DATA} ${WRKSRC}/${f} ${PREFIX}/libdata/pkgconfig
.endfor
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.doc ${DOCSDIR}
.endif

.include <bsd.port.mk>
