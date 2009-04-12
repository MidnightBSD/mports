# $MidnightBSD$

PORTNAME=	lmmon
PORTVERSION=	0.65
CATEGORIES=	sysutils
MASTER_SITES=	http://www.fxp.org/~jedgar/lmmon/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display information gathered from MB power management controller
LICENSE=	bsd2

ONLY_FOR_ARCHS=	i386 amd64

GNU_CONFIGURE=	yes
MAN8=		lmmon.8
MANCOMPRESSED=	yes
PLIST_FILES=	bin/lmmon

FIXFILES=	configure configure.in lmmon.c

post-patch:
	@${REINPLACE_CMD} -e 's,machine/smb.h,dev/smbus/smb.h,' \
		${FIXFILES:S,^,${WRKSRC}/,}

.include <bsd.port.mk>
