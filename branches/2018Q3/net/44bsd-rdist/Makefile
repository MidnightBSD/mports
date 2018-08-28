# $MidnightBSD$

PORTNAME=	44bsd-rdist
PORTVERSION=	20001111
PORTREVISION=	2
CATEGORIES=	net
MASTER_SITES=	FREEBSD_LOCAL/cy

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The traditional 4.4BSD rdist

LICENSE=        bsd3

USES=		tar:bzip2

NO_WRKSUBDIR=	yes
PLIST_FILES=	bin/44bsd-rdist \
		man/man1/44bsd-rdist.1.gz

.include <bsd.port.pre.mk>

post-extract:
	cd ${WRKSRC} ; co RCS/*,v

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/rdist ${PREFIX}/bin/44bsd-rdist
	${INSTALL_MAN} ${WRKSRC}/rdist.1 ${PREFIX}/man/man1/44bsd-rdist.1

tarup:
	-cd ${WRKSRC} ; ${RM} *
	cd ${WRKSRC} ; ${TAR} cvyf /tmp/${PORTNAME}-${PORTVERSION}${EXTRACT_SUFX} .

.include <bsd.port.post.mk>
