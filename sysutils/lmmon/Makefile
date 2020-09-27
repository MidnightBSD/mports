# $MidnightBSD$

PORTNAME=	lmmon
PORTVERSION=	0.65
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	FREEBSD_LOCAL/bf

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display information gathered from MB power management controller
LICENSE=	bsd2


USES=		ncurses uidfix
GNU_CONFIGURE=	yes
MAKE_ARGS+=	LDFLAGS="${LDFLAGS} -lncurses"

ONLY_FOR_ARCHS=	i386 amd64

PLIST_FILES=	bin/lmmon man/man8/lmmon.8.gz

FIXFILES=	configure configure.in lmmon.c

post-patch:
	@${REINPLACE_CMD} -e 's,machine/smb.h,dev/smbus/smb.h,' \
		${FIXFILES:S,^,${WRKSRC}/,}

.include <bsd.port.mk>
