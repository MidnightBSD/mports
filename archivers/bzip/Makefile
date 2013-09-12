# $MidnightBSD: mports/archivers/bzip/Makefile,v 1.5 2012/02/24 01:29:04 laffer1 Exp $

PORTNAME=	bzip
PORTVERSION=	0.21
PORTREVISION=	1
CATEGORIES=	archivers
MASTER_SITES=	ftp://ftp.42.org/pub/OLD/b/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A block-sorting file compressor

LICENSE=	restricted
# its gpl2 but patent issues

RESTRICTED=	may be covered by patents
MAN1=		bzip.1 bunzip.1
USE_CSTD=	gnu89

PLIST_FILES=	bin/bzip bin/bunzip

pre-install:
	@${CAT} ${FILESDIR}/COPYRIGHT

do-install:
	${RM} -f ${PREFIX}/bin/bzip ${TARGETDIR}/bin/bunzip
	${INSTALL_PROGRAM} ${WRKSRC}/bzip ${TARGETDIR}/bin/bzip
	${LN} -fs ${TARGETDIR}/bin/bzip ${TARGETDIR}/bin/bunzip
	${INSTALL_MAN} ${WRKSRC}/bzip.1 ${MAN1PREFIX}/man/man1/bzip.1
	${INSTALL_MAN} ${WRKSRC}/bzip.1 ${MAN1PREFIX}/man/man1/bunzip.1

.include <bsd.port.mk>
