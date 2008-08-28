# Ports collection Makefile for:	chroot_safe
# Date created:				11 Dec 2005
# Whom:					Gabor Kovesdan
# $FreeBSD: ports/security/chroot_safe/Makefile,v 1.4 2006/08/06 10:14:56 erwin Exp $
# $MidnightBSD: mports/security/chroot_safe/Makefile,v 1.1 2006/11/25 17:10:18 laffer1 Exp $
#

PORTNAME=	chroot_safe
PORTVERSION=	1.4
PORTREVISION=	1
CATEGORIES=	security sysutils
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	chrootsafe
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A tool to chroot softwares easily

GNU_CONFIGURE=	YES

MAN1=		chroot_safe.1
PLIST_FILES=	sbin/chroot_safe libexec/chroot_safe/chroot_safe.so
PLIST_DIRS=	libexec/chroot_safe

post-patch:
	@${REINPLACE_CMD} 's|chroot(1)|chroot(8)|' ${WRKSRC}/chroot_safe.1.in
	@${REINPLACE_CMD} 's|putenv|unsetenv|' ${WRKSRC}/chroot_safe.cpp

.include <bsd.port.mk>
