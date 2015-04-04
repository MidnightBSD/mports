# $MidnightBSD$

PORTNAME=	lmmon
PORTVERSION=	0.65
CATEGORIES=	sysutils
MASTER_SITES=	FREEBSD_LOCAL/bf

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display information gathered from MB power management controller
LICENSE=	bsd2


GNU_CONFIGURE=	yes
PLIST_FILES=	bin/lmmon

FIXFILES=	configure configure.in lmmon.c

post-patch:
	@${REINPLACE_CMD} -e 's,machine/smb.h,dev/smbus/smb.h,' \
		${FIXFILES:S,^,${WRKSRC}/,}

.include <bsd.port.mk>
