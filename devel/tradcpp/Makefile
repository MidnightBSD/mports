PORTNAME=	tradcpp
PORTVERSION=	0.5.3
CATEGORIES=	devel
MASTER_SITES=	https://ftp.NetBSD.org/pub/NetBSD/misc/dholland/ \
		FREEBSD_LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Traditional (K&R-style) C preprocessor

LICENSE=	bsd2

USES=		uidfix
MAKE_ARGS=	BINDIR=${PREFIX}/bin MANDIR=${PREFIX}/share/man/man

PLIST_FILES=	bin/tradcpp \
		share/man/man1/${PORTNAME}.1.gz

.include <bsd.port.mk>
