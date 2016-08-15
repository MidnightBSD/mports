# $FreeBSD: ports/security/vlog/Makefile,v 1.13 2006/05/13 04:15:18 edwin Exp $
# $MidnightBSD$

PORTNAME=	vlog
PORTVERSION=	1.1f
PORTREVISION=	3
CATEGORIES=	security
MASTER_SITES=	http://inc2.com/download/
DISTNAME=	vlog-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Curses based real-time logfile viewer esp. useful for ipflog

LICENSE=	gpl2

ALL_TARGET=	it
MAKE_ARGS=	CFLAGS="${CFLAGS} ${PTHREAD_CFLAGS}" \
		LIBS="${PTHREAD_LIBS} -lcurses"
WRKSRC=		${WRKDIR}/vlog
USE_PERL5=	yes

PLIST_FILES=	bin/vlog man/man1/vlog.1.gz

post-patch:
	${REINPLACE_CMD} -e "s@/usr/local@${DESTDIR}${PREFIX}@g" ${WRKSRC}/Makefile

.include <bsd.port.mk>
