# $MidnightBSD$
# $FreeBSD: ports/sysutils/libchk/Makefile,v 1.10 2006/05/25 20:30:08 pav Exp $

PORTNAME=	libchk
PORTVERSION=	1.10.3
CATEGORIES=	sysutils
MASTER_SITES=	ftp://ftp.iDaemons.org/pub/distfiles/ \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	knu

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool to check shared library links

LICENSE=	bsd2

USES=		tar:bzip2
USE_RUBY=	yes
USE_RUBY_FEATURES=	optparse

FAKE_MAKEARGS+=	MANDIR="${TRUE_PREFIX}/man/man"

PLIST_FILES=	sbin/libchk man/man1/libchk.1.gz

.include <bsd.port.mk>
