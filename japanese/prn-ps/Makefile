PORTNAME=	prn
PORTVERSION=	1.0
PORTREVISION=	3
CATEGORIES=	japanese print
MASTER_SITES=	PORTS_JP
DISTNAME=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Yet another converter from text file to postscript (with Japanese support)

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	kcc:japanese/kcc
RUN_DEPENDS=	kcc:japanese/kcc

do-install:
.for i in cmt prn psconv
	(cd ${WRKSRC} && ${INSTALL_PROGRAM} ${i} ${PREFIX}/bin)
.endfor
	${LN} -sf prn ${PREFIX}/bin/cprn
	@${MKDIR} ${DATADIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} cmtdefs ${DATADIR})
.for i in cmt cprn prn psconv
	(cd ${WRKSRC} && ${INSTALL_MAN} ${i}.jman \
		${PREFIX}/share/man/man1/${i}.1)
.endfor
	(cd ${WRKSRC} && ${INSTALL_MAN} cmtdefs.jman \
		${PREFIX}/share/man/man5/cmtdefs.5)

.include <bsd.port.mk>
