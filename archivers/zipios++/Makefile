# $MidnightBSD: mports/archivers/zipios++/Makefile,v 1.6 2011/02/02 20:03:22 laffer1 Exp $

PORTNAME=	zipios++
PORTVERSION=	0.1.5.9
PORTREVISION=	1
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_DEBIAN_POOL}
DISTNAME=	${PORTNAME}_${PORTVERSION}+cvs.2004.02.07.orig

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A java.util.zip-like C++ library for reading and writing Zip files
LICENSE=	gpl2

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	automake:env
CONFIGURE_ARGS+=--disable-static

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}+cvs.2004.02.07

# tests need CppUnit
post-patch:
	@${REINPLACE_CMD} -e 's| tests||' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|echo aout|echo elf|g' ${WRKSRC}/configure

pre-configure:
.for i in install-sh missing depcomp mkinstalldirs
	@${RM} ${WRKSRC}/${i}
	@${CP} ${AUTOMAKE_DIR}/${i} ${WRKSRC}
.endfor

post-install:
	${INSTALL_DATA} ${WRKSRC}/zipios++/zipios-config.h ${PREFIX}/include/zipios++/

.include <bsd.port.mk>
