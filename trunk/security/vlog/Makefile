# New ports collection makefile for:   vlog
# Date created:                31 March 2002
# Whom:                        hannes sowa <satbran@web.de>
#
# $FreeBSD: ports/security/vlog/Makefile,v 1.13 2006/05/13 04:15:18 edwin Exp $
# $MidnightBSD: mports/security/vlog/Makefile,v 1.1 2006/11/09 14:58:36 laffer1 Exp $
#

PORTNAME=	vlog
PORTVERSION=	1.1f
PORTREVISION=	2
CATEGORIES=	security
MASTER_SITES=	http://inc2.com/download/
DISTNAME=	vlog-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A curses based real-time logfile viewer esp. useful for ipflog

ALL_TARGET=	it
MAKE_ARGS=	CFLAGS="${CFLAGS} ${PTHREAD_CFLAGS}" \
		LIBS="${PTHREAD_LIBS} -lcurses"
WRKSRC=		${WRKDIR}/vlog
USE_PERL5=	yes

MAN1=		vlog.1
MANCOMPRESSED=	no
PLIST_FILES=	bin/vlog

post-patch:
	${REINPLACE_CMD} -e "s@/usr/local@${DESTDIR}${PREFIX}@g" ${WRKSRC}/Makefile

.include <bsd.port.mk>
