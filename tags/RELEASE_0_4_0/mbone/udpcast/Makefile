# $MidnightBSD$

PORTNAME=	udpcast
PORTVERSION=	0.${RELEASE_DATE}
CATEGORIES=	mbone sysutils
MASTER_SITES=	http://udpcast.linux.lu/download/
DISTNAME=	${PORTNAME}-${RELEASE_DATE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A file transfer tool using ethernet's multicast
LICENSE=	gpl2

USE_GMAKE=	yes
USE_PERL5_BUILD=	yes
WRKSRC=	${WRKDIR}/${PORTNAME}-${RELEASE_DATE}

RELEASE_DATE=	20081213

PROGRAM_SBIN_FILES=	udp-receiver udp-sender

PLIST_FILES=	sbin/udp-receiver \
		sbin/udp-sender
PORTDOCS=	Changelog.txt cmd.html

MAN1=		udp-receiver.1 udp-sender.1

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS} -I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib"

do-install:
.ifndef(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
. for file in ${PORTDOCS}
	@${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
. endfor
.endif
.for file in ${PROGRAM_SBIN_FILES}
	@${INSTALL_PROGRAM} ${WRKSRC}/${file} ${PREFIX}/sbin/
.endfor
.for file in ${MAN1}
	@${INSTALL_MAN} ${WRKSRC}/${file} ${MANPREFIX}/man/man1/
.endfor

.include <bsd.port.mk>
