# $MidnightBSD: mports/sysutils/dvdbackup/Makefile,v 1.1 2007/04/27 21:14:50 laffer1 Exp $

PORTNAME=	dvdbackup
PORTVERSION=	0.1.1
CATEGORIES=	sysutils
MASTER_SITES=	http://dvd-create.sourceforge.net/ GENTOO/distfiles

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Backup content from DVD to hard disk
LICENSE=	gpl2

LIB_DEPENDS=	dvdread.4:${PORTSDIR}/multimedia/libdvdread

WRKSRC=		${WRKDIR}/${PORTNAME}
PLIST_FILES=	bin/dvdbackup
PORTDOCS=	README

do-build:
	${CC} -o ${WRKSRC}/dvdbackup ${CFLAGS} -I${LOCALBASE}/include \
		-L${LOCALBASE}/lib -ldvdread ${WRKSRC}/src/dvdbackup.c

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/dvdbackup ${PREFIX}/bin
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.mk>
