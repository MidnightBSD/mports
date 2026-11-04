PORTNAME=	libchk
PORTVERSION=	1.10.3
PORTREVISION=	2
CATEGORIES=	sysutils
MASTER_SITES=	ftp://ftp.iDaemons.org/pub/distfiles/ \
		FREEBSD_LOCAL/knu

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool to check shared library links
WWW=		http://svn.idaemons.org/cgi-bin/viewvc.cgi/trunk/?root=libchk

LICENSE=	bsd2

FAKE_OPTS=	trueprefix

USES=		ruby tar:bzip2 uidfix

FAKE_MAKEARGS+=	MANDIR="${TRUE_PREFIX}/share/man/man"

PLIST_FILES=	sbin/libchk share/man/man1/libchk.1.gz

.include <bsd.port.mk>
