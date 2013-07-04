# $MidnightBSD: mports/multimedia/libdvdcss/Makefile,v 1.5 2011/02/02 21:11:11 laffer1 Exp $

PORTNAME=	libdvdcss
PORTVERSION=	1.2.10
PORTREVISION=	1
CATEGORIES=	multimedia
MASTER_SITES=	http://download.videolan.org/pub/%SUBDIR%/
MASTER_SITE_SUBDIR=	${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable abstraction library for DVD decryption
LICENSE=	restricted
#gpl2, but DMCA?

NO_CDROM=	CSS code may violate the DMCA

USE_AUTOTOOLS=	libtool
USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

.ifndef(WITH_DOXYGEN)
NOPORTDOCS=	yes
.endif

.ifndef(NOPORTDOCS)
BUILD_DEPENDS+=	doxygen:${PORTSDIR}/devel/doxygen

PORTDOCS=	*
.endif

pre-everything::
.if !defined(WITH_DOXYGEN)
	@${ECHO_MSG} '==> Define WITH_DOXYGEN to build API documentation'
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|malloc.h|stdlib.h|' ${WRKSRC}/src/ioctl.c
	${REINPLACE_CMD} -e '/^pkgconfigdir/s|$$(libdir)|$$(libdir)data|' \
		${WRKSRC}/src/Makefile.in
# should we disable doc building?
.ifdef(NOPORTDOCS)
	@${REINPLACE_CMD} -E \
		-e 's|^([[:space:]]*SUBDIRS[[:space:]]*=.*)doc|\1|' \
		${BUILD_WRKSRC}/Makefile.in
.else
# we do not want the latex documents... too many dependencies just
# to get in ps what we already have in html
	@${REINPLACE_CMD} -E \
		-e 's|^([[:space:]]*all:[[:space:]]*.*)stamp-latex|\1|' \
		${BUILD_WRKSRC}/doc/Makefile.in
.endif

post-install:
.ifndef(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${INSTALL_WRKSRC}/doc/html/* ${DOCSDIR}
.endif

.include <bsd.port.mk>
