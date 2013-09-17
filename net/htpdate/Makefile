# $MidnightBSD$

PORTNAME=	htpdate
PORTVERSION=	1.0.5
CATEGORIES=	net ipv6
MASTER_SITES=	http://www.vervest.org/htp/archive/c/ \
		http://twekkel.home.xs4all.nl/htp/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Time synchronization over http utility

LICENSE=	gpl2

USE_BZIP2=	yes
MAKE_ARGS=	CC="${CC}" CFLAGS="${CFLAGS}"

MANCOMPRESSED=	yes
MAN8=		${PORTNAME}.8
PLIST_FILES=	bin/${PORTNAME}
PORTDOCS=	Changelog README
USE_RC_SUBR=	${PORTNAME}

.include <bsd.mport.options.mk>

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.8.gz ${MAN8PREFIX}/man/man8
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
.for doc in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${doc} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
