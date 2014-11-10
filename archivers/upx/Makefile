# $MidnightBSD$
# $FreeBSD: ports/archivers/upx/Makefile,v 1.12 2010/09/09 07:39:48 fjoe Exp $

PORTNAME=	upx
PORTVERSION=	3.91
PORTREVISION=	0
CATEGORIES=	archivers
MASTER_SITES=	http://upx.sourceforge.net/download/\
		SF/sevenzip/7-Zip/${LZMA_VER}:lzma
DISTFILES=	${PORTNAME}-${PORTVERSION}-src${EXTRACT_SUFX}\
		7z${LZMA_VER:S/.//g}${EXTRACT_SUFX}:lzma

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Ultimate Packer for eXecutables

LICENSE=	gpl2

LIB_DEPENDS=	libucl.so:${PORTSDIR}/archivers/ucl

LZMA_VER=	4.65
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}-src
USES=		gmake tar:bzip2
USE_PERL5_BUILD=yes
MAKE_ENV=	UPX_UCLDIR=${LOCALBASE}\
		UPX_LZMADIR=${WRKDIR}\
		target=freebsd

PORTDOCS=	BUGS COPYING LICENSE NEWS PROJECTS README\
		README.1ST README.SRC THANKS TODO
PLIST_FILES=	bin/upx \
		man/man1/upx.1.gz

OPTIONS_DEFINE=	DOCS

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/src/upx.out ${PREFIX}/bin/upx
	@${INSTALL_MAN} ${WRKSRC}/doc/upx.1 ${MANPREFIX}/man/man1
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}/

.include <bsd.port.mk>
