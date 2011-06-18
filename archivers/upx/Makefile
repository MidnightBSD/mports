# $MidnightBSD$
# $FreeBSD: ports/archivers/upx/Makefile,v 1.12 2010/09/09 07:39:48 fjoe Exp $

PORTNAME=	upx
PORTVERSION=	3.07
CATEGORIES=	archivers
MASTER_SITES=	http://upx.sourceforge.net/download/\
		SF/sevenzip/7-Zip/${LZMA_VER}:lzma
DISTFILES=	${PORTNAME}-${PORTVERSION}-src${EXTRACT_SUFX}\
		7z${LZMA_VER:S/.//g}${EXTRACT_SUFX}:lzma

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Ultimate Packer for eXecutables
LICENSE=	gpl2

LIB_DEPENDS=	ucl.1:${PORTSDIR}/archivers/ucl

LZMA_VER=	4.65
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}-src
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_PERL5_BUILD=yes
MAKE_ENV=	UPX_UCLDIR=${LOCALBASE}\
		UPX_LZMADIR=${WRKDIR}\
		target=freebsd
NOT_FOR_ARCHS=	sparc64

PORTDOCS=	BUGS COPYING LICENSE NEWS PROJECTS README\
		README.1ST README.SRC THANKS TODO
MAN1=		upx.1
PLIST_FILES=	bin/upx

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/src/upx.out ${PREFIX}/bin/upx
	@${INSTALL_MAN} ${WRKSRC}/doc/upx.1 ${MANPREFIX}/man/man1
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}/
.endif

.include <bsd.port.mk>
