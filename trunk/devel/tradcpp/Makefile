# $MidnightBSD$

PORTNAME=	tradcpp
PORTVERSION=	0.5.2
CATEGORIES=	devel
MASTER_SITES=	http://ftp.NetBSD.org/pub/NetBSD/misc/dholland/ \
		FREEBSD_LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Traditional (K&R-style) C preprocessor

LICENSE=	bsd2

USES=		uidfix
MAKE_ARGS=	BINDIR=${PREFIX}/bin MANDIR=${MANPREFIX}/man/man

PLIST_FILES=	bin/tradcpp \
		man/man1/${PORTNAME}.1.gz

.include <bsd.port.mk>
